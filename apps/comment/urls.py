from django.urls import path
from . import views

app_name = 'comment'
urlpatterns = [
    path('sub/', views.comment_sub, name='comment_sub')
]
