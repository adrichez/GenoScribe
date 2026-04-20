#!/bin/bash

set -e


#############################################################################################################################################################
# SCRIPT PARA LIMPIAR EL DIRECTORIO DE TRABAJO DEL PIPELINE DE METAGENOMICS AMPLICON
#############################################################################################################################################################

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# AJUSTES DE PERSONALIZACIÓN DE LA SALIDA
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#=====================================================================================================================================
# Colores y estilos de texto
#=====================================================================================================================================

# Estilos de texto
BOLD="\033[1m"
UNDERLINE="\033[4m"
ITALIC="\033[3m"


# Color de reinicio
RESET="\033[0m"

# Colores para mensajes
GREY="\033[38;5;245m"
CYAN="\033[0;36m"
YELLOW="\033[38;5;226m"

GREEN="\033[0;32m"
LIME="\033[38;5;118m"
ORANGE="\033[38;5;208m"
RED="\033[0;31m"


# Colores para títulos
BLUE="\033[0;34m"
TEAL="\033[38;5;44m"
PURPLE="\033[38;5;57m"
MAGENTA="\033[38;5;129m"
PINK="\033[38;5;218m"


# Funciones
note() { echo -e "${GREY}${ITALIC}$*${RESET}"; }
info() { echo -e "${CYAN}$*${RESET}"; }
important() { echo -e "${YELLOW}$*${RESET}"; }

success() { echo -e "${GREEN}$*${RESET}"; }
success_b() { echo -e "${LIME}$*${RESET}"; }
warn() { echo -e "${ORANGE}$*${RESET}"; }
error() { echo -e "${RED}$*${RESET}"; }

title1() { echo -e "${BLUE}${BOLD}$*${RESET}"; }
title2() { echo -e "${TEAL}${BOLD}$*${RESET}"; }
title3() { echo -e "${PURPLE}${BOLD}$*${RESET}"; }
title4() { echo -e "${MAGENTA}${BOLD}$*${RESET}"; }
title5() { echo -e "${PINK}${BOLD}$*${RESET}"; }




#=====================================================================================================================================
# Espaciado
#=====================================================================================================================================

TAB_4=$'\033[4G'  # Tabulación a la columna 4
TAB_5=$'\033[5G'  # Tabulación a la columna 5






#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# CODIGO PRINCIPAL
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

# Cambiar al directorio del script
cd "$(dirname "$0")"


# Definición de variables
PATH_PIPELINE=$(pwd)
PIPELINE_DIR=$(basename "$PATH_PIPELINE")
OMICS_CATEGORY_DIR=$(basename "$(dirname "$PATH_PIPELINE")")


# Comprobar en qué categoría y pipeline estamos
case "${OMICS_CATEGORY_DIR}/${PIPELINE_DIR}" in

  "01-transcriptomics/01-bulk-rna-seq")
    OMICS_CATEGORY_NAME="Transcriptomics"
    PIPELINE_NAME="Bulk RNA-Seq"
    ;;

  "01-transcriptomics/02-sc-rna-seq")
    OMICS_CATEGORY_NAME="Transcriptomics"
    PIPELINE_NAME="Single Cell RNA-Seq"
    ;;

  "01-transcriptomics/03-st-rna-seq")
    OMICS_CATEGORY_NAME="Transcriptomics"
    PIPELINE_NAME="Spatial Transcriptomics"
    ;;

  "02-metagenomics/01-shotgun")
    OMICS_CATEGORY_NAME="Metagenomics"
    PIPELINE_NAME="Metagenomics Shotgun"
    ;;

  "02-metagenomics/02-amplicon")
    OMICS_CATEGORY_NAME="Metagenomics"
    PIPELINE_NAME="Metagenomics Amplicon"
    ;;

  "03-metatranscriptomics/01-shotgun")
    OMICS_CATEGORY_NAME="Metatranscriptomics"
    PIPELINE_NAME="Metatranscriptomics Shotgun"
    ;;

  *)
    OMICS_CATEGORY_NAME="Desconocida"
    PIPELINE_NAME="Desconocido"
    ;;

esac


# Mostrar información de contexto
info "🔷${TAB_4}Nombre de la categoría de ómica: $OMICS_CATEGORY_NAME"
info "🔷${TAB_4}Directorio de la categoría ómica a limpiar: $OMICS_CATEGORY_DIR"
info "🔷${TAB_4}Nombre del tipo de análisis específico: $PIPELINE_NAME"
info "🔷${TAB_4}Directorio del tipo de análisis específico a limpiar: $PIPELINE_DIR"
info "🔷${TAB_4}Ruta del directorio: $PATH_PIPELINE"




# -------------------------------------------------
# 1. Eliminación de archivos y carpetas por patrón
# -------------------------------------------------

echo ""
title3 "🚿${TAB_4}Limpiando directorios y archivos generados..."

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
  "*.rds"
  ".gitignore"
  "*.vdoc*.r"
  "*.vdoc*.R"
  "*.vdoc*.Rmd"
  "*.vdoc*.qmd"
  "*.vdoc*.md"
  "._*"
)

for pattern in "${PATTERNS_TO_DELETE[@]}"; do
  echo "   - Buscando y eliminando: $pattern..."
  # Eliminar archivos o directorios que coincidan con el patrón
  find . -depth -name "$pattern" -exec rm -rf {} + 2>/dev/null
done




# ---------------------------------
# 2. Vaciar carpetas sin borrarlas
# ---------------------------------

echo ""
title3 "🧹${TAB_4}Vaciando carpetas específicas..."

# Lista de carpetas a vaciar
FOLDERS_TO_EMPTY=(
  "report"
  "resources/01-essential/02-archives/02-tmp/tab0-inicio"
  "resources/01-essential/02-archives/02-tmp/tab1-metodologia"
  "resources/01-essential/02-archives/02-tmp/tab2-resumen/tab2-1-resumen-16S"
  "resources/01-essential/02-archives/02-tmp/tab2-resumen/tab2-2-resumen-18S"
  "resources/01-essential/02-archives/02-tmp/tab2-resumen/tab2-3-resumen-ITS"
  "resources/01-essential/02-archives/02-tmp/tab3-analisis/tab3-1-analisis-16S"
  "resources/01-essential/02-archives/02-tmp/tab3-analisis/tab3-2-analisis-18S"
  "resources/01-essential/02-archives/02-tmp/tab3-analisis/tab3-3-analisis-ITS"
  "resources/02-nextflow-results/01-project-data"
  "resources/02-nextflow-results/02-multiqc-report"
  "resources/02-nextflow-results/03-analisis-estadistico"
  "../../../01-app/www/reports/$OMICS_CATEGORY_DIR/$PIPELINE_DIR"
  "../../../01-app/www/resources/03-archives/02-tmp/$OMICS_CATEGORY_DIR/$PIPELINE_DIR"
)

for folder in "${FOLDERS_TO_EMPTY[@]}"; do
  if [ -d "$folder" ]; then
    echo "   - Vaciando carpeta $folder..."
    # Eliminar todo (archivos y subcarpetas) excepto .gitkeep, en orden de profundidad
    find "$folder" -mindepth 1 -depth ! -name ".gitkeep" -exec rm -rf {} + 2>/dev/null
  fi
done




# -----------------------------------------------------
# 3. Creanción de archivos .gitkeep en carpetas vacías
# -----------------------------------------------------

echo ""
title3 "📄${TAB_4}Creando archivos .gitkeep en carpetas vacías..."

# Lista de carpetas donde crear .gitkeep
FOLDERS_GITKEEP=(
  "report"
)

for folder in "${FOLDERS_GITKEEP[@]}"; do
  if [ -d "$folder" ]; then
    if [ ! -f "$folder/.gitkeep" ]; then
      echo "   - Creando $folder/.gitkeep..."
      touch "$folder/.gitkeep"
    else
      echo "   - $folder/.gitkeep ya existe, no se modifica"
    fi
  else
    echo "   - La carpeta $folder no existe. Creándola..."
    mkdir -p "$folder"
    touch "$folder/.gitkeep"
  fi
done


echo ""
success "✅${TAB_4}Limpieza completada"
echo ""
