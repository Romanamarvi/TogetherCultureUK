from django.http import JsonResponse
from django.views.decorators.http import require_POST
from django.contrib.auth.decorators import login_required
from django.db.models import F
from events_dashboard.models import Event

@login_required
@require_POST
def register_for_event(request, event_id):
    try:
        event = Event.objects.get(id=event_id)
        
        # Check if user already registered
        if request.user in event.attendees.all():
            return JsonResponse({
                'success': False,
                'error': 'You are already registered for this event'
            }, status=400)
            
        # Check if event has space
        if event.current_attendees >= event.max_attendees:
            return JsonResponse({
                'success': False,
                'error': 'This event is full'
            }, status=400)
            
        # Check if event is still upcoming
        if event.status != 'upcoming':
            return JsonResponse({
                'success': False,
                'error': 'Registration is closed for this event'
            }, status=400)
            
        # Register user and increment count
        event.attendees.add(request.user)
        event.current_attendees = F('current_attendees') + 1
        event.save()
        event.refresh_from_db()  # Refresh to get updated count
        
        return JsonResponse({
            'success': True,
            'message': 'Successfully registered for the event!',
            'current_attendees': event.current_attendees,
            'max_attendees': event.max_attendees
        })
        
    except Event.DoesNotExist:
        return JsonResponse({
            'success': False,
            'error': 'Event not found'
        }, status=404)
    except Exception as e:
        return JsonResponse({
            'success': False,
            'error': str(e)
        }, status=500)
