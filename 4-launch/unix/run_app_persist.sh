#!/usr/bin/env bash
set -e

# Comprobar argumentos
if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Uso: $0 /ruta/datos_usuario /ruta/reportes_usuario"
  exit 1
fi

DATOS="$1"
REPORTS="$2"
PORT=3838
CONTAINER_NAME="genoscribe_container"
DATOS_BASENAME=$(basename "$DATOS")

# Asegurar permisos de escritura en la carpeta de reportes
if [ -d "$REPORTS" ]; then
    echo "
⚙️  Realizando ajustes iniciales...
----------------------------------------
🔧 Ajustando permisos de la carpeta de reportes..."
    chmod -R a+rw "$REPORTS"

    echo "✅ Permisos ajustados."
fi

# Comprobar si el puerto está en uso
if lsof -i :$PORT >/dev/null 2>&1; then
  echo "⚠️  Puerto $PORT en uso."
  
  CONTAINER_ID=$(docker ps -q --filter "publish=$PORT")
  if [ -n "$CONTAINER_ID" ]; then
    echo "🛑 Deteniendo contenedor que usa el puerto...
    "
    docker stop "$CONTAINER_ID"
    sleep 2
  else
    echo "🔒 Cerrando proceso que usa el puerto..."
    lsof -i :$PORT | awk 'NR>1 {print $2}' | xargs kill -9 2>/dev/null
    sleep 2
  fi
  echo "
✅ Puerto $PORT liberado."
fi

echo "

🚀 Iniciando GenoScribe...
--------------------------
📂 Datos de usuario: $DATOS
📂 Carpeta de reportes: $REPORTS
🌐 La app estará disponible en: http://localhost:$PORT/app"

# Arrancar contenedor existente o crear uno nuevo
if [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then
    echo "♻️  Reutilizando contenedor existente...
⏳ Entrando en el contenedor...
    "

    docker start "$CONTAINER_NAME"

else
    echo "🏗️  Creando contenedor...
⏳ Esperando a que el contenedor esté listo...
    "

    docker run -dit --name "$CONTAINER_NAME" -p $PORT:3838 \
      -v "$DATOS":/data/"$DATOS_BASENAME" \
      -v "$REPORTS":/srv/shiny-server/app/www/reports \
      genoscribe
fi

echo "

🚀️ Lanzando ajustes iniciales del entrypoint...
-----------------------------------------------
👍 Carpetas y permisos listos. 
⚙️  Arrancando Shiny Server...
🚀 Iniciando aplicación...
⏳ Esperando a que el servidor esté listo...
"

# Esperar hasta que Shiny responda
until curl -s "http://localhost:$PORT/app" >/dev/null; do
    sleep 1
done

echo "
🏁 Proceso finalizado
---------------------
✅ Servidor listo.
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
