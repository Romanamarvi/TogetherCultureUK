from django.shortcuts import render
from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login
from django.contrib import messages
from django.contrib.auth.models import User
from django.contrib import messages
from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from django.contrib.auth.decorators import user_passes_test
from django.http import JsonResponse
from django.shortcuts import get_object_or_404
from django.contrib.auth.models import User
import json
from register.models import Profile

@login_required
def member_list(request):
    # Fetch all users and their profiles
    members = User.objects.select_related('register_profile').all()

    # Filter members based on their approval status
    pending_members = members.filter(register_profile__status='pending')
    approved_members = members.filter(register_profile__status='approved')

    # Pass the filtered members to the template
    return render(request, 'member_list.html', {
        'pending_members': pending_members,
        'approved_members': approved_members,
    })


@login_required
@user_passes_test(lambda u: u.is_staff)
def approve_member(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        member_id = data.get('member_id')

        # Get the user
        user = get_object_or_404(User, id=member_id)

        # Ensure the user has a related Profile
        profile, created = Profile.objects.get_or_create(user=user)

        # Update the profile status to approved
        profile.status = 'approved'
        profile.save()

        return JsonResponse({'success': True})
    return JsonResponse({'success': False}, status=400)

@login_required
def reject_member(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        member_id = data.get('member_id')
        user = get_object_or_404(User, id=member_id)
        user.delete()
        return JsonResponse({'success': True})
    return JsonResponse({'success': False}, status=400)