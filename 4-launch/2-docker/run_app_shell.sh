#!/usr/bin/env bash
set -euo pipefail

echo "
-------------------------------------------------------------------------
🚀 Lanzando App GenoScribe desde la terminal (sin interfaz gráfica Shiny)
-------------------------------------------------------------------------
"

# Configuración de variables
PROYECTO_BASENAME="GenoScribe"
CONTAINER_NAME="genoscribe_container"
CONTAINER_TAG="1.0"
PORT=3838  # para exponer Shiny si se necesitara

# Preguntar tipo de análisis
echo "📄 Seleccione el tipo de análisis a ejecutar:"
echo "---------------------------------------------"
echo "  1) bulk-rna-seq"
echo "  2) sc-rna-seq"
echo "  3) metagenomic"
read -p "---> Ingrese el número correspondiente: " OPCION
echo ""

case "$OPCION" in
    1) TIPO_ANALISIS="bulk-rna-seq" ;;
    2) TIPO_ANALISIS="sc-rna-seq" ;;
    3) TIPO_ANALISIS="metagenomic" ;;
    *) echo "❌ Opción inválida"; exit 1 ;;
esac

# Preguntar parámetros adicionales según tipo de análisis
case "$TIPO_ANALISIS" in
    "bulk-rna-seq")
        echo "📄 Parámetros requeridos para bulk-rna-seq:"
        echo "-------------------------------------------"
        read -p "---> Ruta a la carpeta de datos resultado del análisis: " DATOS
        read -p "---> Nombre del experimento: " NOMBRE_EXPERIMENTO
        DATOS_BASENAME=$(basename "$DATOS")
        PARAMS=("/data/$DATOS_BASENAME" "$NOMBRE_EXPERIMENTO")
        SCRIPT_PIPELINE="/$PROYECTO_BASENAME/2-pipelines/1-bulk-rna-seq/run_pipeline_shell.sh"
        ;;
    "sc-rna-seq")
        echo "📄 Parámetros requeridos para sc-rna-seq:"
        echo "-----------------------------------------"
        read -p "---> Ruta a la carpeta de datos resultado del análisis: " DATOS
        read -p "---> Nombre del experimento: " NOMBRE_EXPERIMENTO
        DATOS_BASENAME=$(basename "$DATOS")
        PARAMS=("/data/$DATOS_BASENAME" "$NOMBRE_EXPERIMENTO")
        SCRIPT_PIPELINE="/$PROYECTO_BASENAME/2-pipelines/2-sc-rna-seq/run_pipeline_shell.sh"
        ;;
    "metagenomic")
        echo "📄 Parámetros requeridos para metagenómica:"
        echo "-------------------------------------------"
        read -p "---> Ruta a la carpeta de datos resultado del análisis: " DATOS
        read -p "---> Nombre del experimento: " NOMBRE_EXPERIMENTO
        DATOS_BASENAME=$(basename "$DATOS")
        PARAMS=("/data/$DATOS_BASENAME" "$NOMBRE_EXPERIMENTO")
        SCRIPT_PIPELINE="/$PROYECTO_BASENAME/2-pipelines/3-metagenomic/run_pipeline_shell.sh"
        ;;
esac

# Preguntar tipo de análisis
echo ""
echo "📄 Directorio donde se guardarán los resultados:"
echo "------------------------------------------------"
read -p "---> Ruta local de la carpeta donde se guardarán los reportes: " REPORTS

# Ajustar permisos de la carpeta de reportes
if [ -d "$REPORTS" ]; then
    echo "⚙️  Ajustando permisos de la carpeta de reportes..."
    chmod -R a+rw "$REPORTS"
    echo "✅ Permisos ajustados."
    echo ""
fi

# Preguntar si el contenedor debe ser persistente o temporal
echo "📄 Seleccione el tipo de contenedor:"
echo "------------------------------------"
echo "  1) Persistente (no se elimina al detenerse)"
echo "  2) Temporal (se elimina automáticamente al detenerse)"
read -p "---> Ingrese el número correspondiente: " CONT_TYPE
echo ""

case "$CONT_TYPE" in
    1) CONT_MODE="persistente" ;;
    2) CONT_MODE="temporal" ;;
    *) echo "❌ Opción inválida"; exit 1 ;;
esac

echo "🐳 Comprobando contenedor..."
echo "----------------------------"

# Crear o iniciar contenedor
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
    if [ "$CONT_MODE" == "persistente" ]; then
        docker run -dit --name "$CONTAINER_NAME" \
            -v "$DATOS":/data/"$DATOS_BASENAME" \
            -v "$REPORTS":/$PROYECTO_BASENAME/1-app/www/reports \
            genoscribe:$CONTAINER_TAG
    else
        docker run -dit --rm --name "$CONTAINER_NAME" \
            -v "$DATOS":/data/"$DATOS_BASENAME" \
            -v "$REPORTS":/$PROYECTO_BASENAME/1-app/www/reports \
            genoscribe:$CONTAINER_TAG
    fi
    sleep 2
fi

echo "✅ Contenedor '$CONTAINER_NAME' listo."
echo ""
echo ""

docker exec -it "$CONTAINER_NAME" bash -c "chmod +x \"$SCRIPT_PIPELINE\""

# Construir el comando a ejecutar dentro del contenedor
CMD_PIPELINE="cd \"$(dirname "$SCRIPT_PIPELINE")\" && ./\"$(basename "$SCRIPT_PIPELINE")\""
for p in "${PARAMS[@]}"; do
    CMD_PIPELINE+=" \"${p}\""
done
CMD_PIPELINE+=" \"$REPORTS\""

# Ejecutar dentro del contenedor
docker exec -it "$CONTAINER_NAME" bash -c "$CMD_PIPELINE"

echo ""
