from .models import BBS_User
from django import forms
from captcha.fields import CaptchaField


class UserForm(forms.Form):
    username = forms.CharField(max_length=30)
    password = forms.CharField(max_length=50)
    password2 = forms.CharField(max_length=50)
    email = forms.CharField(max_length=50)
    ver = forms.CharField()


class LoginForm(forms.Form):
    username = forms.CharField(max_length=30)
    password = forms.CharField(max_length=50)
    captcha = CaptchaField()


class ChangePasswordForm(forms.Form):
    old_password = forms.CharField(
        label='旧的密码',
        widget=forms.PasswordInput(
            attrs={'class':'form-control', 'placeholder':'请输入旧的密码'}
        )
    )
    new_password = forms.CharField(
        label='新的密码',
        widget=forms.PasswordInput(
            attrs={'class':'form-control', 'placeholder':'请输入新的密码'}
        )
    )
    new_password_again = forms.CharField(
        label='请再次输入新的密码',
        widget=forms.PasswordInput(
            attrs={'class':'form-control', 'placeholder':'请再次输入新的密码'}
        )
    )

    def __init__(self, *args, **kwargs):
        if 'user' in kwargs:
            self.user = kwargs.pop('user')
        super(ChangePasswordForm, self).__init__(*args, **kwargs)

    def clean(self):
        # 验证新的密码是否一致
        new_password = self.cleaned_data.get('new_password', '')
        new_password_again = self.cleaned_data.get('new_password_again', '')
        pwd_length = len(new_password)
        if new_password != new_password_again or new_password == '':
            raise forms.ValidationError('两次输入的密码不一致')
        if pwd_length < 8 or pwd_length > 20:
            raise forms.ValidationError('密码限制8~20个字符')
        if new_password.isdigit() or new_password.isalpha():
            raise forms.ValidationError('密码不能使用纯数字或字母')
        return self.cleaned_data

    def clean_old_password(self):
        # 验证旧的密码是否正确
        old_password = self.cleaned_data.get('old_password', '')
        if not self.user.check_password(old_password):
            raise forms.ValidationError('旧的密码错误')
        return old_password


class ForgotPasswordForm(forms.Form):
    password = forms.CharField(max_length=50)
    email = forms.CharField(max_length=50)
    ver = forms.CharField()
