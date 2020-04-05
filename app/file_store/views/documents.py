from django.views.generic import View
from django.shortcuts import render, redirect

from app.file_store.forms.documents import UpFileForm


class UpFileView(View):
    template_name = 'input.html'
    form_class = UpFileForm

    def get(self, request, *args, **kwargs):
        form = self.form_class()
        return render(request, self.template_name, {'form': form})

    def post(self, request, *args, **kwargs):
        form = self.form_class(request.POST, request.FILES)
        # form = self.form_class()
        if form.is_valid():
            form.save()
        return render(request, self.template_name, {'form': form})
