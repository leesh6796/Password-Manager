# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2016-07-16 20:48
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('pm', '0004_auto_20160717_0547'),
    ]

    operations = [
        migrations.AlterField(
            model_name='site',
            name='username',
            field=models.CharField(max_length=500),
        ),
    ]