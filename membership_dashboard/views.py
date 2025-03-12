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

@login_required
def membership_dashboard(request):
    return render(request, 'membership_dashboard.html')