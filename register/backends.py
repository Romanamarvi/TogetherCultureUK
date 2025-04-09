# register/backends.py

from django.contrib.auth.backends import ModelBackend
from django.contrib.auth.models import User

class ApprovedUserBackend(ModelBackend):
    def authenticate(self, request, username=None, password=None, **kwargs):
        try:
            user = User.objects.get(username=username)
            # Check if the profile exists and if the status is approved
            if hasattr(user, 'register_profile') and user.register_profile.status == 'approved' and user.check_password(password):
                return user
            return None
        except User.DoesNotExist:
            return None
