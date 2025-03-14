from django.urls import path
from . import views
from analysis_dashboard import views as view
from django.urls import path, include  # Make sure 'include' is imported


urlpatterns = [
    path('admin/login/', views.admin_login, name='admin_login'),
    path('admin/dashboard/', views.admin_dashboard, name='admin_dashboard'),
    path('dashboard/', views.admin_dashboard, name='admin_dashboard'),
    path('add-member/', views.add_member, name='add_member'),
    path('search-member/', views.search_member, name='search_member'),
    path('send-bulk-message/', views.send_bulk_message, name='send_bulk_message'),
    path('members/', include('members.urls')), 
    path('members/', views.send_bulk_message, name='members'),
    path('events_dashboard/', include('events_dashboard.urls')), 
    path('events_dashboard/', views.send_bulk_message, name='events'),
    path('analysis_dashboard/', include('analysis_dashboard.urls')), 
    path('analysis_dashboard/', view.analysis_dashboard, name='analysis_dashboard'),
    


]