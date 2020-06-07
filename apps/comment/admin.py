from django.contrib import admin
from . import models
# Register your models here.


@admin.register(models.Comment)
class CommentAdmin(admin.ModelAdmin):
    list_display = ['id', 'article', 'user', 'date', 'article_comment']
    list_filter = ['date', 'article', ]  # 按创建时间过滤
    list_per_page = 50  # 每页显示50条
    search_fields = ['article__title', 'article_comment', 'user__username']
