from django.urls import path
from .views import index
from .views import RegisterAPI, LoginAPI, LogoutAPI, UserAPI 
from django.urls import path
from .views import CustomLogoutView

urlpatterns = [
    path('', index, name='index'),  # Serve the frontend at the root URL
    path('register/', RegisterAPI.as_view(), name='register'),
    path('login/', LoginAPI.as_view(), name='login'),
    path('membership_dashboard/', LoginAPI.as_view(), name='membership_dashboard'),
    #path('logout/', auth_views.LogoutView.as_view(next_page='login'), name='logout'),
    path('logout/', CustomLogoutView.as_view(), name='logout'),
]