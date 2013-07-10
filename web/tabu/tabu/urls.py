from django.conf.urls import patterns, include, url  # lint:ok

from common import views

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
     url(r'^$', views.home, name='home'),
     url(r'^game/$', views.game_example, name='game_example'),
    # url(r'^tabu/', include('tabu.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    # url(r'^admin/', include(admin.site.urls)),
)
