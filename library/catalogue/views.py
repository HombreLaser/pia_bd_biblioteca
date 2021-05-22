from django.shortcuts import render, get_object_or_404, redirect
from django.http import HttpResponse, Http404, HttpResponseRedirect
from django.template import loader
from django.urls import reverse, reverse_lazy
from django.views import generic
from django.views.generic import CreateView, DeleteView
from django.contrib.auth.mixins import LoginRequiredMixin, PermissionRequiredMixin
from django.db.models import Q
from django.contrib.auth import login, authenticate
from django.contrib.auth.models import Group
from catalogue.models import Book, Author, Editor, Address, Street, PostalCode, City
from catalogue.forms import SignUpForm
from loans.models import BookInstance
from loans.views import group_required


# Vista de registro de usuario.
def signup_view(request):
    if request.method == 'POST':
        form = SignUpForm(request.POST)
        if form.is_valid():
            user = form.save(commit=False)
            user.save()
            user.groups.add(Group.objects.get(name='Usuarios'))
            login(request, user)

            return redirect('catalogue:index')
        else:
            return render(request, 'signup.html', {'form': form, 'error_signup': 'Ocurrió un error en su registro, intente de nuevo.'})
    else:
        form = SignUpForm()

        return render(request, 'signup.html', {'form': form})


# Vistas del catálogo.
class IndexView(generic.ListView):
    template_name = 'catalogue/index.html'
    context_object_name = 'book_list'
    paginate_by = 5

    def search_bytitle(self, query):
        return Book.objects.select_related('author').filter(title__icontains=query)

    def search_byauthor(self, query):
        return Book.objects.select_related('author').filter(author__name__icontains=query)

    def search_byyear(self, query):
        return Book.objects.select_related('author').filter(year__iexact=query)

    def search_bycountry(self, query):
        return Book.objects.select_related('author').filter(year__iexact=query)

    def search_bygenre(self, query):
        return Book.objects.select_related('author').filter(Q(genre__icontains=query) | Q(genre__iexact=query))

    def get_queryset(self):
        query = self.request.GET.get('search')
        query_type = self.request.GET.get('type')
        queries = {'title': self.search_bytitle, 'author': self.search_byauthor,
                   'year': self.search_byyear, 'country': self.search_bycountry,
                   'genre': self.search_bygenre}

        if query is None:
            return Book.objects.select_related('author').order_by('title')

        return queries[query_type](query).order_by('title')


@group_required("Bibliotecarios")
def creation_forms_view(request):
    return render(request, 'catalogue/creation_page.html')


# Vista para consultar la información de un libro particular.
def book_detail(request, book_id):
    book = get_object_or_404(Book, pk=book_id)
    book_instances = BookInstance.objects.filter(book=book_id)
    context = {'book': book, 'book_instances': book_instances}

    return render(request, 'catalogue/book_detail.html', context=context)


# Vista para consultar la información de un autor particular.
def author_details(request, author_id):
    author = get_object_or_404(Author, pk=author_id)
    book_list = Book.objects.filter(author=author_id)
    context = {'author': author, 'book_list': book_list}

    return render(request, 'catalogue/author_detail.html', context=context)

# Vistas de modificación de datos.
# Modificación de direcciones.
class AddressCreate(PermissionRequiredMixin, CreateView):
    model = Address
    permission_required = 'loans.marcar_regresado'
    fields = {'street', 'city', 'postal_code', 'number'}
    success_url = reverse_lazy('catalogue:new_items')


class CityCreate(PermissionRequiredMixin, CreateView):
    model = City
    permission_required = 'loans.marcar_regresado'
    fields = {'name'}
    success_url = reverse_lazy('catalogue:new_items')


class StreetCreate(PermissionRequiredMixin, CreateView):
    model = Street
    permission_required = 'loans.marcar_regresado'
    fields = {'name'}
    success_url = reverse_lazy('catalogue:new_items')


class PostalCodeCreate(PermissionRequiredMixin, CreateView):
    model = PostalCode
    permission_required = 'loans.marcar_regresado'
    fields = {'code'}
    success_url = reverse_lazy('catalogue:new_items')

# Fin de las vistas de creación de direcciones.

# Vistas de los datos de la biblioteca (Autores,
# libros, editoriales).
class EditorCreate(PermissionRequiredMixin, CreateView):
    model = Editor
    permission_required = 'loans.marcar_regresado'
    fields = {'address', 'name', 'name', 'country'}
    success_url = reverse_lazy('catalogue:new_items')


class AuthorCreate(PermissionRequiredMixin, CreateView):
    model = Author
    permission_required = 'loans.marcar_regresado'
    fields = {'name', 'country', 'photo'}
    success_url = reverse_lazy('catalogue:new_items')


class BookCreate(PermissionRequiredMixin, CreateView):
    model = Book
    permission_required = 'loans.marcar_regresado'
    fields = {'isbn', 'author', 'editor', 'title', 'year',
              'country', 'genre', 'cover', 'summary'}
    success_url = reverse_lazy('catalogue:new_items')
