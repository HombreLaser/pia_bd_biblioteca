from . import views
from django.urls import include, path

app_name = "catalogue"
urlpatterns = [
    path('', views.IndexView.as_view(), name='index'),
    path('signup/', views.signup_view, name='sign_up'),
    path('new_items/', views.creation_forms_view, name='new_items'),
    path('<str:book_id>/', views.book_detail, name='book'),
    path('author/create', views.AuthorCreate.as_view(), name='new_author'),
    path('book/create', views.BookCreate.as_view(), name='new_book'),
    path('editor/create', views.EditorCreate.as_view(), name='new_editor'),
    path('address/create', views.AddressCreate.as_view(), name='new_address'),
    path('address/street_create', views.StreetCreate.as_view(), name='new_street'),
    path('address/city_create', views.CityCreate.as_view(), name='new_city'),
    path('address/postalcode_create', views.PostalCodeCreate.as_view(), name='new_pc'),
    path('author/<int:author_id>/', views.author_details, name='author'),
]
