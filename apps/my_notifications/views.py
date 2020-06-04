from django.core.paginator import Paginator
from django.shortcuts import render, get_object_or_404, redirect
from django.views.decorators.csrf import csrf_exempt
from notifications.models import Notification
from ouser.models import BBS_User, Follow
from app01.models import Bbs, Category, BigCategory
from app01.forms import BbsForm
from comment.models import Comment
from .forms import AvatarForm


# 消息通知页面
def my_notifications(request):
    context = {}
    return render(request, 'my_notifications.html', context)


# 中转页面，点击跳转消息通知并完成已读
def my_notification(request, my_notification_pk):
    my_notification = get_object_or_404(Notification, pk=my_notification_pk)
    my_notification.unread = False
    my_notification.save()
    return redirect(my_notification.description)


# 删除已读消息
def delete_read_notifications(request):
    notifications = request.user.notifications.read()
    notifications.delete()
    return redirect('my_notifications:my_notifications')


def my_articles(request):
    author = BBS_User.objects.get(id=request.user.id)
    my_articles_list = author.bbs_set.all()
    return render(request, 'account/my_articles.html', {'my_articles_list': my_articles_list})


def my_comments(request):
    author = BBS_User.objects.get(id=request.user.id)
    my_comments_list = author.comments.all()
    return render(request, 'account/my_comments.html', {'my_comments_list': my_comments_list})


def my_loves(request):
    author = BBS_User.objects.get(id=request.user.id)
    my_loves_list = author.loverecord_set.all()
    my_bbs_list = []
    for each in my_loves_list:
        my_bbs_list.append(Bbs.objects.get(pk=each.object_id))
    return render(request, 'account/my_loves.html', {'my_loves_list': my_loves_list,
                                                     'my_bbs_list': my_bbs_list})


def my_follow(request):
    my = request.user
    followeders = Follow.objects.filter(followed=my).all()
    follow_list = []
    for each in followeders:
        follow_list.append(each.follower)

    paginator = Paginator(follow_list, 5)
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
    return render(request, 'account/my_follow.html', {'page_of_bbs': page_of_bbs,
                                                      'page_range': page_range})


def delete_article(request, bbs_id):
    article_del = Bbs.objects.get(pk=bbs_id)
    article_del.delete()
    return redirect('ouser:personal_page')


def delete_comment(request, comment_id):
    comment_del = Comment.objects.get(pk=comment_id)
    comment_del.delete()
    return redirect('ouser:personal_page')


def edit_bbs(request, category__name, bbs_id):
    cate = Category.objects.get(name=category__name)
    article = Bbs.objects.get(pk=bbs_id)
    title = article.title
    summary = article.summary
    content = article.content
    return render(request, 'account/edit.html', {'bbs': article,
                                                 'cate': cate,
                                                 'bbs_form': BbsForm(initial={'summary': summary, 'title': title,
                                                                              'content': content})})


def save_edit(request, category__name, bbs_id):
    if request.method == 'POST':
        context = {}
        article = Bbs.objects.get(pk=bbs_id)
        bbs_form = BbsForm(request.POST, user=request.user)
        if bbs_form.is_valid():
            content = bbs_form.cleaned_data['content']
            title = bbs_form.cleaned_data['title']
            summary = bbs_form.cleaned_data['summary']
            article.title = title
            article.summary = summary
            article.content = content
            article.save()
            return redirect('/')
        else:
            context['status'] = 'ERROR'
            return redirect('/')


def change_avatar(request):
    return render(request, 'account/avatar.html')


@csrf_exempt
def save_avatar(request):
    myself = BBS_User.objects.get(pk=request.user.id)
    if request.method == 'POST':
        avatar_form = AvatarForm(request.POST, request.FILES, user=request.user)
        if avatar_form.is_valid():
            myself.avatar = avatar_form.cleaned_data['avatar']
            myself.save()
    return redirect('ouser:personal_page')
