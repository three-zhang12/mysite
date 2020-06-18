import json

from captcha.helpers import captcha_image_url
from captcha.models import CaptchaStore
from django.contrib.auth import authenticate
from django.core.paginator import Paginator
from django.http import HttpResponseRedirect, JsonResponse, HttpResponse
from django.shortcuts import render
from django.contrib import auth
from django.views.decorators.csrf import csrf_exempt
from ouser.forms import UserForm, LoginForm, ChangePasswordForm, ForgotPasswordForm
from ouser.models import BBS_User, Follow
import re
from django.shortcuts import redirect
from django.core.mail import send_mail
import random
import string
import time
from django.urls import reverse


# 注册
@csrf_exempt
def register_view(request):
    context = {}
    if request.method == 'POST':
        form = UserForm(request.POST)
        next_to = request.POST.get('next', 0)
        if form.is_valid():
            # 获得表单数据
            username = form.cleaned_data['username']
            password = form.cleaned_data['password']
            password2 = form.cleaned_data['password2']
            email = form.cleaned_data['email']
            ver = form.cleaned_data['ver']
            context = {'username': username, 'pwd': password, 'email': email}
            if password.isdigit() or password.isalpha():
                context['pwd_error'] = 'nums_alpha'
                return render(request, 'account/signup.html', context)
            if password != password2:
                context['pwd_error'] = 'unequal'
                return render(request, 'account/signup.html', context)

            # 判断用户是否存在
            user = BBS_User.objects.filter(username=username)
            Email = BBS_User.objects.filter(email=email)
            pwd_length = len(password)
            if pwd_length < 8 or pwd_length > 20:
                context['pwd_error'] = 'length'
                return render(request, 'account/signup.html', context)

            user_length = len(username)

            if user_length < 5 or user_length > 20:
                context['user_error'] = 'length'
                return render(request, 'account/signup.html', context)
            if user:
                context['user_error'] = 'exit'
                return render(request, 'account/signup.html', context)
            if not re.match('^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z0-9]{2,6}$', email):
                context['email_error'] = 'format'
                return render(request, 'account/signup.html', context)
            if Email:
                context['email_error'] = 'exit'
                return render(request, 'account/signup.html', context)
            if ver != request.session['verification%s' % email.split('.')[0].replace('@', '_')]:
                context['ver_error'] = 'error'
                return render(request, 'account/signup.html', context)

            # 添加到数据库（还可以加一些字段的处理）
            user = BBS_User.objects.create_user(username=username, password=password, email=email)
            user.save()
            user = auth.authenticate(username=username, password=password)

            # 注册成功后清除验证码
            del request.session['verification%s' % email.split('.')[0].replace('@', '_')]

            # 添加到session
            request.session['username%s' % username] = username
            request.session['email%s' % username] = email
            request.session['uid%s' % username] = user.id
            request.session['nick'] = ''

            # 调用auth登录
            auth.login(request, user)
            # 重定向到首页
            if next_to == '':
                next_to = '/'
            return redirect(next_to)
    else:
        next_to = request.GET.get('next', '/')
        context = {'isLogin': False}
        context['next_to'] = next_to
    # 将req 、页面 、以及context{}（要传入html文件中的内容包含在字典里）返回
    return render(request, 'account/signup.html', context)


# 登陆
@csrf_exempt
def login_view(request):
    context = {}
    context['capt_form'] = LoginForm()
    if request.method == 'POST':
        form = LoginForm(request.POST)
        next_to = request.POST.get('next', '/')  # 获取跳转前页面 配合前端使用，前端a标签跳转链接加?next={{request.get_full_path}}
        remember = request.POST.get('remember', 0)

        if form.is_valid():
            # 获取表单用户密码
            username = form.cleaned_data['username']
            password = form.cleaned_data['password']
            context = {'username': username, 'pwd': password}
            # 判断邮箱是否存在
            if '@' in username:
                if BBS_User.objects.filter(email=username):
                    username = BBS_User.objects.filter(email=username)[0].username
                else:
                    context['error'] = True
                    return render(request, 'account/login.html', context)
            # 获取的表单数据与数据库进行比较
            user = authenticate(username=username, password=password)
            if next_to == '':
                next_to = '/'
            if user:
                if user.is_active:
                    # 比较成功，跳转index
                    auth.login(request, user)
                    request.session['username%s' % username] = username
                    request.session['uid%s' % username] = user.id
                    request.session['nick'] = None
                    request.session['tid'] = None
                    reqs = HttpResponseRedirect(next_to)

                    if remember != 0:
                        reqs.set_cookie('username', BBS_User.objects.get(username=username).email)
                    else:
                        reqs.set_cookie('username', '', max_age=-1)
                    return reqs
                else:
                    context['inactive'] = True
                    return render(request, 'account/login.html', context)
            else:
                # 比较失败，还在login
                context['error'] = True
                return render(request, 'account/login.html', context)
    else:
        next_to = request.GET.get('next', '/')
        context['next_to'] = next_to
    return render(request, 'account/login.html', context)


# 登出
def logout_view(req):
    # 清理cookie里保存username
    next_to = req.GET.get('next', '/')
    if next_to == '':
        next_to = '/'
    auth.logout(req)
    return redirect(next_to)


def personal_page(request):
    return render(request, 'personal_page.html')


@csrf_exempt
def send_ver(request):
    email = request.POST.get('email', '')
    Email_exist = BBS_User.objects.filter(email=email)
    data = {}
    if email:
        # 验证邮箱是否有效
        if not re.match('^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z0-9]{2,6}$', email):
            data['status'] = 'ERROR'
            data['message'] = '请填写正确的邮箱！'
            return JsonResponse(data)
        if Email_exist:
            data['status'] = 'ERROR'
            data['message'] = '此邮箱已被绑定！'
            return JsonResponse(data)
        # 生成验证码
        code = ''.join(random.sample((string.ascii_letters + string.digits), 4))
        verification = 'verification%s' % email.split('.')[0].replace('@', '_')
        request.session[verification] = code
        now = int(time.time())
        send_time = 'send_time%s' % email.split('.')[0].replace('@', '_')
        send_code_time = request.session.get(send_time, 0)
        if now - send_code_time < 30:
            data['status'] = 'ERROR'
            data['message'] = '30秒后可再次发送！'
        else:
            request.session[send_time] = now
            send_mail(
                'JC验证',
                '验证码：%s' % code,
                'jcjc_jjc@163.com',
                [email],
                fail_silently=False
            )
            data['status'] = "SUCCESS"
    else:
        data['status'] = 'ERROR'
    return JsonResponse(data)


@csrf_exempt
def change_password(request):
    if request.method == 'POST':
        form = ChangePasswordForm(request.POST, user=request.user)
        if form.is_valid():
            user = request.user
            old_password = form.cleaned_data['old_password']
            new_password = form.cleaned_data['new_password']
            user.set_password(new_password)
            user.save()
            auth.logout(request)
            return redirect('/')
    else:
        form = ChangePasswordForm()

    context = {}
    context['page_title'] = '修改密码'
    context['form_title'] = '修改密码'
    context['submit_text'] = '修改'
    context['form'] = form
    context['return_back_url'] = '/'
    return render(request, 'form.html', context)


# 忘记密码->发送验证码
@csrf_exempt
def forgot_ver(request):
    email = request.POST.get('email', '')
    Email_exist = BBS_User.objects.filter(email=email)
    data = {}
    if email:
        # 验证邮箱是否有效
        if not re.match('^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z0-9]{2,6}$', email):
            data['status'] = 'ERROR'
            data['message'] = '请填写正确的邮箱！'
            return JsonResponse(data)
        if not Email_exist:
            data['status'] = 'ERROR'
            data['message'] = '此邮箱未被绑定！'
            return JsonResponse(data)
        # 生成验证码
        code = ''.join(random.sample((string.ascii_letters + string.digits), 4))
        verification = 'forgot_verification%s' % email.split('.')[0].replace('@', '_')
        request.session[verification] = code
        now = int(time.time())
        send_time = 'send_time%s' % email.split('.')[0].replace('@', '_')
        send_code_time = request.session.get(send_time, 0)
        if now - send_code_time < 30:
            data['status'] = 'ERROR'
            data['message'] = '30秒后可再次发送！'
        else:
            request.session[send_time] = now
            send_mail(
                'JC验证',
                '验证码：%s' % code,
                'jcjc_jjc@163.com',
                [email],
                fail_silently=False
            )
            data['status'] = "SUCCESS"
    else:
        data['status'] = 'ERROR'
    return JsonResponse(data)


@csrf_exempt
def forgot_password(request):
    context = {}
    if request.method == 'POST':
        form = ForgotPasswordForm(request.POST)
        if form.is_valid():
            # 获得表单数据
            password = form.cleaned_data['password']
            email = form.cleaned_data['email']
            ver = form.cleaned_data['ver']
            context = {'pwd': password, 'email': email}
            if password.isdigit() or password.isalpha():
                context['pwd_error'] = 'nums_alpha'
                return render(request, 'account/signup.html', context)

            # 判断邮箱是否存在
            Email = BBS_User.objects.filter(email=email)
            pwd_length = len(password)
            if pwd_length < 8 or pwd_length > 20:
                context['pwd_error'] = 'length'
                return render(request, 'account/forgot_password.html', context)

            if not re.match('^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z0-9]{2,6}$', email):
                context['email_error'] = 'format'
                return render(request, 'account/forgot_password.html', context)
            if not Email:
                context['email_error'] = 'notexit'
                return render(request, 'account/forgot_password.html', context)
            if ver != request.session['forgot_verification%s' % email.split('.')[0].replace('@', '_')]:
                context['ver_error'] = 'error'
                return render(request, 'account/forgot_password.html', context)

            # 添加到数据库（还可以加一些字段的处理）
            user = BBS_User.objects.get(email=email)
            user.set_password(password)
            user.save()
            # 注册成功后清除验证码
            del request.session['forgot_verification%s' % email.split('.')[0].replace('@', '_')]

            return redirect('/')
    else:
        next_to = request.GET.get('next', '/')
        context = {'isLogin': False}
        context['next_to'] = next_to
    # 将req 、页面 、以及context{}（要传入html文件中的内容包含在字典里）返回
    return render(request, 'account/forgot_password.html', context)


# 验证码刷新
def img_refresh(request):
    if not request.is_ajax():
        return HttpResponse('不是Ajax请求')
    new_key = CaptchaStore.generate_key()
    to_json_response = {
        'hashkey': new_key,
        'image_url': captcha_image_url(new_key),
    }
    return HttpResponse(json.dumps(to_json_response))


# 验证
def img_check(request):
    if request.is_ajax():
        cs = CaptchaStore.objects.filter(response=request.GET.get('code'),
                                         hashkey=request.GET.get('hashkey'))
        if cs:
            json_data = {'status': 1}
        else:
            json_data = {'status': 0}
        return JsonResponse(json_data)
    else:
        # raise Http404
        json_data = {'status': 0}
        return JsonResponse(json_data)


# 他人主页
def other_page(request, bbs_user__username):
    page_user = BBS_User.objects.get(username=bbs_user__username)
    page_bbs_list = page_user.bbs_set.all()

    # 是否关注

    if Follow.objects.filter(follower=page_user, followed=request.user):
        f = True
    else:
        f = False

    # 分页
    paginator = Paginator(page_bbs_list, 5)
    page_num = request.GET.get('page', 1)
    page_of_bbs = paginator.get_page(page_num)
    current_page_num = page_of_bbs.number  # 当前页面
    # 获取前后共五页
    page_range = list(range(max(current_page_num - 2, 1), min(paginator.num_pages + 1, current_page_num + 3)))
    # 添加首尾页
    if page_range[0] - 2 >= 1:
        page_range.insert(0, '...')
    if paginator.num_pages - page_range[-1] >= 2:
        page_range.append('...')
    if page_range[0] != 1:
        page_range.insert(0, 1)
    if page_range[-1] != paginator.num_pages:
        page_range.append(paginator.num_pages)

    return render(request, 'account/others_page.html', {'page_of_bbs': page_of_bbs,
                                                        'page_range': page_range,
                                                        'page_user': page_user,
                                                        'f': f})


@csrf_exempt
def follow(request):
    other_name = request.POST.get('other_name')
    my = request.user
    if my:
        other = BBS_User.objects.get(username=other_name)
        if Follow.objects.filter(follower=other, followed=my):
            return redirect('ouser:other_page', other_name)
        else:
            Follow(follower=other, followed=my).save()
    else:
        return render(request, '404.html')
    return redirect('ouser:other_page', other_name)


@csrf_exempt
def follow_delete(request):
    other_name = request.POST.get('other_name')
    my = request.user
    other = BBS_User.objects.get(username=other_name)
    f = Follow.objects.filter(follower=other, followed=my)
    if f:
        f.delete()
        return redirect('ouser:personal_page')
    else:
        return redirect('ouser:personal_page')