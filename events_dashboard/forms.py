from django import forms
from .models import Event

class EventForm(forms.ModelForm):
    class Meta:
        model = Event
        fields = ['name', 'date', 'location', 'status', 'current_attendees', 'max_attendees', 'description']

