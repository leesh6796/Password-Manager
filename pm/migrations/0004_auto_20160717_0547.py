# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2016-07-16 20:47
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('pm', '0003_auto_20160717_0429'),
    ]

    operations = [
        migrations.RenameField(
            model_name='site',
            old_name='master_id',
            new_name='masterid',
        ),
    ]
