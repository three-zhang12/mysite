from django import template
from app01.models import Bbs
from django.utils.safestring import mark_safe
from comment.models import Comment


register = template.Library()

@register.simple_tag
def get_comment_count(entry=0):
    """获取一个文章的评论总数"""
    lis = Comment.objects.filter(article_id=entry)
    return lis.count()


'''
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
        comment_tree += "<div style='margin-left:%spx'  class='comment-node'>" % margin_left_val + k.article_comment + "</div>"
        # 上面的只是把第一层加了他可能还有儿子,所以通过递归继续加
        if v_dic:
            comment_tree += generate_comment_html(v_dic, margin_left_val+15)
    return comment_tree


@register.simple_tag
def build_comment_tree(bbs_id):
    bbs = Bbs.objects.get(pk=bbs_id)
    comment_list = bbs.comment_set.all()
    print('----------------->', comment_list)
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
            comment_tree += "<div class='comment-node'>" + k.comment + "</div>"
            # 通过递归把他儿子加上
            comment_tree += generate_comment_html(v, margin_left + 15)
        comment_tree += "</div>"
        comment_tree = mark_safe(comment_tree)
        print('------------------->', comment_tree)
        return comment_tree


@register.simple_tag
def get_comment(bbs_id):
    bbs = Bbs.objects.get(pk=bbs_id)
    comment_list = bbs.comment_set.all()
    return comment_list
'''
