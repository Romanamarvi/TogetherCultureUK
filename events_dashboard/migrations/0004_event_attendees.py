# Generated by Django 3.2.25 on 2025-04-06 09:12

from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('events_dashboard', '0003_remove_event_event_image'),
    ]

    operations = [
        migrations.AddField(
            model_name='event',
            name='attendees',
            field=models.ManyToManyField(blank=True, related_name='events_attending', to=settings.AUTH_USER_MODEL),
        ),
    ]
