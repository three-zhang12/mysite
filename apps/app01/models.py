from django.db import models
from ouser.models import BBS_User
from django.shortcuts import reverse
import markdown
from django.contrib.contenttypes.fields import GenericForeignKey
from django.contrib.contenttypes.models import ContentType
from ckeditor_uploader.fields import RichTextUploadingField


class BigCategory(models.Model):
    name = models.CharField(max_length=20, verbose_name='顶部分类')
    admin = models.ForeignKey(BBS_User, verbose_name='大版主', on_delete=models.DO_NOTHING)

    def __str__(self):
        return self.name


class Category(models.Model):
    name = models.CharField(max_length=20, verbose_name='分类')
    admin = models.ForeignKey(BBS_User, verbose_name='版主', on_delete=models.DO_NOTHING)
    bigcategory = models.ForeignKey(BigCategory, on_delete=models.CASCADE, verbose_name='顶部分类')

    def __str__(self):
        return self.name

    def get_absolute_url(self):
        return reverse('app01:category_detail', kwargs={'bigcategory__name': self.bigcategory.name,
                                                        'category__name': self.name
                                                 })


class Keyword(models.Model):
    name = models.CharField(max_length=20, verbose_name='关键词')

    def __str__(self):
        return self.name


class Tag(models.Model):
    name = models.CharField(max_length=30, verbose_name='标签')

    def __str__(self):
        return self.name


class Bbs(models.Model):
    title = models.CharField(max_length=64, verbose_name='标题')
    summary = models.CharField(max_length=256, blank=True, null=True, verbose_name='简介')
    author = models.ForeignKey(BBS_User, on_delete=models.CASCADE, verbose_name='作者')
    content = RichTextUploadingField()
    views = models.IntegerField(default=0, verbose_name='浏览数')
    loves = models.IntegerField(default=0, verbose_name='点赞数')
    created_date = models.DateTimeField(verbose_name='创建日期', auto_now_add=True)
    update_date = models.DateTimeField(verbose_name='更新日期', auto_now=True)
    category = models.ForeignKey(Category, verbose_name='分类', on_delete=models.CASCADE)
    keywords = models.ManyToManyField(Keyword, verbose_name='关键词', help_text='建议添加三到四个关键词', default='')
    tag = models.ManyToManyField(Tag, verbose_name='标签', default='')

    def __str__(self):
        return self.title[:20]

    class Meta:
        ordering = ['-created_date']

    def get_absolute_url(self):
        return reverse('app01:detail', kwargs={
                                               'pk': self.id
                                               })

    def get_user(self):
        return self.author

    def body_to_markdown(self):
        return markdown.markdown(self.content, extensions=[
            'markdown.extensions.extra',
            'markdown.extensions.codehilite',
        ])

    def update_views(self):
        self.views += 1
        self.save(update_fields=['views'])

    def get_pre(self):
        return Bbs.objects.filter(id__lt=self.id).order_by('-id').first()

    def get_next(self):
        return Bbs.objects.filter(id__gt=self.id).order_by('id').first()


# 点赞数
class LoveCount(models.Model):
    content_type = models.ForeignKey(ContentType, on_delete=models.CASCADE)
    object_id = models.PositiveIntegerField()
    content_object = GenericForeignKey('content_type', 'object_id')

    like_num = models.IntegerField(default=0, verbose_name='点赞数')


# 点赞记录
class LoveRecord(models.Model):
    content_type = models.ForeignKey(ContentType, on_delete=models.CASCADE)
    object_id = models.PositiveIntegerField()
    content_object = GenericForeignKey('content_type', 'object_id')

    user = models.ForeignKey(BBS_User, on_delete=models.CASCADE, verbose_name='作者')
    love_date = models.DateTimeField(auto_now_add=True)
