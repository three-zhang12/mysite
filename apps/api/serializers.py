from ouser.models import BBS_User
from rest_framework import serializers
from app01.models import Bbs, Tag, Category


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = BBS_User
        fields = ('id', 'username', 'avatar')


class TagSerializer(serializers.ModelSerializer):
    class Meta:
        model = Tag
        fields = '__all__'


class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = '__all__'


class ArticleSerializer(serializers.ModelSerializer):
    author = serializers.ReadOnlyField(source='author.username')
    category = CategorySerializer(read_only=True)
    tags = TagSerializer(
        many=True,
        read_only=True,
    )
    keywords = serializers.SlugRelatedField(
        many=True,
        read_only=True,
        slug_field='name'
    )

    class Meta:
        model = Bbs
        exclude = ('content',)
