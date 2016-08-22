# -*- coding:utf-8 -*-

from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect
from django.views.generic import View
from django.contrib.auth import authenticate, logout
from django.contrib.auth.models import User
from django import forms
from pm.process import site, encrypt
import hashlib


# Process Form
class RegisterForm(forms.Form):
    username = forms.CharField(label="Master ID", max_length=30)
    password = forms.CharField(label="Master Password", max_length=200, widget=forms.PasswordInput)


# Process View
class LoginProcess(View):
    def post(self, request, *args, **kwargs):
        id = request.POST["idbox"]
        pw = request.POST["pwbox"]

        redirect_url = "/pm/login"

        user = authenticate(username=id, password=pw)
        if user is not None:
            redirect_url = "/pm"
            request.session["isLogin"] = True
            request.session["masterid"] = id

            m = hashlib.sha256()
            m.update(pw)
            request.session["hash"] = m.hexdigest()

        return HttpResponseRedirect(redirect_url)

    def get(self, request):
        return render(request, "pm/login.html")


class RegisterProcess(View):
    def post(self, request, *args, **kwagrs):
        form = RegisterForm(request.POST)
        if form.is_valid():
            id = form.cleaned_data["username"]
            pw = form.cleaned_data["password"]

            user = User.objects.create_user(username=id, password=pw)
            user.save()

            return HttpResponseRedirect("/pm/login")

    def get(self, request, *args, **kwagrs):
        form = RegisterForm()
        return render(request, "pm/register.html", {"form":form})


class LogoutProcess(View):
    def get(self, request):
        logout(request) # session도 clear 한다.
        return HttpResponseRedirect("/pm")


class ChangePasswordProcess(View):
    def get(self, request):
        return render(request, "pm/changepw.html", {"error":False})

    def update_sites(self, request, newpw): # 비밀번호를 변경하면 새 비밀번호 해시값으로 데이터를 다시 암호화한다.
        old_hash = request.session["hash"]
        new_hash = ""

        m = hashlib.sha256()
        m.update(newpw)
        new_hash = m.hexdigest()

        sites = site.getSites(request.session["masterid"])
        for s in sites:
            sitename = s.sitename
            username = encrypt.Decrypt(old_hash, s.username)
            password = encrypt.Decrypt(old_hash, s.password)
            comment = encrypt.Decrypt(old_hash, s.comment)

            site.editSite(new_hash, s.id, sitename, username, password, comment)

    def post(self, request):
        oldpw = request.POST["pwbox"]
        newpw = request.POST["npwbox"]
        newpwc = request.POST["npwcbox"]

        user = authenticate(username=request.session["masterid"], password=oldpw)
        if user is None: # old password가 올바르지 않으면
            return render(request, "pm/changepw.html", {"error": True})

        if newpw != newpwc: # 비밀번호 확인 일치하지 않으면
            return render(request, "pm/changepw.html", {"error": True})

        self.update_sites(request, newpw)

        user = User.objects.get(username=request.session["masterid"])
        user.set_password(newpw)
        user.save()

        return HttpResponseRedirect("/pm/logout")