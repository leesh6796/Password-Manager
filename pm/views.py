from django.shortcuts import render
from django import forms
from django.contrib.auth.models import User
from django.http import HttpResponseRedirect
from pm.process import site

# Create your views here.
def index(request):
    if request.session.get("isLogin"):
        sites = site.getSites(request.session["masterid"])

        return render(request, 'pm/index.html', {"sites":sites})
    else:
        return HttpResponseRedirect("/pm/login")

