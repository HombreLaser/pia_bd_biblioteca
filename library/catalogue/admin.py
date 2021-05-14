from django.contrib import admin
from .models import *

# Register your models here.
admin.site.register(Book)
admin.site.register(Author)
admin.site.register(Editor)
admin.site.register(Address)
admin.site.register(Street)
admin.site.register(City)
admin.site.register(PostalCode)
