from django.urls import path
from .views import event_list, add_event, edit_event, delete_event

urlpatterns = [
    path('', event_list, name='event_list'),
    path('add/', add_event, name='add_event'),
    path('edit/<int:pk>/', edit_event, name='edit_event'),
    path('delete/<int:pk>/', delete_event, name='delete_event'),
]
