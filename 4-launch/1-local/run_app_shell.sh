#!/usr/bin/env bash
set -euo pipefail

echo "
-----------------------------------------------------------------------------------
🚀 Lanzando App GenoScribe en local (sin contenedores, directamente en su máquina)
-----------------------------------------------------------------------------------
"

# Configuración de variables
PROYECTO_BASENAME="genoscribe"
RAIZ_PROYECTO="$(pwd)"

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
        PARAMS=("$DATOS" "$NOMBRE_EXPERIMENTO")
        SCRIPT_PIPELINE="$RAIZ_PROYECTO/2-pipelines/1-bulk-rna-seq/run_pipeline_shell.sh"
        REPORTS="$RAIZ_PROYECTO/2-pipelines/1-bulk-rna-seq/reports"
        ;;
    "sc-rna-seq")
        echo "📄 Parámetros requeridos para sc-rna-seq:"
        echo "-----------------------------------------"
        read -p "---> Ruta a la carpeta de datos resultado del análisis: " DATOS
        read -p "---> Nombre del experimento: " NOMBRE_EXPERIMENTO
        PARAMS=("$DATOS" "$NOMBRE_EXPERIMENTO")
        SCRIPT_PIPELINE="$RAIZ_PROYECTO/2-pipelines/2-sc-rna-seq/run_pipeline_shell.sh"
        REPORTS="$RAIZ_PROYECTO/2-pipelines/2-sc-rna-seq/reports"
        ;;
    "metagenomic")
        echo "📄 Parámetros requeridos para metagenómica:"
        echo "-------------------------------------------"
        read -p "---> Ruta a la carpeta de datos resultado del análisis: " DATOS
        read -p "---> Nombre del experimento: " NOMBRE_EXPERIMENTO
        PARAMS=("$DATOS" "$NOMBRE_EXPERIMENTO")
        SCRIPT_PIPELINE="$RAIZ_PROYECTO/2-pipelines/3-metagenomic/run_pipeline_shell.sh"
        REPORTS="$RAIZ_PROYECTO/2-pipelines/3-metagenomic/reports"
        ;;
esac

# Ajustar permisos de la carpeta de reportes
if [ -d "$REPORTS" ]; then
    chmod -R a+rw "$REPORTS"
    echo ""
fi

# Asegurar que el script es ejecutable
chmod +x "$SCRIPT_PIPELINE"

# Construir el comando (corregido)
CMD_PIPELINE="\"$SCRIPT_PIPELINE\""
for p in "${PARAMS[@]}"; do
    CMD_PIPELINE+=" \"${p}\""
done
CMD_PIPELINE+=" \"$REPORTS\""

echo ""
echo ""

# Ejecutar el pipeline en local
eval "$CMD_PIPELINE"

echo ""
