from ouser.models import BBS_User
from app01.models import Bbs, Tag, Category
from .serializers import (UserSerializer, ArticleSerializer, TagSerializer, CategorySerializer)
from rest_framework import viewsets, permissions
from rest_framework.permissions import DjangoModelPermissionsOrAnonReadOnly


# RESEful API VIEWS
class UserListSet(viewsets.ModelViewSet):
    queryset = BBS_User.objects.all()
    serializer_class = UserSerializer
    permission_classes = (DjangoModelPermissionsOrAnonReadOnly,)


class ArticleListSet(viewsets.ModelViewSet):
    queryset = Bbs.objects.all()
    serializer_class = ArticleSerializer
    permission_classes = (DjangoModelPermissionsOrAnonReadOnly,)

    def perform_create(self,serializer):
        serializer.save(author=self.request.user)


class TagListSet(viewsets.ModelViewSet):
    queryset = Tag.objects.all()
    serializer_class = TagSerializer
    permission_classes = (DjangoModelPermissionsOrAnonReadOnly,)


class CategoryListSet(viewsets.ModelViewSet):
    queryset = Category.objects.all()
    serializer_class = CategorySerializer
    permission_classes = (DjangoModelPermissionsOrAnonReadOnly,)

'''
class TimelineListSet(viewsets.ModelViewSet):
    queryset = Timeline.objects.all()
    serializer_class = TimelineSerializer
    permission_classes = (DjangoModelPermissionsOrAnonReadOnly,)


class ToolLinkListSet(viewsets.ModelViewSet):
    queryset = ToolLink.objects.all()
    serializer_class = ToolLinkSerializer
    permission_classes = (DjangoModelPermissionsOrAnonReadOnly,)
'''