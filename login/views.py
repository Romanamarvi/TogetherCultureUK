from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login
from django.contrib.auth.models import User
from django.http import JsonResponse
from django.urls import reverse

def login_view(request):
    if request.method == 'POST':
        email = request.POST.get('email')
        password = request.POST.get('password')
        try:
            # Check if a user with the provided email exists
            user_obj = User.objects.get(email=email)

            # Check if the user has an approved profile
            if hasattr(user_obj, 'register_profile') and user_obj.register_profile.status != 'approved':
                return JsonResponse({
                    'success': False,
                    'error': 'Your account is pending approval by the admin.'
                })

            # Authenticate using the username
            user = authenticate(request, username=user_obj.username, password=password)
            if user is not None:
                login(request, user)
                request.session['user_id'] = user.id
                request.session['email'] = user.email
                request.session['username'] = user.username
                request.session.set_expiry(300)
                return JsonResponse({
                    'success': True,
                    'redirect_url': reverse('membership_dashboard')
                })
            else:
                return JsonResponse({
                    'success': False,
                    'error': 'Invalid email or password.'
                })

        except User.DoesNotExist:
            return JsonResponse({
                'success': False,
                'error': 'Email does not exist.'
            })

    return render(request, 'login.html')
