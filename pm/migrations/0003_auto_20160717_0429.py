# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2016-07-16 19:29
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('pm', '0002_auto_20160717_0348'),
    ]

    operations = [
        migrations.RenameField(
            model_name='site',
            old_name='site_pw',
            new_name='password',
        ),
        migrations.RenameField(
            model_name='site',
            old_name='site_id',
            new_name='username',
        ),
    ]
