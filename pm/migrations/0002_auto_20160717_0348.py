# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2016-07-16 18:48
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('pm', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='site',
            name='master_id',
            field=models.CharField(max_length=100),
        ),
    ]
