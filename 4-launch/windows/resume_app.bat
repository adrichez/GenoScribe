#!/usr/bin/env bash
set -e

PORT=3838
CONTAINER_NAME="genoscribe_container"

# Comprobar si el puerto está en uso
if lsof -i :$PORT >/dev/null 2>&1; then
  echo "⚠️ Advertencia: El puerto $PORT está en uso."
  
  CONTAINER_ID=$(docker ps -q --filter "publish=$PORT")
  if [ -n "$CONTAINER_ID" ]; then
    echo "  - Deteniendo contenedor que usa el puerto..."
    docker stop "$CONTAINER_ID"
    sleep 2
  else
    echo "  - Cerrando proceso que usa el puerto..."
    lsof -i :$PORT | awk '{print $2}' | xargs kill -9 2>/dev/null
    sleep 2
  fi
  echo "✅ Puerto $PORT liberado."
fi

echo "
🚀 [Run App] Iniciando GenoScribe...
------------------------------------
🌐 La app estará disponible en: http://localhost:$PORT/app
"

# Arrancar contenedor existente
docker start -ai "$CONTAINER_NAME" &

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
