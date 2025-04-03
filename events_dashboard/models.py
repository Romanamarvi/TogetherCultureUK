from django.db import models

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
    

    def __str__(self):
        return self.name
