from django.urls import path

from .views.documents import UpFileView


app_name = 'file_store'

urlpatterns = [
    path("upload/", UpFileView.as_view())
]
