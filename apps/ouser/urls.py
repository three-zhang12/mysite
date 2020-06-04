from django.urls import path, include
from ouser.views import register_view, login_view, logout_view, \
    personal_page, send_ver, change_password, forgot_password, \
    forgot_ver, img_check, img_refresh, other_page, follow, follow_delete

app_name = 'ouser'
urlpatterns = [
    path(r'login/', login_view, name='login'),
    path(r'logout/', logout_view, name='logout'),
    path(r'register/', register_view, name='register'),
    path('personal_page', personal_page, name='personal_page'),
    path('email_ver/', send_ver, name='email_ver'),
    path('change_password', change_password, name='change_password'),
    path('forgot_ver/', forgot_ver, name='forgot_ver'),
    path('forgot_password', forgot_password, name='forgot_password'),
    path('refresh_captcha/', img_refresh, name='refresh_captcha'),
    path('check_captcha/', img_check, name='check_captcha'),
    path('page/<str:bbs_user__username>/', other_page, name='other_page'),
    path('follow/', follow, name='follow'),
    path('follow_delete/', follow_delete, name='follow_delete'),

]