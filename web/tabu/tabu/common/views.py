# -*- coding: utf-8 -*-
from utils import render_response


def home(request):
    """Home Page."""
    return render_response(request, 'index.html')


def setup_page(request):
    """Setup page."""
    return render_response(request, 'tabu/setup_page.html')


def game(request):
    """Game Page."""
    return render_response(request, 'tabu/game_page.html')
