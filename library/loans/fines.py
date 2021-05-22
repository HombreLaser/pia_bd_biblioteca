from .models import Fine
from datetime import date
from django.db.models import Q


def search_byuser(query):
    return Fine.objects.select_related('loan').select_related('loan__borrower').select_related('loan__borrowed_book__book').filter(Q(loan__expires__lt=date.today()), Q(loan__borrowed_book__status='e'), loan__borrower__username__icontains=query)


def search_bycharge(query):
    return Fine.objects.select_related('loan').select_related('loan__borrower').select_related('loan__borrowed_book__book').filter(Q(loan__expires__lt=date.today()), Q(loan__borrowed_book__status='e'), charge=query)


# Función para guardar las multas modificadas
# en la base de datos. Se usa tanto en la vista
# de usuario como la de administrador.
def save_fines(fines_list):
    for fine in fines_list:
        fine.charge = 10 * (date.today() - fine.loan.expires).days
        fine.paid = False
        fine.save()
