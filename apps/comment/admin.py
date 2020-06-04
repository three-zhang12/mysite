from django.contrib import admin
from . import models
# Register your models here.


@admin.register(models.Comment)
class CommentAdmin(admin.ModelAdmin):
    list_display = ['id', 'article', 'user', 'date', 'article_comment']