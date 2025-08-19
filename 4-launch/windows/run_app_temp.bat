#!/usr/bin/env bash
set -e

if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Uso: $0 /ruta/datos_usuario /ruta/reportes_usuario"
  exit 1
fi

DATOS="$1"
REPORTS="$2"
PORT=3838

# Extraer el nombre de la última carpeta de DATOS
DATOS_BASENAME=$(basename "$DATOS")

# Comprobar si el puerto está en uso
if lsof -i :$PORT >/dev/null 2>&1; then
  echo "⚠️ Advertencia: El puerto $PORT está en uso."
  
  # Intenta encontrar un contenedor Docker usando el puerto 3838
  CONTAINER_ID=$(docker ps -q --filter "publish=$PORT")

  if [ -n "$CONTAINER_ID" ]; then
    echo "  - El proceso es un contenedor Docker con ID: $CONTAINER_ID."
    echo "  - Deteniendo el contenedor..."
    docker stop "$CONTAINER_ID"
    sleep 2
  else
    echo "  - El proceso es desconocido."
    echo "  - Cerrando el proceso..."
    lsof -i :$PORT | awk '{print $2}' | xargs kill -9 2>/dev/null
    sleep 2
  fi

  echo "✅ Puerto $PORT liberado."
fi

echo "
🚀 [Run App] Iniciando GenoScribe...
------------------------------------
📂 Datos de usuario: $DATOS
📂 Carpeta de reportes: $REPORTS
🌐 La app estará disponible en: http://localhost:$PORT/app
"

docker run --rm --name genoscribe_container -p $PORT:3838 \
  -v "$DATOS":/data/"$DATOS_BASENAME" \
  -v "$REPORTS":/srv/shiny-server/app/www/reports \
  genoscribe &

CONTAINER_PID=$!

# Esperar hasta que Shiny responda
until curl -s "http://localhost:$PORT/app" >/dev/null; do
    sleep 1
done

echo "

✅ [Run App] Servidor listo.
----------------------------
⏳ Abriendo navegador...
"

# Abrir navegador según sistema
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    xdg-open "http://localhost:$PORT/app"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    open "http://localhost:$PORT/app"
elif [[ "$OSTYPE" == "msys" ]]; then
    start "http://localhost:$PORT/app"
fi

wait $CONTAINER_PID
