from django.shortcuts import render
from django.http import HttpResponse, Http404, HttpResponseRedirect
from django.template import loader
from django.urls import reverse
from django.views import generic
from django.contrib.auth.mixins import LoginRequiredMixin
from .models import Book, Author, Editor


# Vistas del catálogo.
class IndexView(generic.ListView):
    template_name = 'catalogue/index.html'
    context_object_name = 'book_list'
    paginate_by = 5

    def get_queryset(self):
        return Book.objects.order_by('title')


class BookDetailView(generic.DetailView):
    template_name='catalogue/book_detail.html'
    model = Book
