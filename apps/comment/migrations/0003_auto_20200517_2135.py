# Generated by Django 3.0.5 on 2020-05-17 13:35

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('comment', '0002_comment_user'),
    ]

    operations = [
        migrations.AlterField(
            model_name='comment',
            name='date',
            field=models.DateTimeField(auto_now_add=True, verbose_name='评论时间'),
        ),
    ]
