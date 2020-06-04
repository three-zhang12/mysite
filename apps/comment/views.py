from django.shortcuts import render, redirect
from django.views.decorators.csrf import csrf_exempt
from django.http import JsonResponse
from django.utils.safestring import mark_safe
from django.utils.html import strip_tags
from django.conf import settings
from app01 import models
from notifications.signals import notify
from .forms import CommentForm
from .models import Comment



@csrf_exempt
def comment_sub(request):
    referer = request.META.get('HTTP_REFERER', '/')  # 跳转回原网页
    comment_form = CommentForm(request.POST, user=request.user)
    data = {}
    if comment_form.is_valid():
        comment = Comment.objects.create(
            article_comment=comment_form.cleaned_data['comment_content'],
            user=comment_form.cleaned_data['user'],
            article=comment_form.cleaned_data['bbs'],
        )
        parent = comment_form.cleaned_data['parent']
        if parent:
            comment.root = parent.root if parent.root else parent
            comment.parent_comment = parent
            comment.reply_to = parent.user

        comment.save()

        # 发送站内消息
        if comment.reply_to:
            recipient = comment.reply_to
            verb = '{0}回复了你的评论“{1}”'.format(comment.user.username,
                                            strip_tags(comment.parent_comment.article_comment))
            '''
            跳转到父评论所在页面暂未解决，暂时跳转到文章首页
            num_page = comment.article.comment_set.filter(parent_comment=None).count() // settings.COMMENT_NUM
            url = comment.parent_comment.article.get_absolute_url() + '?page=' \
                  + str(num_page) + "#comment_" + str(comment.pk)
            '''
            url = comment.parent_comment.article.get_absolute_url()
        else:
            recipient = comment.article.get_user()
            # if comment_form.cleaned_data['bbs'].model == 'Bbs':
            verb = '{0}评论了《{1}》'.format(comment.user.username, comment.article.title)
            # else:
            # raise Exception('unknown comment object')
            num_page = comment.article.comment_set.filter(parent_comment=None).count() // settings.COMMENT_NUM
            url = comment.article.get_absolute_url() + '?page=' + str(num_page) + "#comment_" + str(comment.pk)
        notify.send(comment.user, recipient=recipient, verb=verb, action_obejct=comment, description=url)

        # return redirect(referer)
        data['status'] = 'SUCCESS'
        data['user'] = comment.user.username
        data['avatar'] = str(comment.user.avatar)
        data['text'] = comment.article_comment
        data['comment_time'] = comment.date.strftime('%Y-%m-%d %H:%M:%S')
        data['reply_to'] = comment.reply_to.username if parent else ''
        data['reply_avatar'] = str(comment.reply_to.avatar) if parent else ''
        data['pk'] = comment.pk
        data['root_pk'] = comment.root.pk if comment.root else ''

    else:
        # return render(request, '404.html', {'message': comment_form.errors, 'redirect_to': referer})
        data['status'] = 'ERROR'
        data['message'] = list(comment_form.errors.values())[0][0]

    return JsonResponse(data)


'''
第二版评论提交，没有使用django的form表单
@csrf_exempt
def comment_sub(request):
    category_name = request.POST.get('category_name')
    bbs_id = int(request.POST.get('bbs_id'))
    bbs = models.Bbs.objects.get(pk=bbs_id)
    comment_content = request.POST.get('comment_content', '').strip()
    if not request.user.is_authenticated:
        return render(request, '404.html', {'error': '未登录'})
    if comment_content == '':
        return render(request, '404.html', {'error': '评论不能为空'})
    comment = Comment.objects.create(
        article_comment=comment_content,
        user=request.user,
        article=bbs,
    )
    comment.save()
    referer = request.META.get('HTTP_REFERER', '/')  # 跳转回原网页
    return redirect(referer)
'''


'''
第一版评论提交，不能自动跳转
def tree_search(d_dic, comment_obj):  # 这里不用传附近和儿子了因为他是一个对象,可以直接找到父亲和儿子
    for k, v_dic in d_dic.items():
        if k == comment_obj.parent_comment:  # 如果找到了
            d_dic[k][comment_obj] = {}  # 如果找到父亲了,你的把自己存放在父亲下面,并把自己当做key,value为一个空字典
            return
        else:  # 如果找不到递归查找
            tree_search(d_dic[k], comment_obj)


def generate_comment_html(sub_comment_dic, margin_left_val):
    # 先创建一个html默认为空
    comment_tree = ""
    for k, v_dic in sub_comment_dic.items():  # 循环穿过来的字典
        comment_tree += "<div style='margin-left:%spx'  class='comment-node'>" % margin_left_val + \
                        "<img alt='' src='/media/%s' class='avatar avatar-54 photo avatar-default' height='30' width='30' />"%str(k.user.avatar)\
                        +k.user.username + '<hr>' + k.article_comment + '<hr>' + \
                            str(k.date)[:19] + '<hr>' + "</div>"
        # 上面的只是把第一层加了他可能还有儿子,所以通过递归继续加
        if v_dic:
            comment_tree += generate_comment_html(v_dic, margin_left_val+15)
    return comment_tree
    

@csrf_exempt
def comment_sub(request):
    category_name = request.POST.get('category_name')
    bbs_id = int(request.POST.get('bbs_id'))
    bbs = models.Bbs.objects.get(pk=bbs_id)
    comment_content = request.POST.get('comment_content')
    comment = Comment.objects.create(
        article_comment=comment_content,
        user=request.user,
        article=bbs,
    )
    comment.save()
    comment_list = bbs.comment_set.all()
    comment_count = comment_list.count()
    # 评论分级显示
    comment_dic = {}
    for comment_obj in comment_list:  # 每一个元素都是一个对象
        if comment_obj.parent_comment is None:  # 如果没有父亲
            comment_dic[comment_obj] = {}
        else:
            # 通过递归找
            tree_search(comment_dic, comment_obj)
        # div框架
        comment_tree = "<div class='comment-box'>"
        margin_left = 0
        for k, v in comment_dic.items():
            # 第一层的html
            comment_tree += "<div class='comment-node'>" + \
                            "<img alt='' src='/media/%s' class='avatar avatar-54 photo avatar-default' height='54' width='54' />"%str(k.user.avatar) \
                            + k.user.username + '<hr>' + k.article_comment + '<hr>' + \
                            str(k.date)[:19] + '<hr>' + '<hr>' + "</div>"
            # 通过递归把他儿子加上
            comment_tree += generate_comment_html(v, margin_left + 15)
        comment_tree += "</div>"
        comment_tree = mark_safe(comment_tree)
    return render(request, 'blog-single.html', {'bbs': bbs,
                                                'comment_tree': comment_tree,
                                                'comment_list': comment_list,
                                                'category__name': category_name,
                                                'comment_count': comment_count,
                                                })
'''