from django.contrib.auth.models import User
from django.db import models

class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name='register_profile')
    dob = models.DateField(null=True, blank=True)
    interests = models.CharField(max_length=200, blank=True)
    benefits = models.TextField(blank=True)
    membership_type = models.CharField(max_length=50, blank=True)
    contact = models.CharField(max_length=15, blank=True)
    address = models.TextField(blank=True)
    status = models.CharField(max_length=10, choices=[('pending', 'Pending'), ('approved', 'Approved'), ('rejected', 'Rejected')], default='pending')

    def __str__(self):
        return self.user.username