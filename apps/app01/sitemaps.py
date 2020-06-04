from django.contrib.sitemaps import Sitemap
from .models import Category, Tag, Bbs
from django.db.models.aggregates import Count


class BbsSitemap(Sitemap):
    changefreq = 'weekly'
    priiority = 1.0

    def items(self):
        return Bbs.objects.all()

    def lastmod(self, obj):
        return obj.update_date


class CategorySitemap(Sitemap):
    changefreq = 'weekly'
    priority = 0.8

    def items(self):
        return Category.objects.annotate(total_num=Count('bbs')).filter(total_num__gt=0)

    def lastmod(self, obj):
        return obj.bbs_set.first().created_date
