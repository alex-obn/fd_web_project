from django import forms

from app.file_store.models.documents import UpFile


class UpFileForm(forms.ModelForm):

    class Meta:
        model = UpFile
        fields = ('file', )
