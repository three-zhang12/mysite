"""BBS URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from django.conf.urls.static import static
from django.conf import settings
from django.contrib.sitemaps.views import sitemap
from app01.sitemaps import BbsSitemap, CategorySitemap
from rest_framework.routers import DefaultRouter
from api import views as api_views
from app01.feeds import AllbbsRssFeed


if settings.API_FLAG:
    router = DefaultRouter()
    router.register(r'users', api_views.UserListSet)
    router.register(r'articles', api_views.ArticleListSet)
    router.register(r'tags', api_views.TagListSet)
    router.register(r'categorys', api_views.CategoryListSet)


# 网站地图
sitemaps = {
    'articles': BbsSitemap,
    'categories': CategorySitemap
}


urlpatterns = [
    path('', include('app01.urls', namespace='app01')),
    path('ckeditor', include('ckeditor_uploader.urls')),
    path('captcha/', include('captcha.urls')),
    path('account/', include('ouser.urls', namespace='ouser')),  # 用户
    path('comment/', include('comment.urls', namespace='commnet')),  # 评论
    path('my_notifications/', include('my_notifications.urls', namespace='my_notifications')),  # 评论
    path('inbox/notifications/', include('notifications.urls', namespace='notifications')),
    path('sitemap.xml/', sitemap, {'sitemaps': sitemaps}, name='django.contrib.sitemaps.views.sitemap'),  # 消息通知
    path('feed/', AllbbsRssFeed(), name='rss'),
    path('admin/', admin.site.urls),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

if settings.API_FLAG:
    urlpatterns.append(path('api/v1/', include(router.urls, )))
