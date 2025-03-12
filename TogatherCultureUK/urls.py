from django.contrib import admin
from django.urls import path, include  # Make sure 'include' is imported

urlpatterns = [
    path('admin/', admin.site.urls),
    path('auth/', include('auth_app.urls')), 
    path('', include('welcome.urls')), 
    path('login/', include('login.urls')), 
    path('register/', include('register.urls')), 
    path('members/', include('members.urls')), 
    path('membership_dashboard/', include('membership_dashboard.urls')), 
    path('admin_app/', include('admin_app.urls')),
]
