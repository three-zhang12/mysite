"""
Django settings for BBS project.

Generated by 'django-admin startproject' using Django 3.0.5.

For more information on this file, see
https://docs.djangoproject.com/en/3.0/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/3.0/ref/settings/
"""

import os
import sys


# Build paths inside the project like this: os.path.join(BASE_DIR, ...)


BASE_DIR = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))


# Application definition

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'django.contrib.sitemaps',
    'app01.apps.App01Config',
    'ouser.apps.OuserConfig',
    'comment.apps.CommentConfig',
    'my_notifications.apps.MyNotificationsConfig',
    'imagekit',
    # 'haystack',
    'rest_framework',
    'ckeditor',  # django的富文本编辑器
    'ckeditor_uploader',  # 文本编辑的图像上传功能
    'notifications',  # 消息通知
    'captcha',  # 验证码
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'BBS.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [os.path.join(BASE_DIR, 'templates')]
        ,
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'BBS.wsgi.application'


# Database
# https://docs.djangoproject.com/en/3.0/ref/settings/#databases

# 添加app目录
sys.path.insert(0, os.path.join(BASE_DIR, 'apps'))

# Password validation
# https://docs.djangoproject.com/en/3.0/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/3.0/topics/i18n/

LANGUAGE_CODE = 'zh-hans'

TIME_ZONE = 'Asia/Shanghai'

USE_I18N = True

USE_L10N = True

# USE_TZ = True
USE_TZ = False  # 不改的话数据库时间会和前端显示时间差八小时


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/3.0/howto/static-files/


STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR, 'static_collected')
STATICFILES_DIRS = [
    os.path.join(BASE_DIR, 'static')
]

AUTH_USER_MODEL = 'ouser.BBS_User'

# 媒体文件收集
MEDIA_URL = "/media/"   # 媒体文件别名(相对路径) 和 绝对路径
MEDIA_ROOT = os.path.join(BASE_DIR, 'media')


'''
# haystack 搜索
HAYSTACK_CONNECTIONS = {
    'default': {
        # 选择语言解析器为自己更换的结巴分词
        'ENGINE': 'haystack.backends.whoosh_cn_backend.WhooshEngine',
        # 保存索引文件的地址，选择主目录下，这个会自动生成
        'PATH': os.path.join(BASE_DIR, 'whoosh_index'),
    },
}
'''

# 配置富文本编辑器ckeditor
CKEDITOR_UPLOAD_PATH = 'upload'

CKEDITOR_CONFIGS = {
    "default": {
        # 使用简体中文
        'language': 'zh-cn',
        # 编辑器的宽高请根据你的页面自行设置
        'width': '730px',
        'height': '150px',
        'image_previewText': ' ',
        'tabSpaces': 4,
        'toolbar': 'Custom',
        # 添加按钮在这里
        'toolbar_Custom': [
            ['Bold', 'Italic', 'Underline', 'Format', 'RemoveFormat'],
            ['NumberedList', 'BulletedList'],
            ['Blockquote', 'CodeSnippet'],
            ['Image', 'Link', 'Unlink'],
            ['Maximize']
        ],
        # 插件
        'extraPlugins': ','.join(['codesnippet', 'uploadimage', 'widget', 'lineutils', ])
    },

    'bbs_ckeditor': {
        # 使用简体中文
        'language': 'zh-cn',
        # 编辑器的宽高请根据你的页面自行设置
        'width': 'auto',
        'height': '450px',
        'image_previewText': ' ',
        'tabSpaces': 4,
        'toolbar': 'Custom',
        # 添加按钮在这里
        'toolbar_Custom': [
            ['Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', 'Font', 'FontSize', 'Format'
                , 'RemoveFormat', 'Form', 'Table', 'Styles'],
            ['NumberedList', 'BulletedList'],
            ['Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord'],
            ['SpellChecker', 'Scayt', 'Undo', 'Redo', 'Find', 'Replace'],
            ['Outdent ', 'Indent ', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock', 'BidiLtr', 'BidiRtl'],
            ["TextColor", "BGColor"],
            ['Blockquote', 'CodeSnippet'],
            ['Image', 'Link', 'Unlink'],
            ["Smiley", "SpecialChar", 'HorizontalRule'],
            ['Maximize'],

        ],
        # 插件
        'extraPlugins': ','.join(['codesnippet', 'uploadimage', 'widget', 'lineutils', ])
    },

    'comment_ckeditor': {
        'toolbar': 'custom',
        'toolbar_custom': [
            ['Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript'],
            ["TextColor", "BGColor", 'RemoveFormat'],
            ['NumberedList', 'BulletedList'],
            ['Link', 'Unlink'],
            ["Smiley", "SpecialChar", 'Blockquote'],
        ],
        'width': 'auto',
        'height': '180',
        'tabSpaces': 4,
        'removePlugins': 'elementspath',
        'resize_enabled': False,
    },
}

# 统一分页设置
BASE_PAGE_BY = 10
BASE_ORPHANS = 5
ARTICLE_NUM = 10
COMMENT_NUM = 10
# HAYSTACK_SIGNAL_PROCESSOR = 'haystack.signals.RealtimeSignalProcessor'

API_FLAG = True

SITE_END_TITLE = "阅读器"

SITE_DESCRIPTION = "JC橙子网"

