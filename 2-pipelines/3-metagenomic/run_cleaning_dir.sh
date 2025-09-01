#!/bin/bash
# clean_dir.sh
# Script para limpiar archivos y carpetas generadas por Nextflow y Quarto,
# y vaciar carpetas específicas sin eliminar las carpetas en sí.

set -e

# Cambiar al directorio del script
cd "$(dirname "$0")"

# Definición de variables
RUTA_PIPELINE=$(pwd)
NOMBRE_PIPELINE=$(basename "$RUTA_PIPELINE")

echo ""
echo "Directorio a limpiar: $RUTA_PIPELINE"
echo ""
echo "🚿 Limpiando directorios y archivos generados..."

# -------------------------------------------------
# 1️⃣ Eliminación de archivos y carpetas por patrón
# -------------------------------------------------

PATTERNS_TO_DELETE=(
  "work"
  ".nextflow"
  ".quarto"
  "*_cache"
  "*_freeze"
  "*.log*"
  ".nextflow.log*"
  ".RData"
  ".Rhistory"
  "*.DS_Store"
  "*.rds"
)

for pattern in "${PATTERNS_TO_DELETE[@]}"; do
  echo "   - Buscando y eliminando: $pattern..."
  
  # Eliminar archivos que coincidan con el patrón
  find . -type f -name "$pattern" -delete 2>/dev/null
  
  # Eliminar directorios que coincidan con el patrón
  find . -type d -name "$pattern" -exec rm -rf {} + 2>/dev/null
done



# -------------------------------------------------
# 2️⃣ Vaciar carpetas sin borrarlas
# -------------------------------------------------

echo ""
echo "🧹 Vaciando carpetas específicas..."

# Lista de carpetas a vaciar
FOLDERS_TO_EMPTY=(
  "report"
  #"resources/1-essential/2-archives/Tab3-Analisis16S"
  #"resources/1-essential/2-archives/Tab3-Analisis18S"
  #"resources/1-essential/2-archives/Tab3-AnalisisITS"
  #"resources/2-nextflow-results/1-project-data"
  #"resources/2-nextflow-results/2-fastqc-report"
  #"resources/2-nextflow-results/3-analisis-estadistico"
  #"../../1-app/www/reports/$NOMBRE_PIPELINE"
)

for folder in "${FOLDERS_TO_EMPTY[@]}"; do
  if [ -d "$folder" ]; then
    echo "   - Vaciando carpeta $folder..."
    
    # Eliminar todos los archivos normales excepto .gitkeep
    find "$folder" -mindepth 1 ! -name ".gitkeep" -exec rm -rf {} + 2>/dev/null
  fi
done

echo ""
echo "✅ Limpieza completada."
echo ""
