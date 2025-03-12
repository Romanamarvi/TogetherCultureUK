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

# mainapp/views.py
from django.shortcuts import render, redirect
from django.contrib.auth.models import User
from .models import Profile

def registration_view(request):
    if request.method == 'POST':
        # Extract form data
        name = request.POST.get('name')
        email = request.POST.get('email')
        password = request.POST.get('password')
        dob = request.POST.get('dob')
        interests = request.POST.getlist('interests')  # For checkboxes
        benefits = request.POST.get('benefits')
        membership_type = request.POST.get('membership-type')
        contact = request.POST.get('contact')
        address = request.POST.get('address')

        # Create User
        user = User.objects.create_user(username=email, email=email, password=password)
        user.first_name = name
        user.save()

        # Create Profile
        profile = Profile.objects.create(
            user=user,
            dob=dob,
            interests=", ".join(interests),  # Convert list to a string
            benefits=benefits,
            membership_type=membership_type,
            contact=contact,
            address=address
        )
        profile.save()

        return redirect('members')  # Redirect to the members page after registration

    return render(request, 'register.html')