from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login
from django.contrib import messages
from django.contrib.auth.decorators import login_required, user_passes_test
from django.shortcuts import render
from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required, user_passes_test
from django.contrib import messages
from .models import Member, Event, Alert


def admin_login(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(request, username=username, password=password)
        if user is not None and user.is_staff:  # Check if the user is an admin
            login(request, user)
            return redirect('admin_dashboard')  # Redirect to admin dashboard
        else:
            messages.error(request, 'Invalid credentials or not an admin.')
    return render(request, 'admin_app/admin_login.html')


@login_required
@user_passes_test(lambda u: u.is_staff)  # Ensure only staff (admin) users can access
def admin_dashboard(request):
    return render(request, 'admin_app/admin_dashboard.html')

@login_required
@user_passes_test(lambda u: u.is_staff)
def admin_dashboard(request):
    # Fetch data for the dashboard
    activities = Member.objects.all()  # Example: Fetch member activities
    events = Event.objects.all()  # Example: Fetch events
    alerts = Alert.objects.all()  # Example: Fetch system alerts
    return render(request, 'admin_app/admin_dashboard.html', {
        'activities': activities,
        'events': events,
        'alerts': alerts,
    })

@login_required
@user_passes_test(lambda u: u.is_staff)
def add_member(request):
    if request.method == 'POST':
        # Process form data and save member
        name = request.POST.get('name')
        email = request.POST.get('email')
        contact = request.POST.get('contact')
        address = request.POST.get('address')
        Member.objects.create(name=name, email=email, contact=contact, address=address)
        messages.success(request, 'Member added successfully.')
        return redirect('admin_dashboard')
    return redirect('admin_dashboard')

@login_required
@user_passes_test(lambda u: u.is_staff)
def search_member(request):
    if request.method == 'GET':
        query = request.GET.get('search_query')
        activities = Member.objects.filter(name__icontains=query) | Member.objects.filter(email__icontains=query)
        return render(request, 'admin_app/admin_dashboard.html', {'activities': activities})
    return redirect('admin_dashboard')

@login_required
@user_passes_test(lambda u: u.is_staff)
def send_bulk_message(request):
    if request.method == 'POST':
        message = request.POST.get('message')
        # Logic to send bulk messages
        messages.success(request, 'Bulk message sent successfully.')
        return redirect('admin_dashboard')
    return redirect('admin_dashboard')