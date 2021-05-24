from django.db import models
from catalogue.models import Book
from django.contrib.auth.models import User
from datetime import datetime, date
import uuid


# Modelos de la app de préstamos.
class BookInstance(models.Model):
    """Modelo para las posibles copias de algún libro que
    puede haber en la biblioteca."""
    id = models.UUIDField(primary_key=True, default=uuid.uuid4,
                          help_text="ID Único para este libro particular.")
    book = models.ForeignKey(Book, on_delete=models.RESTRICT, null=True)
    imprint = models.CharField(max_length=200)

    LOAN_STATUS = (('m', 'mantenimiento'),
                   ('e', 'en préstamo'),
                   ('d', 'disponible'),
                   ('r', 'reservado'))
    
    status = models.CharField(
        max_length=1,
        choices=LOAN_STATUS,
        blank=True,
        default='m',
        help_text='Disponibilidad'
    )

    @property
    def is_available(self):
        return self.status == 'd'


    def __str__(self):
        return f"{self.id}"


class Loan(models.Model):
    """Modelo para los préstamos."""
    class Meta:
        permissions = [("marcar_regresado", "Marcar préstamo como regresado")]

    borrowed_book = models.ForeignKey(BookInstance, on_delete=models.CASCADE)
    borrower = models.ForeignKey(User, on_delete=models.CASCADE)
    made_on = models.DateField(auto_now_add=True)
    expires = models.DateField()
    renewals = models.SmallIntegerField(default=0)
    RETURN_STATUS = (('d', 'devuelto'),
                     ('n', 'no devuelto'))
    return_status = models.CharField(max_length=1,
                                     choices=RETURN_STATUS,
                                     blank=True,
                                     default='n')
    
    @property
    def is_overdue(self):
        if self.expires and date.today() > self.expires:
            return True

        return False


class Fine(models.Model):
    """Modelo para las multas."""

    loan = models.OneToOneField(Loan, on_delete=models.CASCADE)
    charge = models.IntegerField(default=0)
    paid = models.BooleanField(default=True)

    def __str__(self):
        return f"{self.charge}"
