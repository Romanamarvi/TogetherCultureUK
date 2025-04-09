from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from events_dashboard.models import Event  

@login_required
def member_events_view(request):
    events = Event.objects.all().order_by('date') 
    return render(request, 'member_events.html', {'events': events})  
