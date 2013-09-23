# -*- coding: utf-8 -*-
import random
from utils import render_response
from django.http import HttpResponse
from django.utils import simplejson
from django.contrib.auth.decorators import login_required
from django.views.decorators.http import require_POST

from tabu import models


def home(request):
    """Home Page."""
    return render_response(request, 'index.html')


@login_required
def cards(request):
    """Cards Page."""
    langs = models.get_languages()
    data = {"langs": langs}
    return render_response(request, 'cards.html', data)


def how_to_play(request):
    """Setup page."""
    return render_response(request, 'how_to_play.html')


def game(request):
    """Game Page."""
    if request.method == 'POST':
        try:
            lang = request.POST['selCombo']
            team1 = request.POST['first_team']
            team2 = request.POST['second_team']
            players = int(request.POST['players'])
            rounds = int(request.POST['rounds'])
            if not team1 or not team2 or players < 2 or rounds < 1:
                raise Exception()

            cards = list(models.get_cards(lang))
            random.shuffle(cards)
            data = {"team1": team1, "team2": team2, "players": players,
                "rounds": rounds, "cards": cards}
            return render_response(request, 'tabu/game_page.html', data)
        except:
            langs = models.get_languages()
            data = {"langs": langs, 'error': "Missing or Invalid data."}
            return render_response(request, 'tabu/setup_page.html', data)
    else:
        langs = models.get_languages()
        data = {"langs": langs}
        return render_response(request, 'tabu/setup_page.html', data)


def contact(request):
    """Game Page."""
    return render_response(request, 'contacts.html')


@require_POST
def rpc(request):
    newlang = request.POST['newlanguage']
    result = {}
    if newlang:
        result = models.add_language(newlang, request.user)
    else:
        lang = request.POST['selCombo']
        mainword = request.POST['mainword']
        word1 = request.POST['word1']
        word2 = request.POST['word2']
        word3 = request.POST['word3']
        word4 = request.POST['word4']
        word5 = request.POST['word5']
        result = models.add_card(lang, mainword, word1, word2, word3, word4,
            word5, request.user)
    data = simplejson.dumps(result)

    return HttpResponse(data, mimetype='application/json')


def get_cards(request):
    cards = list(models.get_cards(request.GET['language']))
    random.shuffle(cards)
    data = simplejson.dumps(cards)

    return HttpResponse(data, mimetype='application/json')


def get_languages(request):
    langs = list(models.get_languages())
    data = simplejson.dumps(langs)

    return HttpResponse(data, mimetype='application/json')