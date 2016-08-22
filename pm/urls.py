from django.conf.urls import url

from pm.process import auth, site
from . import views

urlpatterns = [
    # view
    url(r'^$', views.index, name='index'),

    url(r'^login/$', auth.LoginProcess.as_view(), name='login'),
    url(r'^register/$', auth.RegisterProcess.as_view(), name='register'),
    url(r'^logout/$', auth.LogoutProcess.as_view(), name='logout'),
    url(r'^changepw/$', auth.ChangePasswordProcess.as_view(), name='changepw'),

    url(r'^view/(?P<site_id>\d+)/$', site.ViewProcess.as_view(), name='view'),
    url(r'^write/$', site.WriteProcess.as_view(), name='write'),
    url(r'^edit/(?P<site_id>\d+)/$', site.EditProcess.as_view(), name='edit'),
    url(r'^remove/(?P<site_id>\d+)/$', site.RemoveProcess.as_view(), name='remove'),

    url(r'^import/$', site.ImportProcess.as_view(), name='import'),
]