# -*- coding: utf-8 -*-
from django.contrib import admin

from tabu import models


class LanguageAdmin(admin.ModelAdmin):
    list_display = ('lang', 'user')
    list_filter = ('user', 'lang')
    raw_id_fields = ('user',)


class CardAdmin(admin.ModelAdmin):
    list_display = ('user', 'lang', 'mainword', 'word1', 'word2', 'word3',
                    'word4', 'word5')
    list_filter = ('user', 'lang', 'mainword', 'word1', 'word2', 'word3',
                    'word4', 'word5')
    raw_id_fields = ('user',)


admin.site.register(models.Language, LanguageAdmin)
admin.site.register(models.Card, CardAdmin)