from django.urls import path
from . import views

urlpatterns = [
    path('', views.member_list, name='member_list'),
    path('approve_member/', views.approve_member, name='approve_member'),
    path('reject_member/', views.reject_member, name='reject_member'),

]
