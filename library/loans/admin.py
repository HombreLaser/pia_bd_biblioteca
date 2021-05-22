from django.contrib import admin
from .models import BookInstance, Loan, Fine

# Register your models here.
admin.site.register(BookInstance)
admin.site.register(Loan)
admin.site.register(Fine)
