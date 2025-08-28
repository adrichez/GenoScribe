#!/bin/bash
# clean_all_pipelines.sh
# Script global para ejecutar la limpieza de pipelines según el tipo de análisis

set -e

# Cambiar al directorio del script
cd "$(dirname "$0")"

# Función para ejecutar un run_cleaning_dir.sh dado un directorio
run_clean() {
    local pipeline_dir="$1"
    if [ -f "$pipeline_dir/run_cleaning_dir.sh" ]; then
        echo ""
        echo "------------------------------------------------------------"
        echo "🚀 Ejecutando limpieza en $pipeline_dir"
        echo "------------------------------------------------------------"
        chmod +x "$pipeline_dir/run_cleaning_dir.sh"
        bash "$pipeline_dir/run_cleaning_dir.sh"
    else
        echo "⚠️  No se encontró run_cleaning_dir.sh en $pipeline_dir"
    fi
}

# Directorios de pipelines
BULK_DIR="../../2-pipelines/1-bulk-rna-seq"
SC_DIR="../../2-pipelines/2-sc-rna-seq"
METAGEN_DIR="../../2-pipelines/3-metagenomic"

# Menú interactivo
echo ""
echo "--------------------------------------------"
echo "📄 Seleccione el tipo de análisis a limpiar:"
echo "--------------------------------------------"
echo "1) Bulk RNA-Seq"
echo "2) Single-cell RNA-Seq"
echo "3) Metagenómica"
echo "4) Todos"
read -rp "---> Ingrese el número de la opción: " opcion
echo ""

case "$opcion" in
    1)
        run_clean "$BULK_DIR"
        ;;
    2)
        run_clean "$SC_DIR"
        ;;
    3)
        run_clean "$METAGEN_DIR"
        ;;
    4)
        run_clean "$BULK_DIR"
        run_clean "$SC_DIR"
        run_clean "$METAGEN_DIR"
        ;;
    *)
        echo "Opción no válida. Saliendo..."
        exit 1
        ;;
esac

echo ""
echo "🎉 Limpieza finalizada."
echo ""