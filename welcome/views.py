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



def index(request):
    return render(request, 'welcome.html')


def about(request):
    return render(request, 'aboutus.html')

def festival(request):
    return render(request, 'festival.html')



def Contact(request):
    return render(request, 'contact.html')
