# Generated by Django 3.0.5 on 2020-05-17 02:55

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('contenttypes', '0002_remove_content_type_name'),
        ('app01', '0002_auto_20200505_1922'),
    ]

    operations = [
        migrations.AlterField(
            model_name='bbs',
            name='keywords',
            field=models.ManyToManyField(default='', help_text='建议添加三到四个关键词', to='app01.Keyword', verbose_name='关键词'),
        ),
        migrations.AlterField(
            model_name='bbs',
            name='tag',
            field=models.ManyToManyField(default='', to='app01.Tag', verbose_name='标签'),
        ),
        migrations.CreateModel(
            name='LoveRecord',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('object_id', models.PositiveIntegerField()),
                ('love_date', models.DateTimeField(auto_now_add=True)),
                ('content_type', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='contenttypes.ContentType')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name='作者')),
            ],
        ),
        migrations.CreateModel(
            name='LoveCount',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('object_id', models.PositiveIntegerField()),
                ('like_num', models.IntegerField(default=0, verbose_name='点赞数')),
                ('content_type', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='contenttypes.ContentType')),
            ],
        ),
    ]
