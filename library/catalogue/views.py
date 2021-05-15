from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse, Http404, HttpResponseRedirect
from django.template import loader
from django.urls import reverse
from django.views import generic
from django.contrib.auth.mixins import LoginRequiredMixin
from django.db.models import Q
from .models import Book, Author, Editor


# Vistas del catálogo.
class IndexView(generic.ListView):
    template_name = 'catalogue/index.html'
    context_object_name = 'book_list'
    paginate_by = 5

    def search_bytitle(self, query):
        return Book.objects.filter(title__icontains=query)

    def search_byauthor(self, query):
        return Book.objects.filter(author__name__icontains=query)

    def search_byyear(self, query):
        return Book.objects.filter(year__iexact=query)

    def search_bycountry(self, query):
        return Book.objects.filter(year__iexact=query)

    def search_bygenre(self, query):
        return Book.objects.filter(Q(genre__icontains=query) | Q(genre__iexact=query))

    def get_queryset(self):
        query = self.request.GET.get('search')
        query_type = self.request.GET.get('type')
        queries = {'title': self.search_bytitle, 'author': self.search_byauthor,
                   'year': self.search_byyear, 'country': self.search_bycountry,
                   'genre': self.search_bygenre}

        if query is None:
            return Book.objects.order_by('title')

        return queries[query_type](query).order_by('title')


class BookDetailView(generic.DetailView):
    template_name='catalogue/book_detail.html'
    model = Book


def author_details(request, author_id):
    author = get_object_or_404(Author, pk=author_id)
    book_list = Book.objects.filter(author=author_id)
    context = {'author': author, 'book_list': book_list}

    return render(request, 'catalogue/author_detail.html', context=context)
