from . import views
from django.urls import include, path

app_name = "catalogue"
urlpatterns = [
    path('', views.IndexView.as_view(), name='index'),
    path('<str:pk>/', views.BookDetailView.as_view(), name='book'),
    path('author/<int:author_id>/', views.author_details, name='author')
]
