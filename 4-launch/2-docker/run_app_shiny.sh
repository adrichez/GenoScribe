#!/usr/bin/env bash
set -e

echo "
-------------------------------------------------------------
🚀 Lanzando App GenoScribe desde la interfaz gráfica de Shiny
-------------------------------------------------------------
"

# Configuración de variables
PORT=3838
CONTAINER_NAME="genoscribe_container"
DATOS_BASENAME=$(basename "$DATOS")

# Variables adicionales
echo "📄 Proporcione los siguientes elementos:"
echo "----------------------------------------"
read -p "---> Ruta a la carpeta de datos resultado del análisis: " DATOS
read -p "---> Ruta local de la carpeta donde se guardarán los reportes: " REPORTS
echo ""

# Asegurar permisos de escritura en la carpeta de reportes
if [ -d "$REPORTS" ]; then
    echo "⚙️  Realizando ajustes iniciales..."
    echo "-----------------------------------"
    echo "🔧 Ajustando permisos de la carpeta de reportes..."

    chmod -R a+rw "$REPORTS"

    echo "✅ Permisos ajustados."
fi

# Comprobar si el puerto está en uso
if lsof -i :$PORT >/dev/null 2>&1; then
    echo "⚠️  Puerto $PORT en uso."

    CONTAINER_ID=$(docker ps -q --filter "publish=$PORT")
    if [ -n "$CONTAINER_ID" ]; then
        echo "🛑 Deteniendo contenedor que usa el puerto..."
        echo ""
        docker stop "$CONTAINER_ID"
        sleep 2
    else
        echo "🔒 Cerrando proceso que usa el puerto..."
        lsof -i :$PORT | awk 'NR>1 {print $2}' | xargs kill -9 2>/dev/null
        sleep 2
    fi
    echo ""
    echo "✅ Puerto $PORT liberado."
fi

echo ""
echo "🚀 Iniciando GenoScribe..."
echo "--------------------------"
echo "📂 Datos de usuario: $DATOS"
echo "📂 Carpeta de reportes: $REPORTS"
echo "🌐 La app estará disponible en: http://localhost:$PORT/app"
echo ""

# Preguntar si el contenedor debe ser persistente o temporal
echo "📄 Seleccione el tipo de contenedor:"
echo "------------------------------------"
echo "  1) Persistente (no se elimina al detenerse)"
echo "  2) Temporal (se elimina automáticamente al detenerse)"
read -p "---> Ingrese el número correspondiente: " CONT_TYPE
echo ""

echo "🐳 Comprobando contenedor..."
echo "----------------------------"

# Arrancar contenedor existente o crear uno nuevo
if [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then
    echo "✅ Contenedor '$CONTAINER_NAME' ya existe."
    if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
        echo "♻️  Contenedor '$CONTAINER_NAME' ya está corriendo."
    else
        echo "⚠️  Contenedor '$CONTAINER_NAME' está detenido. Iniciando..."
        echo "⏯️  Iniciando..."
        docker start "$CONTAINER_NAME"
        sleep 2
    fi
else
    echo "⚠️  Contenedor '$CONTAINER_NAME' no existe."
    echo "🏗️  Creando contenedor '$CONTAINER_NAME' en modo $CONT_MODE..."

    if [ "$CONT_TYPE" -eq 1 ]; then
        docker run -dit --name "$CONTAINER_NAME" -p $PORT:3838 \
            -v "$DATOS":/data/"$DATOS_BASENAME" \
            -v "$REPORTS":/srv/shiny-server/app/www/reports \
            genoscribe
    elif [ "$CONT_TYPE" -eq 2 ]; then
        docker run -dit --rm --name "$CONTAINER_NAME" -p $PORT:3838 \
            -v "$DATOS":/data/"$DATOS_BASENAME" \
            -v "$REPORTS":/srv/shiny-server/app/www/reports \
            genoscribe
    else
        echo "❌ Opción no válida. Abortando."
        exit 1
    fi
fi

echo "✅ Contenedor '$CONTAINER_NAME' listo."
echo ""

echo "🚀️ Lanzando ajustes iniciales del entrypoint..."
echo "-----------------------------------------------"
echo "👍 Carpetas y permisos listos."
echo "⚙️  Arrancando Shiny Server..."
echo "🚀 Iniciando aplicación..."
echo "⏳ Esperando a que el servidor esté listo..."

# Esperar hasta que Shiny responda
until curl -s "http://localhost:$PORT/app" >/dev/null; do
    sleep 1
done

echo ""
echo "🏁 Proceso finalizado"
echo "---------------------"
echo "✅ Servidor listo."
echo "⏳ Abriendo navegador..."
echo ""

# Abrir navegador según sistema
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    xdg-open "http://localhost:$PORT/app"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    open "http://localhost:$PORT/app"
elif [[ "$OSTYPE" == "msys" ]]; then
    start "http://localhost:$PORT/app"
fi
