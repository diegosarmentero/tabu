# -*- coding: utf-8 -*-
from django.db import models
from django.contrib.auth.models import User


class Language(models.Model):
    lang = models.CharField(max_length=200, unique=True)
    user = models.ForeignKey(User, blank=True, null=True,
                             on_delete=models.SET_NULL)


class Card(models.Model):
    user = models.ForeignKey(User, blank=True, null=True,
                             on_delete=models.SET_NULL)
    lang = models.CharField(max_length=200)
    mainword = models.CharField(max_length=300)
    word1 = models.CharField(max_length=300)
    word2 = models.CharField(max_length=300)
    word3 = models.CharField(max_length=300)
    word4 = models.CharField(max_length=300)
    word5 = models.CharField(max_length=300)

    class Meta:
        unique_together = ('lang', 'mainword',)


def add_language(lang, user):
    result = {}
    try:
        lang = lang.title()
        langobj, created = Language.objects.get_or_create(lang=lang, user=user)
        if created:
            langobj.save()
            result["language"] = lang
        else:
            result["error"] = "Language %s already exists" % lang
    except:
        result["error"] = "Language couldn't be added."
    return result


def get_languages():
    return Language.objects.values_list('lang', flat=True).order_by('lang')


def get_cards(lang):
    cards = Card.objects.filter(lang=lang).values_list(
        'mainword', "word1", "word2", "word3", "word4", "word5")
    return cards


def add_card(lang, mainword, word1, word2, word3, word4, word5, user):
    result = {}
    try:
        lang = lang.title()
        mainword = mainword.title()
        word1 = word1.title()
        word2 = word2.title()
        word3 = word3.title()
        word4 = word4.title()
        word5 = word5.title()
        cardobj, created = Card.objects.get_or_create(lang=lang, user=user,
            mainword=mainword, word1=word1, word2=word2, word3=word3,
            word4=word4, word5=word5)
        if created:
            cardobj.save()
            result["card"] = mainword
        else:
            result["error"] = "Card %s already exists" % mainword
    except:
        result["error"] = "Card couldn't be added."
    return result