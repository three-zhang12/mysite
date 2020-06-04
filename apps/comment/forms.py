from django import forms
from app01 import models
from django.db.models import ObjectDoesNotExist
from ckeditor.widgets import CKEditorWidget
from .models import Comment


class CommentForm(forms.Form):
    comment_content = forms.CharField(max_length=500, widget=CKEditorWidget(config_name='comment_ckeditor'),
                                      error_messages={'required': '评论内容不能为空'})
    bbs_id = forms.IntegerField(widget=forms.HiddenInput)
    reply_to_id = forms.IntegerField(widget=forms.HiddenInput(attrs={'id': 'reply_to_id'}))

    def __init__(self, *args, **kwargs):
        if 'user' in kwargs:
            self.user = kwargs.pop('user')
        super(CommentForm, self).__init__(*args, **kwargs)

    def clean(self):
        # 判断用户是否登录
        if self.user.is_authenticated:
            self.cleaned_data['user'] = self.user
        else:
            raise forms.ValidationError('用户尚未登录！')
        # 判断评论对象是否存在
        bbs_id = self.cleaned_data['bbs_id']
        try:
            bbs = models.Bbs.objects.get(pk=bbs_id)
            self.cleaned_data['bbs'] = bbs
        except ObjectDoesNotExist:
            raise forms.ValidationError('评论对象不存在！')
        return self.cleaned_data

    def clean_reply_to_id(self):
        reply_to_id = self.cleaned_data['reply_to_id']
        if not reply_to_id:
            self.cleaned_data['parent'] = None
        elif Comment.objects.filter(pk=reply_to_id).exists():
            self.cleaned_data['parent'] = Comment.objects.get(pk=reply_to_id)
        else:
            raise forms.ValidationError('回复错误！')
        return reply_to_id


