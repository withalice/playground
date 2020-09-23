from django.conf.urls import url, include

from . import v1

urlpatterns = [
    url(r'', include(v1.urls), name="api-v1"),
]
