from . import views
from django.urls import include, path

app_name = 'loans'
urlpatterns = [
    path('my_borrowed/', views.UserLoansView.as_view(), name='user_loans'),
    path('my_fines/', views.fines_view, name='user_fines'),
    path('fines/', views.all_fines_view, name='all_fines'),
    path('', views.LoansView.as_view(), name='all_loans'),
    path('<str:book_uuid>/', views.loan, name='loan'),
    path('renew/<int:loan_id>/', views.renew, name='renewal'),
    path('return/<int:loan_id>/', views.mark_returned, name='return'),
]
