from django.apps import AppConfig


class App01Config(AppConfig):
    name = 'app01'

    def ready(self):
        super(App01Config, self).ready()
        from . import signals
