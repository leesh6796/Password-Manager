from __future__ import unicode_literals

from django.db import models

# Create your models here.
class Account(models.Model):
    master_id = models.CharField(max_length=100, null=False)
    master_pw = models.CharField(max_length=1000, null=False)
    admin = models.BooleanField(default=False)

    def __unicode__(self):
        return self.master_id

class Site(models.Model):
    masterid = models.CharField(max_length=100)
    sitename = models.CharField(max_length=100)
    username = models.CharField(max_length=500)
    password = models.CharField(max_length=500)
    comment = models.TextField(max_length=5000)

    def __unicode__(self):
        return self.sitename