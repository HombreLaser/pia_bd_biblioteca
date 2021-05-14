from . import views
from django.urls import include, path

app_name = "catalogue"
urlpatterns = [
    path('', views.IndexView.as_view(), name='index')
]
