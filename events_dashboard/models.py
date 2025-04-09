from django.db import models
from django.contrib.auth import get_user_model

class Event(models.Model):
    STATUS_CHOICES = [
        ('upcoming', 'Upcoming'),
        ('ongoing', 'Ongoing'),
        ('completed', 'Completed'),
    ]

    name = models.CharField(max_length=255)
    date = models.DateField()
    location = models.CharField(max_length=255)
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='upcoming')
    current_attendees = models.IntegerField(default=0)
    max_attendees = models.IntegerField(default=50)
    description = models.TextField()
    attendees = models.ManyToManyField(get_user_model(), related_name='events_attending', blank=True)
    
    def __str__(self):
        return self.name

    def is_full(self):
        return self.current_attendees >= self.max_attendees

    def attendance_percentage(self):
        if self.max_attendees == 0:
            return 0
        return (self.current_attendees / self.max_attendees) * 100

    def engagement_score(self):
        # Dummy logic for engagement, you can replace this
        return min(100, self.attendance_percentage() * 0.9)

    
