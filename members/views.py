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

def member_list(request):
    # Fetch all users and their profiles
    members = User.objects.select_related('profile').all()
    return render(request, 'member_list.html', {'members': members})