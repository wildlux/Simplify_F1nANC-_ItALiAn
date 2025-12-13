#!/usr/bin/env python3
"""WSGI application for Gunicorn - Punto di ingresso principale"""

import sys
import os

# Aggiungi la directory backend al path
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

# Importa l'applicazione WSGI principale
from wsgi_main import application

if __name__ == "__main__":
    print("WSGI application ready - Usa Gunicorn per avviare")