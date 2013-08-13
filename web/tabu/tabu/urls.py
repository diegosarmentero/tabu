from django.conf.urls import patterns, include, url  # lint:ok

from common import views

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    # Login
    (r'^accounts/', include('allauth.urls')),

    # RPC
    url(r'^rpc/', views.rpc, name="rpc"),

    # Cards
    url(r'^cards/$', views.cards, name='cards'),
    url(r'^get_languages/$', views.get_languages, name='get_languages'),
    url(r'^get_cards/$', views.get_cards, name='get_cards'),

    # Game
     url(r'^setup/$', views.setup_page, name='setup_page'),
     url(r'^game/$', views.game, name='game'),

    # Uncomment the admin/doc line below to enable admin documentation:
    url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    url(r'^admin/', include(admin.site.urls)),

    url(r'^contact/$', views.contact, name='contact'),
    # Home
     url(r'^$', views.home, name='home'),
)
