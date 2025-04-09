from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login
from django.contrib import messages
from django.contrib.auth.decorators import login_required, user_passes_test
from django.http import JsonResponse
from django.shortcuts import get_object_or_404
from .models import Member, Event, Alert
import json
from django.contrib.auth.models import User  # Required for approve/reject

def admin_login(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(request, username=username, password=password)
        if user is not None and user.is_staff:
            login(request, user)
            request.session['user_id'] = user.id
            request.session.set_expiry(60)
            return redirect('analysis_dashboard')
        else:
            messages.error(request, 'Invalid credentials or not an admin.')
    return render(request, 'admin_app/admin_login.html')

@login_required
@user_passes_test(lambda u: u.is_staff)
def admin_dashboard(request):
    activities = Member.objects.all()
    events = Event.objects.all()
    alerts = Alert.objects.all()
    return render(request, 'analysis_dashboard.html', {
        'activities': activities,
        'events': events,
        'alerts': alerts,
    })

@login_required
@user_passes_test(lambda u: u.is_staff)
def add_member(request):
    if request.method == 'POST':
        name = request.POST.get('name')
        email = request.POST.get('email')
        contact = request.POST.get('contact')
        address = request.POST.get('address')
        Member.objects.create(name=name, email=email, contact=contact, address=address)
        messages.success(request, 'Member added successfully.')
        return redirect('analysis_dashboard')
    return redirect('analysis_dashboard')

@login_required
@user_passes_test(lambda u: u.is_staff)
def search_member(request):
    if request.method == 'GET':
        query = request.GET.get('search_query')
        activities = Member.objects.filter(name__icontains=query) | Member.objects.filter(email__icontains=query)
        return render(request, 'admin_app/admin_dashboard.html', {'activities': activities})
    return redirect('analysis_dashboard')

@login_required
@user_passes_test(lambda u: u.is_staff)
def send_bulk_message(request):
    if request.method == 'POST':
        message = request.POST.get('message')
        messages.success(request, 'Bulk message sent successfully.')
        return redirect('analysis_dashboard')
    return redirect('analysis_dashboard')  # Fixed missing parenthesis

from django.contrib import messages
from django.shortcuts import redirect
from .models import Member

@login_required
@user_passes_test(lambda u: u.is_staff)
def add_member(request):
    if request.method == 'POST':
        name = request.POST.get('name')
        email = request.POST.get('email')
        contact = request.POST.get('contact')
        address = request.POST.get('address')

        Member.objects.create(
            name=name,
            email=email,
            contact=contact,
            address=address
        )

        messages.success(request, 'Member added successfully.')
        return redirect('member_list')  # Adjust to your actual view name
