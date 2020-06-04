from django.contrib import admin
from . import models
# Register your models here.


@admin.register(models.BigCategory)
class BigcategoryAdmin(admin.ModelAdmin):
    list_display = ['id', 'name', 'admin']


@admin.register(models.Category)
class CategoryAdmin(admin.ModelAdmin):
    list_display = ['id', 'name', 'admin', 'bigcategory']


@admin.register(models.Keyword)
class KeywordAdmin(admin.ModelAdmin):
    list_display = ['id', 'name']


@admin.register(models.Tag)
class TagAdmin(admin.ModelAdmin):
    list_display = ['id', 'name']


@admin.register(models.Bbs)
class BbsAdmin(admin.ModelAdmin):
    list_display = ['id', 'title', 'author', 'signature', 'created_date', 'update_date', 'views', 'loves']
    list_filter = ['created_date', 'category', ]  # 按创建时间过滤
    list_per_page = 50  # 每页显示50条
    search_fields = ['title', 'author__user__username']  # 可以搜索标题，作者，作者是外键，__user到user表中，__username作者名

    def signature(self, obj):
        return obj.author.signature
    signature.short_description = '签名'  # 连接外键属性


@admin.register(models.LoveRecord)
class LoveRecordAdmin(admin.ModelAdmin):
    list_display = ['id', 'content_object', 'user', 'love_date']


@admin.register(models.LoveCount)
class LoveCountAdmin(admin.ModelAdmin):
    list_display = ['id', 'content_object', 'like_num']

