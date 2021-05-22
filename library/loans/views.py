from .fines import search_bycharge, search_byuser, save_fines
from django.shortcuts import render, get_object_or_404
from django.views import generic
from django.db.models import Q
from .models import Loan, BookInstance, Fine
from catalogue.models import Book
from datetime import datetime, timedelta, date
from django.http import HttpResponseRedirect
from django.urls import reverse
from django.contrib.auth.decorators import login_required, permission_required, user_passes_test
from django.contrib.auth.mixins import LoginRequiredMixin, PermissionRequiredMixin


# Vistas de la app de préstamos.
class LoansView(PermissionRequiredMixin, LoginRequiredMixin, generic.ListView):
    model = Loan
    template_name = 'loans/all_loans.html'
    context_object_name = 'loans_list'
    paginate_by = '10'
    permission_required = 'loans.marcar_regresado'

    # Búsqueda de los préstamos de cierto libro.
    def search_byuuid(self, query):
        return Loan.objects.select_related('borrower').select_related('borrowed_book').select_related('borrowed_book__book').filter(Q(borrowed_book__status='e') & Q(return_status='n'), borrowed_book__id__iexact=query)

    # Búsqueda de los préstamos hechos por ciertos usuarios.
    def search_byuser(self, query):
        return Loan.objects.select_related('borrower').select_related('borrowed_book').select_related('borrowed_book__book').filter(Q(borrowed_book__status='e') & Q(return_status='n'), borrower__username__iexact=query)

    def search_byid(self, query):
        return Loan.objects.filter(Q(borrowed_book__status='e') & Q(return_status='n'), id=query)

    def get_queryset(self):
        query = self.request.GET.get('search')
        query_type = self.request.GET.get('type')
        queries = {'uuid': self.search_byuuid, 'user': self.search_byuser,
                   'id': self.search_byid}

        if query is None:
            return Loan.objects.select_related('borrower').select_related('borrowed_book').select_related('borrowed_book__book').filter(Q(return_status='n'), borrowed_book__status='e').order_by('made_on')

        return queries[query_type](query).order_by('made_on')


class UserLoansView(LoginRequiredMixin, generic.ListView):
    model = Loan
    template_name = 'loans/user_loans.html'
    context_object_name = 'loans_list'
    paginate_by = 10

    def get_queryset(self):
        return Loan.objects.select_related('borrowed_book').filter(Q(borrowed_book__status='e') & Q(return_status='n'), borrower=self.request.user)


def group_required(*groups):
    def in_groups(user):
        if user.is_authenticated:
            if bool(user.groups.filter(name__in=groups)) | user.is_superuser:
                return True

            return False

    return user_passes_test(in_groups)


@login_required
def loan(request, book_uuid):
    book_copy = get_object_or_404(BookInstance, pk=book_uuid)
    active_fines = Fine.objects.filter(Q(loan__borrower=request.user) &
                                       Q(charge__gt=0) & Q(loan__return_status='n'), paid=False)

    # Si el usuario actual tiene multas activas sin pagar, no puede
    # hacer un préstamo.
    if active_fines or book_copy.status != 'd':
        return render(request, 'catalogue/book_detail.html', context={'error_message': 'No puede hacer préstamos',
                                                                      'book': get_object_or_404(Book, pk=book_copy.book.isbn)})

    new_loan = Loan(borrowed_book=book_copy, borrower=request.user,
                    expires=datetime.today() + timedelta(days=7))
    # Con cada préstamo se crea una multa asociada, que empieza en 0.
    loan_fine = Fine(loan=new_loan)
    loan.fine = loan_fine
    # Marcamos el libro en préstamo.
    book_copy.status = 'e'
    new_loan.save()
    book_copy.save()
    loan_fine.save()
    # Ya se añadió el préstamo, redireccionemos a la página
    # de los préstamos hechos por el usuario.
    return HttpResponseRedirect(reverse('loans:user_loans'))


@login_required
@group_required('Bibliotecarios')
def mark_returned(request, loan_id):
    # Si el administrador hace click en el
    # botón, se marcará como regresado.
    loan = get_object_or_404(Loan, pk=loan_id)
    book_copy = get_object_or_404(BookInstance, pk=loan.borrowed_book.id)
    fine = get_object_or_404(Fine, pk=loan.fine.id)
    loan.return_status = 'd'
    book_copy.status = 'd'
    fine.paid = True
    book_copy.save()
    loan.save()
    fine.save()

    return HttpResponseRedirect(reverse('loans:all_loans'))


@login_required
@group_required('Bibliotecarios')
def renew(request, loan_id):
    loan = get_object_or_404(Loan, pk=loan_id)
    active_fines = Loan.objects.select_related('borrowed_book').select_related('fine').filter(Q(expires__lt=date.today()) & Q(borrowed_book__status='e'))
    # fine = get_object_or_404(Fine, pk=loan.fine.id)
    # book_copy = get_object_or_404(BookInstance, pk=loan.book.uuid)

    # Si la siguiente condición se cumple, hacer el préstamo
    # no es posible.
    if active_fines or loan.renewals >= 2:
        return render(request, 'catalogue/book_detail.html', {'book': loan.borrowed_book.book,
                                                              'error_message': "No le es posible renovar el préstamo."})

    loan.expires = loan.expires + timedelta(days=7)
    loan.renewals += 1
    loan.save()

    return HttpResponseRedirect(reverse('loans:all_loans'))


@group_required('Usuarios')
def fines_view(request):
    no_fines = "No tiene multas activas."
    user = request.user
    # Recuperaremos todas las multas activas (i.e. cuyos préstamos han vencido).
    user_fines = Fine.objects.select_related('loan').select_related('loan__borrowed_book').select_related('loan__borrowed_book__book').filter(Q(loan__expires__lt=date.today()) & Q(loan__borrowed_book__status='e') & Q(loan__return_status='n'), loan__borrower=user)

    # Si no hay multas, la página le avisará al usuario.
    if not user_fines:
        return render(request, 'loans/user_fines.html', context={'no_fines': no_fines})

    save_fines(user_fines)

    return render(request, 'loans/user_fines.html', context={'fines_list': user_fines})

@group_required('Bibliotecarios')
def all_fines_view(request):
    query = request.GET.get('search')
    query_type = request.GET.get('type')
    queries = {'user': search_byuser, 'charge': search_bycharge}

    if query is None:
        fines_list = Fine.objects.select_related('loan').select_related('loan__borrower').select_related('loan__borrowed_book__book').filter(Q(loan__expires__lt=date.today()) & Q(loan__borrowed_book__status='e')).order_by('charge')
    else:
        fines_list = queries[query_type](query).order_by('charge')

    save_fines(fines_list)

    return render(request, 'loans/all_fines.html', context={'fines_list': fines_list})
