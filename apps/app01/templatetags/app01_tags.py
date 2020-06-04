from django import template
from app01.models import BigCategory, Category, Keyword, Tag, Bbs
import re
from django.utils.safestring import mark_safe
from django.contrib.contenttypes.models import ContentType
from ..models import LoveCount, LoveRecord
import datetime

register = template.Library()


@register.simple_tag
def get_bigcategory_list():
    return BigCategory.objects.all()


@register.simple_tag
def get_bbs_recent():
    return Bbs.objects.all()[0:10]


@register.simple_tag
def get_hot_recent():
    t = (datetime.datetime.now() - datetime.timedelta(days=15)).strftime("%Y-%m-%d %H:%M:%S")  # 获取n天前的日期
    bbs_list = Bbs.objects.filter(created_date__gte=t)
    return bbs_list.order_by('-views')[0:10]


# 返回文章分类查询集
@register.simple_tag
def get_category_list(id):
    """返回小分类列表"""
    return Category.objects.filter(bigcategory_id=id)


@register.simple_tag
def my_highlight(text, q):
    """自定义标题搜索词高亮函数，忽略大小写"""
    if len(q) > 1:
        try:
            text = re.sub(q, lambda a: '<span class="highlighted">{}</span>'.format(a.group()),
                          text, flags=re.IGNORECASE)
            text = mark_safe(text)
        except:
            pass
    return text


# 获取前一篇文章，参数当前文章 ID
@register.simple_tag
def get_article_previous(bbs_id):
    has_previous = False
    id_previous = int(bbs_id)
    while not has_previous and id_previous >= 1:
        article_previous = Bbs.objects.filter(id=id_previous - 1).first()
        if not article_previous:
            id_previous -= 1
        else:
            has_previous = True
    if has_previous:
        article = Bbs.objects.filter(id=id_previous).first()
        return article
    else:
        return


# 获取下一篇文章，参数当前文章 ID
@register.simple_tag
def get_article_next(bbs_id):
    has_next = False
    id_next = int(bbs_id)
    article_id_max = Bbs.objects.all().order_by('-id').first()
    id_max = article_id_max.id
    while not has_next and id_next <= id_max:
        article_next = Bbs.objects.filter(id=id_next + 1).first()
        if not article_next:
            id_next += 1
        else:
            has_next = True
    if has_next:
        article = Bbs.objects.filter(id=id_next).first()
        return article
    else:
        return


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


@register.simple_tag
def build_comment_tree(bbs_id):
    bbs = Bbs.objects.get(pk=bbs_id)
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
                            "<img alt='' src='/media/%s' class='avatar avatar-54 photo avatar-default' height='54' width='54' />" % str(
                k.user.avatar) \
                            + k.user.username + '<hr>' + k.article_comment + '<hr>' + \
                            str(k.date)[:19] + '<hr>' + '<a href="javascript:reply(%s);">回复</a>'%k.pk + '<hr>' + "</div>"
            # 通过递归把他儿子加上
            comment_tree += generate_comment_html(v, margin_left + 15)
        comment_tree += "</div>"
        comment_tree = mark_safe(comment_tree)
    return comment_tree


@register.simple_tag
def get_comment_count(bbs_id):
    bbs = Bbs.objects.get(pk=bbs_id)
    comment_list = bbs.comment_set.all()
    comment_count = comment_list.count()
    return comment_count


# 获取点赞数
@register.simple_tag
def get_love_count(obj):
    content_type = ContentType.objects.get_for_model(obj)
    love_count, created = LoveCount.objects.get_or_create(content_type=content_type, object_id=obj.pk)
    return love_count.like_num


# 点赞状态
@register.simple_tag(takes_context=True)
def get_love_status(context, obj):
    content_type = ContentType.objects.get_for_model(obj)
    user = context['user']
    if not user.is_authenticated:
        return ''
    if LoveRecord.objects.filter(content_type=content_type, object_id=obj.pk, user=user).exists():
        return 'active'
    else:
        return ''
