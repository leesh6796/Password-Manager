from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect
from django.views.generic import View
from django.contrib.auth.models import User
from pm import models
from pm.process import encrypt


def getSites(masterid):
    sites = models.Site.objects.filter(masterid = masterid)
    return sites


def getSite(key, siteid):
    site = models.Site.objects.get(id=siteid)
    sitename = site.sitename
    username = encrypt.Decrypt(key, site.username)
    password = encrypt.Decrypt(key, site.password)
    comment = encrypt.Decrypt(key, site.comment)
    info = {"sitename": site.sitename, "username": username, "password": password, "comment": comment}

    return info


def addSite(key, masterid, sitename, username, password, comment):
    username = encrypt.Encrypt(key, username)
    password = encrypt.Encrypt(key, password)
    comment = encrypt.Encrypt(key, comment)

    models.Site.objects.create(masterid=masterid, sitename=sitename, username=username, password=password, comment=comment)


def editSite(key, siteid, new_sitename, new_username, new_password, new_comment):
    site = models.Site.objects.get(id=siteid)

    site.sitename = new_sitename
    site.username = encrypt.Encrypt(key, new_username)
    site.password = encrypt.Encrypt(key, new_password)
    site.comment = encrypt.Encrypt(key, new_comment)
    site.save()


class ViewProcess(View):
    def get(self, request, site_id):
        key = request.session["hash"]
        info = getSite(key, site_id)

        return render(request, "pm/view.html", {"siteid":site_id, "info":info})


class WriteProcess(View):
    def get(self, request, *args, **kwargs):
        return render(request, "pm/write.html", {"edit":False})

    def post(self, request, *args, **kwargs):
        masterid = request.session["masterid"]
        sitename = request.POST["namebox"]
        username = request.POST["idbox"]
        password = request.POST["pwbox"]
        comment = request.POST["comment"]

        addSite(request.session["hash"], masterid, sitename, username, password, comment)

        return HttpResponseRedirect("/pm")


class EditProcess(View):
    def get(self, request, site_id):
        key = request.session["hash"]
        info = getSite(key, site_id)

        return render(request, "pm/write.html", {"siteid":site_id, "edit":True, "info":info})

    def post(self, request, site_id):
        siteid = site_id
        sitename = request.POST["namebox"]
        username = request.POST["idbox"]
        password = request.POST["pwbox"]
        comment = request.POST["comment"]

        editSite(request.session["hash"], siteid, sitename, username, password, comment)
        return HttpResponseRedirect("/pm")


class RemoveProcess(View):
    def get(self, request, site_id):
        models.Site.objects.get(id=site_id).delete()
        return HttpResponseRedirect("/pm")


class ImportProcess(View):
    def get(self, request):
        return render(request, "pm/import.html")

    def post(self, request):
        data = request.POST["data"]

        lines = data.split("\r\n")
        for line in lines:
            piece = line.split("$")
            sitename = piece[0]
            username = piece[1]
            password = piece[2]
            comment = piece[3]

            addSite(request.session["hash"], request.session["masterid"], sitename, username, password, comment)

        return HttpResponseRedirect("/pm")