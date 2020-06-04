from django.urls import path, include
from . import views

app_name = 'app01'
urlpatterns = [
    path('', views.IndexView, name='index'),  # 主页
    # path('search/', views.MySearchView.as_view(), name='search'),
    path('search/', views.MySearchView, name='search'),
    path('article/<pk>/', views.Detail.as_view(), name='detail'),
    path('loves/', views.LoveView, name='loves'),
    # path('bigcategory/save/', views.content_sub, name='save'),
    # 把url网址改为分类名，若要改回id名，则改为int:bigcategory_id
    path('bigcategory/<str:bigcategory__name>/', views.CategoryView, name='category'),  # 分类页
    # 分类下的文章目录
    path('bigcategory/<str:bigcategory__name>/<str:category__name>/', views.CategorydetailView, name='category_detail'),
    path('bigcategory/<str:bigcategory__name>/<str:category__name>/save/', views.content_sub, name='save'),  # 保存文档
    path('bigcategory/<str:bigcategory__name>/<str:category__name>/write/', views.write, name='write'),  # 文本编写
    # 文章详情
    # path('bigcategory/<str:bigcategory__name>/<str:category__name>/<int:bbs__id>/', views.Detail, name='detail'),

    # path('bigcategory/<str:bigcategory__name>/<str:category__name>/<str:bbs__title>/comment_sub',
         # views.comment_sub, name='comment_sub'),
]
