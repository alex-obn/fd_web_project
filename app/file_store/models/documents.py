from django.db import models


class UpFile(models.Model):
    file = models.FileField(upload_to="upload/%Y/")
    link = models.URLField(blank=True)
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)
