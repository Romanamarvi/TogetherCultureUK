from django.urls import path
from .views import register_for_event

urlpatterns = [
    path('<int:event_id>/register/', register_for_event, name='register_for_event'),
]
