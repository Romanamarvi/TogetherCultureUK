from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('about/', views.about, name='about'),
    path('festival/', views.festival, name='festival'),
    path('Contact/', views.Contact, name='Conatct'),   
]