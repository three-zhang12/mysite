from django.db.models.signals import post_save
from django.dispatch import receiver
from notifications.signals import notify
from .models import LoveRecord


@receiver(post_save, sender=LoveRecord)
def send_notification(sender, instance, **kwargs):
    bbs = instance.content_object
    verb = '{0} 点赞了你的帖子《{1}》'.format(instance.user.username, bbs.title)
    recipient = instance.content_object.get_user()
    url = bbs.get_absolute_url()
    notify.send(instance.user, recipient=recipient, verb=verb, action_object=instance, description=url)
