#!/bin/bash

echo "📊 Stato Sistema Assistente AI"
echo "========================================"
echo ""

BASE_DIR="$HOME/Desktop/Assistente_Finanziario_AI/assistente-ai-completo"

# Controlla backend
echo "🔍 Backend (porta 54324):"
if curl -s http://localhost:54324/api/health -H "X-API-Key: demo_key_123" > /dev/null; then
    echo "  ✅ Backend: ONLINE"
    
    # Mostra info dal backend
    HEALTH_INFO=$(curl -s http://localhost:54324/api/health -H "X-API-Key: demo_key_123")
    MODEL=$(echo $HEALTH_INFO | grep -o '"model":"[^"]*"' | cut -d'"' -f4)
    echo "  📋 Modello: $MODEL"
else
    echo "  ❌ Backend: OFFLINE"
fi

# Controlla frontend
echo ""
echo "🌐 Frontend (porta 8080):"
if curl -s http://localhost:8080 > /dev/null; then
    echo "  ✅ Frontend: ONLINE"
else
    echo "  ❌ Frontend: OFFLINE"
fi

echo ""
echo "📋 Processi attivi:"
BACKEND_PROCESS=$(pgrep gunicorn | head -1)
if [ -n "$BACKEND_PROCESS" ]; then
    echo "  ✅ Backend (Gunicorn): PID $BACKEND_PROCESS"
else
    echo "  ❌ Backend (Gunicorn): Non in esecuzione"
fi

FRONTEND_PROCESS=$(pgrep -f "http.server 8080")
if [ -n "$FRONTEND_PROCESS" ]; then
    echo "  ✅ Frontend (HTTP Server): PID $FRONTEND_PROCESS"
else
    echo "  ❌ Frontend (HTTP Server): Non in esecuzione"
fi

echo ""
echo "📈 Statistiche sistema:"
echo "  • Memoria totale: $(free -h | awk '/Mem:/ {print $2}')"
echo "  • Memoria usata:  $(free -h | awk '/Mem:/ {print $3}')"
echo "  • CPU:           $(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/")% idle"

echo ""
echo "📁 File di log recenti:"
if [ -f "$BASE_DIR/logs/gunicorn.log" ]; then
    echo "  • Backend: $(ls -lh $BASE_DIR/logs/gunicorn.log | awk '{print $5, $6, $7}')"
fi
if [ -f "$BASE_DIR/logs/frontend.log" ]; then
    echo "  • Frontend: $(ls -lh $BASE_DIR/logs/frontend.log | awk '{print $5, $6, $7}')"
fi

echo ""
echo "🎯 Comandi rapidi:"
echo "  • Riavvia:        ./launcher.sh"
echo "  • Ferma:          ./stop.sh"
echo "  • Logs backend:   tail -f $BASE_DIR/logs/gunicorn.log"
echo "  • Logs frontend:  tail -f $BASE_DIR/logs/frontend.log"

exit 0