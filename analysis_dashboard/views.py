from django.shortcuts import render
from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login
from django.contrib import messages
from django.contrib.auth.models import User
from django.contrib import messages
from django.shortcuts import render, redirect

from django.shortcuts import render, redirect
from django.contrib.auth.models import User
from django.contrib import messages
from django.contrib.auth import login

from django.contrib.auth.decorators import login_required
from django.shortcuts import render
from django.contrib.auth.models import User

from django.shortcuts import render
from django.contrib.auth.models import User
from events_dashboard.models import Event  
from django.contrib.auth.models import User
from events_dashboard.models import Event
from register.models import Profile
from django.db.models import Count
from django.utils.timezone import now, timedelta

@login_required
def analysis_dashboard(request):
    total_members = User.objects.count()
    total_active_members = User.objects.filter(is_active=True).count()
    total_events = Event.objects.count()
    upcoming_events = Event.objects.filter(status='upcoming').count()
    ongoing_events = Event.objects.filter(status='ongoing').count()
    completed_events = Event.objects.filter(status='completed').count()

    # Example Member Growth over past 6 months
    months = []
    member_counts = []
    for i in range(3, 0, -1):
        month = (now() - timedelta(days=30*i)).strftime('%b %Y')
        count = User.objects.filter(date_joined__month=(now() - timedelta(days=30*i)).month).count()
        months.append(month)
        member_counts.append(count)

    # Event Attendance (example: top 5 events)
    events = Event.objects.all()[:5]
    event_names = [event.name for event in events]
    attendance_counts = [event.current_attendees for event in events]

    # Membership Type Distribution
    membership_data = Profile.objects.values('membership_type').annotate(count=Count('membership_type'))
    membership_labels = [entry['membership_type'] for entry in membership_data]
    membership_counts = [entry['count'] for entry in membership_data]

    events = Event.objects.all().order_by('-date')[:20] 


    context = {
        'total_members': total_members,
        'total_active_members': total_active_members,
        'total_events': total_events,
        'upcoming_events': upcoming_events,
        'ongoing_events': ongoing_events,
        'completed_events': completed_events,
        'months': months,
        'member_counts': member_counts,
        'event_names': event_names,
        'attendance_counts': attendance_counts,
        'membership_labels': membership_labels,
        'membership_counts': membership_counts,
        'events': events,

    }
    return render(request, 'analysis_dashboard.html', context)
