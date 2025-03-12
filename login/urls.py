from django.urls import path
from . import views

urlpatterns = [
    path('', views.login_view, name='login'),
    path('membership_dashboard/', views.login_view, name='membership_dashboard'),
    

]