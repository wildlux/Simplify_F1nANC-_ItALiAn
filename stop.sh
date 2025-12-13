#!/bin/bash

echo "🛑 Fermando il sistema Assistente AI..."

BASE_DIR="$HOME/Desktop/Assistente_Finanziario_AI/assistente-ai-completo"

# Leggi PID dai file
if [ -f "$BASE_DIR/backend.pid" ]; then
    BACKEND_PID=$(cat "$BASE_DIR/backend.pid")
    echo "📋 Fermando backend (PID: $BACKEND_PID)..."
    kill $BACKEND_PID 2>/dev/null
    sleep 2
fi

if [ -f "$BASE_DIR/frontend.pid" ]; then
    FRONTEND_PID=$(cat "$BASE_DIR/frontend.pid")
    echo "📋 Fermando frontend (PID: $FRONTEND_PID)..."
    kill $FRONTEND_PID 2>/dev/null
    sleep 2
fi

# Ferma tutti i processi correlati
echo "🧹 Pulizia processi residui..."
pkill -f "gunicorn.*54324" 2>/dev/null
pkill -f "http.server 8080" 2>/dev/null
pkill -f "python3.*backend" 2>/dev/null

# Pulisci porte
sudo fuser -k 54324/tcp 2>/dev/null
sudo fuser -k 8080/tcp 2>/dev/null

sleep 2

echo "✅ Sistema fermato correttamente"
echo ""
echo "📋 Per riavviare: ./launcher.sh"

exit 0