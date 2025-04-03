from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from .models import Event
from .forms import EventForm

# List of Events
def event_list(request):
    events = Event.objects.all()
    return render(request, 'events.html', {'events': events})

# Add a New Event
@login_required
def add_event(request):
    if request.method == 'POST':
        form = EventForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()  # Save event to the database
            messages.success(request, 'Event successfully added!')
            return redirect('events')  # Ensure this URL is defined in your urls.py
    else:
        form = EventForm()

    return render(request, 'add_event.html', {'form': form})

# Edit an Existing Event
@login_required
def edit_event(request, pk):
    # Fetch the event object based on the provided primary key (pk)
    event = get_object_or_404(Event, pk=pk)
    
    # Handle the POST request when the form is submitted
    if request.method == 'POST':
        form = EventForm(request.POST, request.FILES, instance=event)
        if form.is_valid():
            form.save()  # Save the updated event to the database
            return redirect('event_list')  # Redirect to the event list page after saving
    else:
        # For GET request, initialize the form with the existing event data
        form = EventForm(instance=event)

    return render(request, 'edit_event.html', {'form': form, 'event': event})

# Delete an Event
@login_required
def delete_event(request, pk):
    event = get_object_or_404(Event, pk=pk)
    event.delete()
    messages.success(request, 'Event successfully deleted!')
    return redirect('event_list')  # Ensure this URL is defined in your urls.py
