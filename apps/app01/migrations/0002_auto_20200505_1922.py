# Generated by Django 3.0.5 on 2020-05-05 11:22

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('app01', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='category',
            name='admin',
            field=models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to=settings.AUTH_USER_MODEL, verbose_name='版主'),
        ),
        migrations.AddField(
            model_name='category',
            name='bigcategory',
            field=models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='app01.BigCategory', verbose_name='顶部分类'),
        ),
        migrations.AddField(
            model_name='bigcategory',
            name='admin',
            field=models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to=settings.AUTH_USER_MODEL, verbose_name='大版主'),
        ),
        migrations.AddField(
            model_name='bbs',
            name='author',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name='作者'),
        ),
        migrations.AddField(
            model_name='bbs',
            name='category',
            field=models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='app01.Category', verbose_name='分类'),
        ),
        migrations.AddField(
            model_name='bbs',
            name='keywords',
            field=models.ManyToManyField(help_text='建议添加三到四个关键词', to='app01.Keyword', verbose_name='关键词'),
        ),
        migrations.AddField(
            model_name='bbs',
            name='tag',
            field=models.ManyToManyField(to='app01.Tag', verbose_name='标签'),
        ),
    ]
