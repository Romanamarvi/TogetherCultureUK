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
from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from register.models import Profile

from django.contrib.auth.decorators import login_required

@login_required
def membership_dashboard(request):
    profile = request.user.register_profile

    # Master list of all available benefits
    master_benefits = [
        'Workshop Access', 
        'Networking Events', 
        'Newsletter Subscription', 
        'Creative Workspace', 
        'Mentorship Sessions', 
        'Priority Booking'
    ]

    # Parse the user's selected benefits from the Profile model.
    # Assuming benefits are stored as a comma-separated string.
    if profile.benefits:
        selected = [benefit.strip() for benefit in profile.benefits.split(',')]
    else:
        selected = []

    # Determine used and unused benefits
    used_benefits = [benefit for benefit in master_benefits if benefit in selected]
    unused_benefits = [benefit for benefit in master_benefits if benefit not in selected]

    context = {
        'used_benefits': used_benefits,
        'unused_benefits': unused_benefits,
    }
    return render(request, 'membership_dashboard.html',context)
