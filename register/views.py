from django.shortcuts import render, redirect
from django.contrib.auth.models import User
from django.contrib import messages 

def registration_view(request):
    if request.method == 'POST':
        try:
            # Extract form data
            name = request.POST.get('name')
            email = request.POST.get('email')
            password = request.POST.get('password')
            dob = request.POST.get('dob')
            interests = request.POST.getlist('interests')
            benefits = request.POST.getlist('benefits')
            membership_type = request.POST.get('membership-type')
            contact = request.POST.get('contact')
            address = request.POST.get('address')

            # Check if user already exists
            if User.objects.filter(username=email).exists():
                messages.error(request, "User with this email already exists.")
                return redirect('registration')

            # Create user and profile in a transaction
            with transaction.atomic():
                user = User.objects.create_user(
                    username=email,
                    email=email,
                    password=password,
                    first_name=name
                )
                
                # This will either create or update the profile
                Profile.objects.update_or_create(
                    user=user,
                    defaults={
                        'dob': dob,
                        'interests': ", ".join(interests),
                        'benefits': ", ".join(benefits),
                        'membership_type': membership_type,
                        'contact': contact,
                        'address': address,
                        'status': 'pending'
                    }
                )

            return redirect('members')

        except Exception as e:
            messages.error(request, f"Registration failed: {str(e)}")
            return redirect('registration')

    return render(request, 'register.html')