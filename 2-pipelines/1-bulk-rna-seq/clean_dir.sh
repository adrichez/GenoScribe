#!/bin/bash
# clean_dir.sh
# Script para limpiar archivos y carpetas generadas por Nextflow y Quarto

set -e

echo "🚿 Limpiando directorios y archivos generados..."

# Lista de patrones de archivos y carpetas a eliminar.
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

# Eliminar todos los archivos y carpetas que coincidan con los patrones en cualquier subdirectorio
for pattern in "${PATTERNS_TO_DELETE[@]}"; do
  echo "   - Buscando y eliminando: $pattern..."
  
  # Comando para eliminar archivos que coincidan con el patrón
  find . -type f -name "$pattern" -delete 2>/dev/null
  
  # Comando para eliminar directorios que coincidan con el patrón.
  find . -type d -name "$pattern" -exec rm -rf {} + 2>/dev/null
done

echo "✅ Limpieza completada."