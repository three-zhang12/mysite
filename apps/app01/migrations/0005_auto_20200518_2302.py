# Generated by Django 3.0.5 on 2020-05-18 23:02

import ckeditor_uploader.fields
from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('app01', '0004_auto_20200518_2247'),
    ]

    operations = [
        migrations.AlterField(
            model_name='bbs',
            name='content',
            field=ckeditor_uploader.fields.RichTextUploadingField(),
        ),
    ]
