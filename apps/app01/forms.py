from django import forms
from ckeditor_uploader.widgets import CKEditorUploadingWidget
from ckeditor.widgets import CKEditorWidget


class BbsForm(forms.Form):
    title = forms.CharField(max_length=200, help_text='请输入文章标题:',
                            widget=forms.TextInput(attrs={'class': 'article_title'}))
    summary = forms.CharField(max_length=300, help_text='请输入文章简介:',
                              widget=forms.TextInput(attrs={'class': 'article_summary'}))
    content = forms.CharField(widget=CKEditorUploadingWidget(config_name='bbs_ckeditor'))

    def __init__(self, *args, **kwargs):
        if 'user' in kwargs:
            self.user = kwargs.pop('user')
        super(BbsForm, self).__init__(*args, **kwargs)

    def clean(self):
        # 判断用户是否登录
        if self.user.is_authenticated:
            self.cleaned_data['user'] = self.user
        else:
            raise forms.ValidationError('用户尚未登录！')
