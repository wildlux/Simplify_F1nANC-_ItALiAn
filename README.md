# 🚀 Assistente AI Finanziario con Gunicorn

## 🎯 Introduzione

**Assistente AI Finanziario** è un sistema intelligente per consulenza finanziaria che utilizza Ollama come motore AI e Gunicorn come server WSGI per prestazioni ottimali.

## 📋 Caratteristiche Principali

✅ **Backend con Gunicorn** - 4 workers × 2 threads = 8 richieste simultanee
✅ **Frontend Reactivo** - Interfaccia utente moderna e responsiva
✅ **Sicurezza Avanzata** - API keys, CORS, header di sicurezza
✅ **Grafici 3D** - Visualizzazione dati con Matplotlib e Seaborn
✅ **Esecuzione Codice** - Supporto per Python, JavaScript, C++
✅ **Notizie in Tempo Reale** - Aggregazione da fonti italiane
✅ **Cache Intelligente** - Riduce i tempi di risposta
✅ **Monitoraggio Completo** - Logs dettagliati e stato sistema

## 🔧 Requisiti

- Python 3.8+
- Gunicorn 20.0+
- Ollama (locale o remoto)
- Node.js (per esecuzione JavaScript)
- g++ (per esecuzione C++)

## 📦 Installazione

### 1. Clonare il repository

```bash
git clone https://github.com/tuo-username/assistente-ai-finanziario.git
cd assistente-ai-finanziario
```

### 2. Installare dipendenze

```bash
cd backend
pip install -r requirements.txt --break-system-packages
```

### 3. Configurare API Keys

Crea un file `.env` nella root del progetto:

```env
# Configurazione Ollama
OLLAMA_URL=http://localhost:11434/api/generate
OLLAMA_MODEL=llama3.2:3b

# API Keys
API_KEY_DEMO=demo_key_123
API_KEY_ADMIN=admin_key_456
API_KEY_TEST=test_key_789

# Cache
CACHE_MAX_SIZE=100
CACHE_TTL_SECONDS=3600
```

## 🚀 Avvio Rapido

### Avvio completo (backend + frontend)

```bash
./launcher.sh
```

### Avvio solo backend

```bash
cd backend
./start_gunicorn.sh
```

### Avvio solo frontend

```bash
cd frontend
python3 -m http.server 8080 --bind 0.0.0.0
```

## 🛑 Gestione Sistema

### Fermare il sistema

```bash
./stop.sh
```

### Verificare stato

```bash
./status.sh
```

### Visualizzare logs

```bash
# Logs backend
tail -f logs/gunicorn.log

# Logs frontend
tail -f logs/frontend.log

# Logs errori
tail -f logs/gunicorn_error.log
```

## 🎨 Interfaccia Utente

Accedi all'interfaccia all'indirizzo:
```
http://localhost:8080
```

## 🔐 API Keys

Le API keys sono configurate nel file `.env`:

- `demo_key_123` - Utente demo (permessi limitati)
- `admin_key_456` - Amministratore (tutti i permessi)
- `test_key_789` - Testing

## 📚 Endpoint API

### Salute del sistema
```bash
curl http://localhost:54324/api/health -H "X-API-Key: demo_key_123"
```

### Chat con AI
```bash
curl -X POST http://localhost:54324/api/chat \
  -H "Content-Type: application/json" \
  -H "X-API-Key: demo_key_123" \
  -d '{"text": "Ciao, come stai?", "mode": "general"}'
```

### Grafici 3D
```bash
curl -X POST http://localhost:54324/api/chart3d \
  -H "Content-Type: application/json" \
  -H "X-API-Key: demo_key_123" \
  -d '{"type": "surface", "params": {"func_str": "x**2 + y**2"}}'
```

### Esecuzione codice
```bash
curl -X POST http://localhost:54324/api/code/execute \
  -H "Content-Type: application/json" \
  -H "X-API-Key: demo_key_123" \
  -d '{"code": "print(\"Hello World\")", "language": "python"}'
```

### Notizie
```bash
curl http://localhost:54324/api/news/economia -H "X-API-Key: demo_key_123"
```

## 📁 Struttura del Progetto

```
assistente-ai-finanziario/
├── backend/                  # Backend con Gunicorn
│   ├── server_utils.py       # Funzioni utilitarie
│   ├── wsgi.py               # Punto di ingresso WSGI
│   ├── wsgi_main.py          # Applicazione WSGI
│   ├── start_gunicorn.sh     # Script di avvio
│   └── requirements.txt      # Dipendenze
│
├── frontend/                # Frontend statico
│   ├── index.html            # Interfaccia utente
│   ├── style.css             # Stili CSS
│   └── app.js               # Logica frontend
│
├── static/                  # Risorse statiche
│   ├── css/                  # Stili aggiuntivi
│   ├── js/                   # Script aggiuntivi
│   ├── images/               # Immagini
│   └── README.md             # Documentazione
│
├── ICONA/                   # Risorse grafiche
│   └── ICONA.png            # Icona applicazione
│
├── docs/                    # Documentazione
│   ├── GUIDA_RAPIDA.md       # Guida rapida
│   └── PULIZIA_COMPLETATA.md # Dettagli pulizia
│
├── logs/                    # File di log
│   ├── gunicorn.log         # Log principale
│   ├── gunicorn_access.log  # Log accessi
│   └── gunicorn_error.log   # Log errori
│
├── launcher.sh              # Avvio completo
├── stop.sh                  # Arresto sistema
├── status.sh                # Monitoraggio
├── README.md                # Documentazione principale
└── .env                     # Configurazione
```

## 🔧 Configurazione Gunicorn

La configurazione è definita in `backend/start_gunicorn.sh`:

- **Workers**: 4
- **Threads**: 2 per worker
- **Timeout**: 120 secondi
- **Porta**: 54324
- **Log level**: info

## 📊 Prestazioni

- **Concorrenza**: 8 richieste simultanee
- **Timeout**: 120 secondi per richieste lunghe
- **Stabilità**: Gunicorn gestisce automaticamente i crash
- **Memoria**: ~150MB idle, ~300MB sotto carico
- **Avvio**: ~3-5 secondi

## 🎯 Modalità Operative

### 1. Modalità Finance
Analisi finanziaria con regolamenti italiani:
```json
{"text": "Quali sono le agevolazioni fiscali per le startup?", "mode": "finance"}
```

### 2. Modalità Math
Calcoli matematici precisi:
```json
{"text": "Calcola l'integrale di x^2", "mode": "math"}
```

### 3. Modalità Develop
Assistenza nello sviluppo software:
```json
{"text": "Come creare una API REST in Python?", "mode": "develop"}
```

### 4. Modalità General
Risposte generiche:
```json
{"text": "Cosa è l'intelligenza artificiale?", "mode": "general"}
```

## 🛠️ Sviluppo

### Aggiungere nuove funzionalità

1. Aggiungi la funzione in `backend/server_utils.py`
2. Crea un nuovo endpoint in `backend/wsgi_main.py`
3. Aggiungi la route nel metodo `application()`
4. Test con curl o Postman

### Eseguire test

```bash
# Test backend
curl -X POST http://localhost:54324/api/chat \
  -H "Content-Type: application/json" \
  -H "X-API-Key: demo_key_123" \
  -d '{"text": "Test", "mode": "general"}'

# Test frontend
curl http://localhost:8080
```

## 🐛 Risoluzione Problemi

### Gunicorn non si avvia

1. Verifica installazione:
   ```bash
   python3 -c "import gunicorn; print('OK')"
   ```

2. Controlla logs:
   ```bash
   tail -f logs/gunicorn_error.log
   ```

3. Avvio manuale:
   ```bash
   cd backend
   gunicorn --bind 0.0.0.0:54324 --workers 4 wsgi:application
   ```

### Porta già in uso

```bash
sudo fuser -k 54324/tcp
sudo fuser -k 8080/tcp
```

### Errore API key

Verifica che:
1. L'header `X-API-Key` sia presente
2. La chiave sia valida (demo_key_123, admin_key_456, test_key_789)
3. Il file `.env` sia caricato correttamente

## 🔄 Aggiornamenti

```bash
# Ferma il sistema
./stop.sh

# Aggiorna il codice
git pull origin main

# Riavvia
./launcher.sh
```

## 📦 Gestione Risorse Statiche

La cartella `static/` è dedicata ai file statici (immagini, CSS, JS, font, ecc.).

### Aggiungere risorse statiche:

```bash
# Aggiungere un'immagine
cp /path/to/image.png static/images/

# Aggiungere un file CSS
cp /path/to/style.css static/css/

# Aggiungere un file JS
cp /path/to/script.js static/js/
```

### Accedere alle risorse:

```html
<!-- Nel frontend -->
<img src="/static/images/logo.png" alt="Logo">
<link rel="stylesheet" href="/static/css/custom.css">
<script src="/static/js/custom.js"></script>
```

Per maggiori dettagli, vedi `static/README.md`.

## 📈 Monitoraggio

### Comandi utili

```bash
# Memoria utilizzata
top -p $(cat backend.pid)

# CPU utilizzata
htop

# Spazio disco
df -h

# Processi attivi
ps aux | grep gunicorn
```

### Alert automatici

Configura un sistema di monitoraggio come:
- Prometheus + Grafana
- Zabbix
- Nagios

## 🔒 Sicurezza

### Best Practices

1. **API Keys**: Cambia le chiavi di default in produzione
2. **HTTPS**: Usa un reverse proxy (Nginx) con certificato SSL
3. **Firewall**: Limita l'accesso alle porte 54324 e 8080
4. **Backup**: Esegui backup regolari del database e della configurazione
5. **Aggiornamenti**: Mantieni aggiornate tutte le dipendenze

### Configurazione Nginx (esempio)

```nginx
server {
    listen 443 ssl;
    server_name ai.tuodominio.com;

    ssl_certificate /path/to/cert.pem;
    ssl_certificate_key /path/to/key.pem;

    location / {
        proxy_pass http://localhost:8080;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }

    location /api/ {
        proxy_pass http://localhost:54324;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-API-Key $http_x_api_key;
    }
}
```

## 🎓 Riferimenti

- [Documentazione Gunicorn](https://docs.gunicorn.org/)
- [Documentazione Ollama](https://ollama.ai/)
- [WSGI Specification](https://wsgi.readthedocs.io/)
- [Python HTTP Server](https://docs.python.org/3/library/http.server.html)

## 📋 Changelog

### v1.0.0 (Dicembre 2024)
- Migrazione a Gunicorn
- Aggiunto supporto multi-lingua per codice
- Migliorata gestione errori
- Aggiunta cache intelligente
- Documentazione unificata

### v0.9.0 (Novembre 2024)
- Versione iniziale con server HTTP semplice
- Supporto base per Ollama
- Interfaccia utente di base

## 📝 Licenza

MIT License - Copyright (c) 2024 Assistente AI Team

## 💡 Suggerimenti

1. **Per prestazioni migliori**: Aumenta il numero di workers in base al tuo hardware
2. **Per sviluppo**: Usa `--reload` con Gunicorn per ricarica automatica
3. **Per produzione**: Usa un reverse proxy (Nginx) e HTTPS
4. **Per debugging**: Usa `--log-level debug` con Gunicorn
5. **Per testing**: Crea API keys temporanee con scadenza

---

🎯 **Pronto per l'uso!** 🎯

*Ultimo aggiornamento: 13 Dicembre 2024*
*Versione: 1.0.0*
*Autore: Assistente AI Team*

---

## 📞 Supporto

Per problemi o domande:
- Email: support@assistente-ai.it
- GitHub Issues: https://github.com/tuo-username/assistente-ai-finanziario/issues
- Documentazione: https://github.com/tuo-username/assistente-ai-finanziario/wiki

---

*"L'intelligenza artificiale è lo strumento, la tua intelligenza è la guida."* 🧠💡