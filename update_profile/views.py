from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.http import JsonResponse

@login_required
def update_profile(request):
    profile = request.user.register_profile
    
    # Predefined lists for checkboxes
    INTERESTS = ['Working', 'Sharing', 'Experiencing', 'Creating']
    BENEFITS = [
        'Workshop Access', 'Networking Events', 
        'Newsletter Subscription', 'Creative Workspace',
        'Mentorship Sessions', 'Priority Booking'
    ]
    
    if request.method == 'POST':
        # Update username if changed
        new_username = request.POST.get('username')
        if new_username and new_username != request.user.username:
            request.user.username = new_username
            request.user.save()
        
        # Update profile fields
        profile.dob = request.POST.get('dob', profile.dob)
        profile.interests = ", ".join(request.POST.getlist('interests'))
        profile.benefits = ", ".join(request.POST.getlist('benefits'))
        profile.membership_type = request.POST.get('membership_type', profile.membership_type)
        profile.contact = request.POST.get('contact', profile.contact)
        profile.address = request.POST.get('address', profile.address)
        profile.save()

        # Return a JSON response instead of redirecting
        return JsonResponse({'status': 'success', 'message': 'Profile updated successfully!'})
    
    MEMBERSHIP_CHOICES = [
        ('community', 'Community Member'),
        ('key-access', 'Key Access Member'),
        ('creative-workspace', 'Creative Workspace Member'),
    ]
    
    context = {
        'profile': profile,
        'user': request.user,
        'interests_list': INTERESTS,
        'benefits_list': BENEFITS,
        'membership_choices': MEMBERSHIP_CHOICES,
    }
    return render(request, 'update_profile.html', context)
