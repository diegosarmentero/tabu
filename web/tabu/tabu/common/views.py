# -*- coding: utf-8 -*-
from utils import render_response


def home(request):
    """Home Page."""
    return render_response(request, 'index.html')


def game_example(request):
    """Game Example Page."""
    return render_response(request, 'game_example.html')