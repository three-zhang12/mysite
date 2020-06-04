from django.contrib import admin
from ouser import models
# Register your models here.


@admin.register(models.BBS_User)
class BBS_UserAdmin(admin.ModelAdmin):
    list_display = ['id', 'username', 'signature']