from django.urls import path
from .views import member_events_view

urlpatterns = [
    path('', member_events_view, name='member_events'),
]