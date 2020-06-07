from django.db import models
from imagekit.models import ProcessedImageField
from imagekit.processors import ResizeToFill
# from django.contrib.auth.models import User
from django.contrib.auth.models import AbstractUser

# Create your models here.


class BBS_User(AbstractUser):
    # user = models.OneToOneField(User, verbose_name='用户', on_delete=models.DO_NOTHING)
    signature = models.CharField(max_length=128, default='此人甚懒', verbose_name='签名')
    avatar = ProcessedImageField(upload_to='avatar/%Y/%m/%d', default='avatar/default.png',
                                 verbose_name='头像', processors=[ResizeToFill(80, 80)])
    is_reg = models.IntegerField(default=0, verbose_name='版主', null=True, blank=True)

    class Meta:
        verbose_name = '用户'  # 定义网站管理后台表名
        verbose_name_plural = verbose_name
        ordering = ['-id']

    def __str__(self):
        return self.username


class Follow(models.Model):
    follower = models.ForeignKey(BBS_User, related_name='follower', on_delete=models.CASCADE)
    followed = models.ForeignKey(BBS_User, related_name='followed', on_delete=models.CASCADE)
    date = models.DateTimeField(auto_now_add=True)

    class Meta:
        ordering = ('-date',)

    def __str__(self):
        return f'{self.follower} follow {self.followed}'
