from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static 

urlpatterns = [
    path('admin/', admin.site.urls),
    path('auth/', include('auth_app.urls')),
    path('', include('welcome.urls')),
    path('login/', include('login.urls')),
    path('register/', include('register.urls')),
    path('members/', include('members.urls')),
    path('membership_dashboard/', include('membership_dashboard.urls')),
    path('admin_app/', include('admin_app.urls')),
    path('events_dashboard/', include('events_dashboard.urls')),
    path('update-profile/', include('update_profile.urls')),
    path('member_events/', include('member_events.urls')),
    path('event_registration/', include('event_registration.urls')),
    path('events/', include('event_registration.urls')),

]


if settings.DEBUG: 
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
