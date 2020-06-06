from django.db import models
from app01.models import Bbs
from ouser.models import BBS_User
# Create your models here.


class Comment(models.Model):
    article = models.ForeignKey(Bbs, verbose_name='评论文章', on_delete=models.CASCADE)
    article_comment = models.TextField(max_length=500)
    user = models.ForeignKey(BBS_User, verbose_name='评论用户', related_name='comments', on_delete=models.CASCADE)
    date = models.DateTimeField(verbose_name='评论时间', auto_now_add=True)
    root = models.ForeignKey('self', verbose_name='根源评论', on_delete=models.CASCADE,
                             related_name='r_comment', blank=True, null=True)
    parent_comment = models.ForeignKey('self', verbose_name='上级评论', on_delete=models.CASCADE,
                                       related_name='p_comment', blank=True, null=True)
    reply_to = models.ForeignKey(BBS_User, verbose_name='上级评论用户', on_delete=models.CASCADE,
                                 blank=True, null=True, related_name='replies')

    def __str__(self):
        return self.article_comment

    class Meta:
        ordering = ['date']


'''
# 使用tag实现树状评论，旧版
class Comment(models.Model):
    article = models.ForeignKey(Bbs, verbose_name='评论文章', on_delete=models.DO_NOTHING)
    article_comment = models.TextField(max_length=500)
    user = models.ForeignKey(BBS_User, verbose_name='评论用户', on_delete=models.DO_NOTHING)
    date = models.DateTimeField(verbose_name='评论时间', auto_now_add=True)
    parent_comment = models.ForeignKey('self', verbose_name='上级评论', on_delete=models.DO_NOTHING,
                                       blank=True, null=True)

    def __str__(self):
        return self.article_comment
'''