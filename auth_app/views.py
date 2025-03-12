from django.shortcuts import render

from rest_framework import generics, permissions
from rest_framework.response import Response
from django.contrib.auth import login, logout
from .serializers import UserSerializer, RegisterSerializer, LoginSerializer
from django.contrib.auth import authenticate, login
from rest_framework import status
from rest_framework.response import Response
from rest_framework.views import APIView
from django.contrib.auth.models import User

# Register API
# mainapp/api.py
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from django.contrib.auth.models import User
from register.models import Profile
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from django.contrib.auth.models import User
from django.core.validators import validate_email
from django.core.exceptions import ValidationError
from register.models import Profile

class RegisterAPI(APIView):
    def post(self, request):
        data = request.data
        username = data.get('name')
        email = data.get('email')
        password = data.get('password')
        confirm_password = data.get('confirm_password')
        dob = data.get('dob')
        interests = data.get('interests', [])  # Expecting a list of interests
        benefits = data.get('benefits', '')    # Benefits are optional
        membership_type = data.get('membership_type')
        contact = data.get('contact')
        address = data.get('address')

        # Basic validation
        if not username or not email or not password or not confirm_password:
            return Response({"message": "All fields are required."}, status=status.HTTP_400_BAD_REQUEST)

        # Check if passwords match
        if password != confirm_password:
            return Response({"message": "Passwords do not match."}, status=status.HTTP_400_BAD_REQUEST)

        # Validate email format
        try:
            validate_email(email)
        except ValidationError:
            return Response({"message": "Invalid email format."}, status=status.HTTP_400_BAD_REQUEST)

        # Check for duplicate email
        if User.objects.filter(email=email).exists():
            return Response({"message": "Email is already in use."}, status=status.HTTP_400_BAD_REQUEST)

        # Check for duplicate username
        if User.objects.filter(username=username).exists():
            return Response({"message": "Username is already taken."}, status=status.HTTP_400_BAD_REQUEST)

        # Create User
        try:
            user = User.objects.create_user(username=username, email=email, password=password)
            user.first_name = username  # Use the name field as first_name
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

            return Response({
                "message": "User registered successfully.",
                "user": {
                    "id": user.id,
                    "username": user.username,
                    "email": user.email,
                    "profile": {
                        "dob": profile.dob,
                        "interests": profile.interests,
                        "benefits": profile.benefits,
                        "membership_type": profile.membership_type,
                        "contact": profile.contact,
                        "address": profile.address
                    }
                }
            }, status=status.HTTP_201_CREATED)

        except Exception as e:
            return Response({"message": "An error occurred during registration: " + str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

# Login API

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from django.contrib.auth import authenticate, login

class LoginAPI(APIView):
    def post(self, request, *args, **kwargs):
        username = request.data.get('email')
        password = request.data.get('password')
        print(f"Username: {username}, Password: {password}")  # Debugging line
        
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            print("Login successful")  # Debugging line
            return Response({"message": "Login successful", "user": True}, status=status.HTTP_200_OK)
        else:
            print("Login failed")  # Debugging line
            return Response({"message": "Invalid username or password"}, status=status.HTTP_401_UNAUTHORIZED)


# Logout API
class LogoutAPI(generics.GenericAPIView):
    permission_classes = [permissions.IsAuthenticated]

    def post(self, request, *args, **kwargs):
        logout(request)
        return Response({"message": "Logged out successfully."})

# Get User API
class UserAPI(generics.RetrieveAPIView):
    permission_classes = [permissions.IsAuthenticated]
    serializer_class = UserSerializer

    def get_object(self):
        return self.request.user

# views.py

def index(request):
    return render(request, 'welcome.html')

# auth_app/views.py
from django.contrib.auth import views as auth_views
from django.contrib import messages

class CustomLogoutView(auth_views.LogoutView):
    next_page = 'login'  # Redirect to the login page

    def dispatch(self, request, *args, **kwargs):
        messages.success(request, 'You have been logged out successfully.')
        return super().dispatch(request, *args, **kwargs)