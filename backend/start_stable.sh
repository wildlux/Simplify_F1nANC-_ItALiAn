#!/bin/bash

echo "🚀 Avvio Backend Stabile con Gunicorn"
echo "========================================"
echo ""

# Directory del progetto
BASE_DIR="$HOME/Desktop/Assistente_Finanziario_AI/assistente-ai-completo"
cd "$BASE_DIR/backend"

# Crea directory logs se non esiste
mkdir -p ../logs

# Ferma eventuali processi esistenti
echo "🛑 Pulizia processi esistenti..."
pkill gunicorn 2>/dev/null

# Pulisci porta
fuser -k 54324/tcp 2>/dev/null

sleep 2

echo "✅ Pulizia completata"
echo ""

# Verifica modello Ollama
echo "🧪 Verifica modello AI..."
if ollama list | grep -q "llama3.2:1b"; then
    echo "✅ Modello llama3.2:1b disponibile"
else
    echo "❌ Modello llama3.2:1b non trovato. Scaricalo con: ollama pull llama3.2:1b"
    exit 1
fi

echo ""

# Configurazione ottimizzata per stabilità
echo "🎯 Avvio Gunicorn con configurazione stabile..."
nohup gunicorn \
    --bind 0.0.0.0:54324 \
    --workers 1 \
    --threads 2 \
    --timeout 300 \
    --max-requests 1000 \
    --max-requests-jitter 100 \
    --graceful-timeout 30 \
    --log-level info \
    --access-logfile ../logs/gunicorn_access.log \
    --error-logfile ../logs/gunicorn_error.log \
    wsgi:application > ../logs/gunicorn.log 2>&1 &

echo "📋 Configurazione:"
echo "  • Workers: 1 (per ridurre memoria)"
echo "  • Threads: 2 per worker"
echo "  • Timeout: 120 secondi"
echo "  • Max richieste: 1000 per worker"
echo "  • Graceful timeout: 30 secondi"
echo ""

BACKEND_PID=$!
echo $BACKEND_PID > ../backend.pid
echo "📋 Backend PID: $BACKEND_PID"

# Aspetta che il backend sia pronto
echo "🕒 Attesa avvio backend..."
sleep 5

# Test backend
echo "🧪 Test backend..."
if curl -s http://localhost:54324/api/health -H "X-API-Key: demo_key_123" > /dev/null; then
    echo "✅ Backend OK - Stabile e pronto"
else
    echo "❌ Backend NON risponde"
    exit 1
fi

echo ""
echo "🎉 Backend avviato con successo!"
echo "📊 Backend: http://localhost:54324"
echo "📋 Logs: tail -f logs/gunicorn.log"

exit 0