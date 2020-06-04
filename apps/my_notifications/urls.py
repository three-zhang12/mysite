from django.urls import path, include
from . import views


app_name = 'my_notifications'

urlpatterns = [
    path('', views.my_notifications, name='my_notifications'),
    path('<int:my_notification_pk>', views.my_notification, name='my_notification'),
    path('delete_read_notifications/', views.delete_read_notifications, name='delete_read_notifications'),
    path('my_articles', views.my_articles, name='my_articles'),
    path('my_comments', views.my_comments, name='my_comments'),
    path('my_loves', views.my_loves, name='my_loves'),
    path('my_follow', views.my_follow, name='my_follow'),
    path('change_avatar', views.change_avatar, name='change_avatar'),
    path('save_avatar', views.save_avatar, name='save_avatar'),
    path('delete_article/<int:bbs_id>', views.delete_article, name='delete_article'),
    path('delete_comment/<int:comment_id>', views.delete_comment, name='delete_comment'),
    path('<str:category__name>/<int:bbs_id>/edit/', views.edit_bbs, name='edit'),
    path('<str:category__name>/<int:bbs_id>/save_edit/', views.save_edit, name='save_edit'),

]