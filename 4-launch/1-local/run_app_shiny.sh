#!/usr/bin/env bash
set -euo pipefail

echo "
---------------------------------------------------------------------------------------------------------------------
🚀 Lanzando App GenoScribe desde la interfaz gráfica de Shiny en local (sin contenedores, directamente en su máquina)
---------------------------------------------------------------------------------------------------------------------
"

# Configuración de variables
PORT=3838
APP_DIR="$(pwd)/1-app"
REPORTS="$APP_DIR/www/reports"

echo "⚙️  Realizando ajustes iniciales..."
echo "-----------------------------------"

# Ajustar permisos de la carpeta de reportes
if [ -d "$REPORTS" ]; then
    echo "⚙️  Ajustando permisos de la carpeta de reportes..."
    chmod -R a+rw "$REPORTS"

    mkdir -p "$REPORTS/1-bulk-rna-seq"
    chmod -R a+rw "$REPORTS/1-bulk-rna-seq"

    mkdir -p "$REPORTS/2-sc-rna-seq"
    chmod -R a+rw "$REPORTS/2-sc-rna-seq"

    mkdir -p "$REPORTS/3-metagenomica"
    chmod -R a+rw "$REPORTS/3-metagenomic"

    echo "✅ Permisos ajustados."
fi

# Comprobar si el puerto está en uso y matarlo si es necesario
if lsof -i :$PORT >/dev/null 2>&1; then
    echo "⚠️  Puerto $PORT en uso. Cerrando proceso que lo ocupa..."
    lsof -ti :$PORT | xargs kill -9 2>/dev/null || true
    sleep 1
    echo "✅ Puerto $PORT liberado."
fi

echo ""
echo "🚀 Iniciando GenoScribe..."
echo "--------------------------"

# Ajustes iniciales de permisos
chmod -R u+rwX "$APP_DIR"
chown -R "$(whoami)" "$APP_DIR" || echo "⚠️ Algunos archivos no pudieron cambiar ownership"
if [ -d "$REPORTS" ]; then
    chmod -R u+rwX "$REPORTS"
    chown -R "$(whoami)" "$REPORTS" || echo "⚠️ Algunos archivos no pudieron cambiar ownership"
fi

echo "👍 Carpetas y permisos listos."
echo "⚙️  Iniciando la aplicación Shiny..."
echo "⏳ Iniciando el servidor..."
echo "🌐 Abriendo navegador en: http://localhost:$PORT/app..."
echo "📁 El informe estará disponible en el directorio: $REPORTS"
echo "🔒 Una vez finalizado el proceso y generado el informe, pulsar [Ctrl+C] en la terminal para detener el servidor."
echo ""

# Ejecutar la app Shiny usando el R de RStudio
/usr/local/bin/Rscript -e "
suppressWarnings(library(shiny));
runApp(appDir = '$APP_DIR', 
    launch.browser = TRUE, 
    host = '0.0.0.0', 
    port = $PORT,
    display.mode = 'normal')
"
