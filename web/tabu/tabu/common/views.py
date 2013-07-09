# -*- coding: utf-8 -*-
from utils import render_response


def home(request):
    """Home Page."""
    return render_response(request, 'index.html')