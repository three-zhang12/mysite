from django.shortcuts import render, get_object_or_404, redirect
from django.views import generic
from django.http import HttpResponse, JsonResponse
from django.template import RequestContext
from django.utils.safestring import mark_safe
from django.conf import settings
from django.views import generic
from django.utils.text import slugify
from django.views.decorators.csrf import csrf_exempt
from django.contrib.contenttypes.models import ContentType
from django.db.models import ObjectDoesNotExist, Q
from django.core.paginator import Paginator

from comment.forms import CommentForm
from . import models
from .models import Bbs, LoveCount, LoveRecord
import time
import markdown
from markdown.extensions.toc import TocExtension
from comment.models import Comment
from .forms import BbsForm
from ouser.models import BBS_User
from notifications.models import Notification
# from haystack.generic_views import SearchView  # 导入搜索视图
# from haystack.query import SearchQuerySet


def IndexView(request):
    bigcategory = models.BigCategory.objects.all()
    return render(request, 'index.html', {'bigcategory': bigcategory})


def CategoryView(request, bigcategory__name):
    # 把url网址改为分类名，若要改回id名，则将传入参数bigcategory__name改为bigcategory_id，相应的把html中的url改回
    big = models.BigCategory.objects.filter(name=bigcategory__name)
    category = big[0].category_set.all()
    return render(request, 'index_cate.html', {'category': category,
                                               'big': big[0]})


def CategorydetailView(request, bigcategory__name, category__name):
    big = models.BigCategory.objects.filter(name=bigcategory__name)
    cate = models.Category.objects.filter(name=category__name)
    bbs_list = cate[0].bbs_set.all()
    # 分页
    paginator = Paginator(bbs_list, settings.ARTICLE_NUM)
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
    return render(request, 'index_cate_det.html', {'page_of_bbs': page_of_bbs,
                                                   'page_range': page_range,
                                                   'cate': cate[0],
                                                   'big': big[0]})


class Detail(generic.DetailView):
    models = Bbs
    template_name = 'blog-test.html'
    context_object_name = 'bbs'
    queryset = Bbs.objects.all()

    def get_object(self):
        obj = super().get_object()
        # 设置浏览量增加时间判断,同一篇文章两次浏览超过半小时才重新统计阅览量,作者浏览忽略
        u = self.request.user
        ses = self.request.session
        the_key = 'is_read_{}'.format(obj.id)
        is_read_time = ses.get(the_key)
        if u != obj.author:
            if not is_read_time:
                obj.update_views()
                ses[the_key] = time.time()
            else:
                now_time = time.time()
                t = now_time - is_read_time
                if t > 60 * 30:
                    obj.update_views()
                    ses[the_key] = time.time()
        md = markdown.Markdown(extensions=[
            'markdown.extensions.extra',
            'markdown.extensions.codehilite',
            TocExtension(slugify=slugify),
        ])
        obj.content = md.convert(obj.content)
        obj.toc = md.toc
        return obj

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        # 获取分类下所有文章
        category_bbs = models.Category.objects.get(pk=self.object.category.id).bbs_set.all()
        bbs_list = [x for x in category_bbs]
        current_bbs = Bbs.objects.get(pk=self.object.id)
        # 获取当前文章的前后文章
        if bbs_list[0] == current_bbs:
            next_bbs = None
        else:
            next_bbs = bbs_list[bbs_list.index(current_bbs) - 1]

        if bbs_list[-1] == current_bbs:
            previous_bbs = None
        else:
            previous_bbs = bbs_list[bbs_list.index(current_bbs) + 1]
        # 评论分页
        comment_list = Comment.objects.filter(article=Bbs.objects.get(pk=self.object.id), parent_comment=None)
        paginator = Paginator(comment_list, settings.COMMENT_NUM)
        page_num = self.request.GET.get('page', 1)
        page_of_comment = paginator.get_page(page_num)
        current_page_num = page_of_comment.number  # 当前页面
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
        context['previous_bbs'] = previous_bbs
        context['next_bbs'] = next_bbs
        context['cat_of_bigcategory'] = models.BigCategory.objects.get(pk=self.object.category.bigcategory.id)
        context['recent_cat_bbs'] = models.Category.objects.get(pk=self.object.category.id).bbs_set.all()[:10]
        context['my_bbs_list'] = BBS_User.objects.get(pk=self.object.author.id).bbs_set.all()[:10]
        context['category_list'] = models.BigCategory.objects.get(pk=self.object.category.bigcategory.id).category_set.all()
        context['comment_form'] = CommentForm(initial={'bbs_id': self.object.id, 'reply_to_id': 0})
        context['page_range'] = page_range
        context['page_of_comment'] = page_of_comment
        return context


'''
# 评论分级函数
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
    
    
def Detail(request, bigcategory__name, category__name, bbs__id):
    bbs = models.Bbs.objects.get(pk=bbs__id)
    comment_list = bbs.comment_set.all()
    comment_count = comment_list.count()
    # 评论分级显示
    comment_dic = {}
    comment_tree = ''
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
                                                'comment_list': comment_list,
                                                'comment_tree': comment_tree,
                                                'bigcategory__name': bigcategory__name,
                                                'category__name': category__name,
                                                'comment_count': comment_count,
                                                })
'''


'''
# 保存评论
def comment_sub(request, bigcategory__name, category__name, bbs__title):
    bbs = models.Bbs.objects.filter(title=bbs__title)[0]
    comment_content = request.POST.get('comment_content')
    comment = Comment.objects.create(
        article_comment=comment_content,
        user=request.user,
        article=bbs,
    )
    comment.save()
    comment_list = bbs.comment_set.all()
    return render(request, 'blog-single.html', {'bbs': bbs,
                                                'comment_list': comment_list,
                                                'bigcategory__name': bigcategory__name,
                                                'category__name': category__name
                                                })
'''


# 保存文本至数据库
@csrf_exempt
def content_sub(request, bigcategory__name, category__name):
    if request.method == 'POST':
        context = {}
        cate = models.Category.objects.get(name=category__name)
        big = models.BigCategory.objects.get(name=bigcategory__name)
        bbs_form = BbsForm(request.POST, user=request.user)
        if bbs_form.is_valid():
            content = bbs_form.cleaned_data['content']
            title = bbs_form.cleaned_data['title']
            summary = bbs_form.cleaned_data['summary']
            author = request.user
            blog = models.Bbs.objects.create(
                title=title,
                summary=summary,
                content=content,
                author=author,
                views=0,
                loves=0,
                category=cate,
            )
            blog.save()
            return redirect('/')
        else:
            context['status'] = 'ERROR'
            return redirect('/')


# 文本视图
def write(request, bigcategory__name, category__name):
    big = models.BigCategory.objects.filter(name=bigcategory__name)
    cate = models.Category.objects.filter(name=category__name)
    tag_list = models.Tag.objects.all()
    return render(request, 'write.html', {'big': big[0],
                                          'cate': cate[0],
                                          'tag_list': tag_list,
                                          'bbs_form': BbsForm(initial={'summary': '本人甚懒，不想填写'})})

'''
# 搜索视图
class MySearchView(SearchView):
    # 返回搜索结果集
    context_object_name = 'search_list'
    # 设置分页
    paginate_by = getattr(settings, 'BASE_PAGE_BY', None)
    paginate_orphans = getattr(settings, 'BASE_ORPHANS', 0)
    # 搜索结果以浏览量排序
    queryset = SearchQuerySet().order_by('-views')
'''


# 搜索视图

def MySearchView(request):
    search_content = request.GET.get('search_content', '').strip()
    condition = None
    for each in search_content.split(' '):
        if not condition:
            condition = Q(title__icontains=each)
            condition1 = Q(content__icontains=each)
        else:
            condition = condition | Q(title__icontains=each)
            condition1 = condition1 | Q(content__icontains=each)
    search_result = []
    if condition:
        search_result = Bbs.objects.filter(condition)
        search_result1 = Bbs.objects.filter(condition1)
    search_result = search_result.union(search_result1)
    count = search_result.count()
    # 分页
    paginator = Paginator(search_result, 5)
    page_num = request.GET.get('page', 1)
    page_of_bbs = paginator.get_page(page_num)
    return render(request, 'search.html', {'search_content': search_content,
                                           'search_result': search_result,
                                           'search_count': count,
                                           'page_of_bbs': page_of_bbs})


# 点赞失败和成功返回信息
def ErrorResponse(code, message, is_like):
    data = {}
    data['status'] = 'ERROR'
    data['code'] = code
    data['message'] = message
    data['is_like'] = is_like
    return JsonResponse(data)


def SuccessResponse(love_num, is_like):
    data = {}
    data['status'] = 'SUCCESS'
    data['love_num'] = love_num
    data['is_like'] = is_like
    return JsonResponse(data)


# 实时返回点赞状态（和前端ajax配合）
@csrf_exempt
def LoveView(request):
    content_type = request.POST.get('content_type')
    object_id = request.POST.get('object_id')
    try:
        content_type = ContentType.objects.get(model=content_type)
        model_class = content_type.model_class()
        model_obj = model_class.objects.get(pk=int(object_id))
    except ObjectDoesNotExist:
        return ErrorResponse(401, "object does not exist")

    is_like = request.POST.get('is_like')
    user = request.user
    if not user.is_authenticated:
        return ErrorResponse(401, "please login", is_like)

    if is_like == 'true':
        love_record, created = LoveRecord.objects.get_or_create(content_type=content_type, object_id=object_id, user=user)
        if created:
            # 未点赞
            love_count, created = LoveCount.objects.get_or_create(content_type=content_type, object_id=object_id)
            love_count.like_num += 1
            love_count.save()
            return SuccessResponse(love_count.like_num, is_like)
        else:
            # 不能重复点赞
            return ErrorResponse(401, "can't click twice", is_like)
    else:
        if LoveRecord.objects.filter(content_type=content_type, object_id=object_id, user=user).exists():
            love_record = LoveRecord.objects.filter(content_type=content_type, object_id=object_id, user=user)
            love_record.delete()
            love_count, created = LoveCount.objects.get_or_create(content_type=content_type, object_id=object_id)
            if not created:
                love_count.like_num -= 1
                love_count.save()
                return SuccessResponse(love_count.like_num, is_like)
            else:
                return ErrorResponse(403, "data error", is_like)
        else:
            return ErrorResponse(402, "never click", is_like)



