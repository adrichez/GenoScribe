#!/usr/bin/env bash

set -euo pipefail


#############################################################################################################################################################
# SCRIPT PARA LANZAR LA APLICACIÓN GENOSCRIBE MEDIANTE SHELL EN LOCAL (SIN CONTENEDORES, DIRECTAMENTE EN SU MÁQUINA) (MODALIDAD FORMULARIO)
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

echo ""
title1 "###################################################################################################################################"
title1 "🚀${TAB_4}Lanzando App GenoScribe en local (sin contenedores, directamente en su máquina)"
title1 "###################################################################################################################################"
echo ""


# Configuración de variables robusta
# Cambiar al directorio donde está el script
PATH_SCRIPT_RUN_APP="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$PATH_SCRIPT_RUN_APP"


# Definir la ruta raíz y el nombre del repositorio
PATH_REPOSITORY="$(cd "$PATH_SCRIPT_RUN_APP/../.." && pwd)"  # 2 niveles arriba
REPOSITORY_BASENAME="$(basename "$PATH_REPOSITORY")"


# Definir las rutas absolutas de los pipelines actualizadas
PATH_TRANSCRIPTOMICS="$PATH_REPOSITORY/02-pipelines/01-transcriptomics"
PATH_METAGENOMICS="$PATH_REPOSITORY/02-pipelines/02-metagenomics"
PATH_METATRANSCRIPTOMICS="$PATH_REPOSITORY/02-pipelines/03-metatranscriptomics"

PATH_TRANS_BULK_PIPELINE="$PATH_TRANSCRIPTOMICS/01-bulk-rna-seq"
PATH_TRANS_SC_PIPELINE="$PATH_TRANSCRIPTOMICS/02-sc-rna-seq"
PATH_TRANS_ST_PIPELINE="$PATH_TRANSCRIPTOMICS/03-st-rna-seq"

PATH_METAGEN_SHOTGUN_PIPELINE="$PATH_METAGENOMICS/01-shotgun"
PATH_METAGEN_AMPLICON_PIPELINE="$PATH_METAGENOMICS/02-amplicon"

PATH_METATRANS_SHOTGUN_PIPELINE="$PATH_METATRANSCRIPTOMICS/01-shotgun"


# Imprimir parámetros de configuración
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
title2 "🛠️${TAB_4}Parámetros de configuración:"
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
info "🔹${TAB_4}Directorio del script: $PATH_SCRIPT_RUN_APP"
info "🔹${TAB_4}Ruta raíz del repositorio: $PATH_REPOSITORY"
info "🔹${TAB_4}Nombre del repositorio: $REPOSITORY_BASENAME"
echo ""
echo ""


# Preguntar por el tipo de análisis
# Menú interactivo - Nivel 1: Categoría Ómica
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
title2 "💬${TAB_4}Responda a las siguientes preguntas para determinar qué análisis desea lanzar:"
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
echo ""
title3 "📄${TAB_4}¿Qué categoría ómica desea ejecutar?:"
title3 "========================================="
echo "1) Transcriptómica"
echo "2) Metagenómica"
echo "3) Metatranscriptómica"
read -rp "---> Ingrese el número de la opción (1-3): " OMICS_CATEGORY
echo ""

case "$OMICS_CATEGORY" in
    1)
        # Menú interactivo - Nivel 2: Transcriptómica
        title3 "📄${TAB_4}¿Qué análisis de Transcriptómica desea ejecutar?"
        title3 "===================================================="
        echo "1) Bulk RNA-Seq"
        echo "2) Single Cell RNA-Seq"
        echo "3) Transcriptómica Espacial"
        read -rp "---> Ingrese el número de la opción (1-3): " ANALYSIS_TYPE
        echo ""
        case "$ANALYSIS_TYPE" in
            1) OMICS_CATEGORY="trans-bulk" ;;
            2) OMICS_CATEGORY="trans-sc" ;;
            3) OMICS_CATEGORY="trans-st" ;;
            *) error "❌${TAB_4}Opción no válida. Saliendo..." ; exit 1 ;;
        esac
        ;;
    2)
        # Menú interactivo - Nivel 2: Metagenómica
        title3 "📄${TAB_4}¿Qué análisis de Metagenómica desea ejecutar?"
        title3 "================================================="
        echo "1) Shotgun"
        echo "2) Amplicones"
        read -rp "---> Ingrese el número de la opción (1-2): " ANALYSIS_TYPE
        echo ""
        case "$ANALYSIS_TYPE" in
            1) OMICS_CATEGORY="metagen-shotgun" ;;
            2) OMICS_CATEGORY="metagen-amplicon" ;;
            *) error "❌${TAB_4}Opción no válida. Saliendo..." ; exit 1 ;;
        esac
        ;;
    3)
        # Menú interactivo - Nivel 2: Metatranscriptómica
        title3 "📄${TAB_4}¿Qué análisis de Metatranscriptómica desea ejecutar?"
        title3 "========================================================"
        echo "1) Shotgun"
        read -rp "---> Ingrese el número de la opción (1): " ANALYSIS_TYPE
        echo ""
        case "$ANALYSIS_TYPE" in
            1) OMICS_CATEGORY="metatrans-shotgun" ;;
            *) error "❌${TAB_4}Opción no válida. Saliendo..." ; exit 1 ;;
        esac
        ;;
    *)
        error "❌${TAB_4}Opción no válida. Saliendo..."
        exit 1
        ;;
esac


# Preguntar parámetros adicionales según el tipo de análisis seleccionado
case "$OMICS_CATEGORY" in
    "trans-bulk")
        echo ""
        title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
        title2 "💬${TAB_4}Parámetros requeridos para Bulk RNA-Seq:"
        title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
        read -p "---> Ruta a la carpeta de datos resultado del análisis: " PATH_PROJECT
        PATH_PROJECT="$(echo "$PATH_PROJECT" | sed -e "s/^['\"]//" -e "s/['\"]$//")"
        read -p "---> Nombre del experimento: " EXPERIMENT_NAME
        echo "Seleccione el idioma del informe:"
        echo "  1) Español"
        echo "  2) Inglés"
        read -p "---> Idioma del informe (1/2): " REPORT_LANGUAGE
        echo "Seleccione la versión del informe:"
        echo "  1) Full"
        echo "  2) Compact"
        read -p "---> Versión del informe (1/2): " REPORT_VERSION
        PARAMS=("$PATH_PROJECT" "$EXPERIMENT_NAME" "$REPORT_LANGUAGE" "$REPORT_VERSION")
        PATH_RUN_PIPELINE="$PATH_TRANS_BULK_PIPELINE/run_pipeline_shell.sh"
        ;;
    "trans-sc")
        echo ""
        title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
        title2 "💬${TAB_4}Parámetros requeridos para Single Cell RNA-Seq:"
        title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
        read -p "---> Ruta a la carpeta de datos resultado del análisis: " PATH_PROJECT
        PATH_PROJECT="$(echo "$PATH_PROJECT" | sed -e "s/^['\"]//" -e "s/['\"]$//")"
        echo "Seleccione el idioma del informe:"
        echo "  1) Español"
        echo "  2) Inglés"
        read -p "---> Idioma del informe (1/2): " REPORT_LANGUAGE
        echo "Seleccione la versión del informe:"
        echo "  1) Full"
        echo "  2) Compact"
        read -p "---> Versión del informe (1/2): " REPORT_VERSION
        PARAMS=("$PATH_PROJECT" "$REPORT_LANGUAGE" "$REPORT_VERSION")
        PATH_RUN_PIPELINE="$PATH_TRANS_SC_PIPELINE/run_pipeline_shell.sh"
        ;;
    "trans-st")
        echo ""
        title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
        title2 "💬${TAB_4}Parámetros requeridos para Transcriptómica Espacial:"
        title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
        read -p "---> Ruta a la carpeta de datos resultado del análisis: " PATH_PROJECT
        PATH_PROJECT="$(echo "$PATH_PROJECT" | sed -e "s/^['\"]//" -e "s/['\"]$//")"
        echo "Seleccione el idioma del informe:"
        echo "  1) Español"
        echo "  2) Inglés"
        read -p "---> Idioma del informe (1/2): " REPORT_LANGUAGE
        echo "Seleccione la versión del informe:"
        echo "  1) Full"
        echo "  2) Compact"
        read -p "---> Versión del informe (1/2): " REPORT_VERSION
        PARAMS=("$PATH_PROJECT" "$REPORT_LANGUAGE" "$REPORT_VERSION")
        PATH_RUN_PIPELINE="$PATH_TRANS_ST_PIPELINE/run_pipeline_shell.sh"
        ;;
    "metagen-shotgun")
        echo ""
        title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
        title2 "💬${TAB_4}Parámetros requeridos para Metagenómica (Shotgun):"
        title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
        read -p "---> Ruta a la carpeta de datos resultado del análisis: " PATH_PROJECT
        PATH_PROJECT="$(echo "$PATH_PROJECT" | sed -e "s/^['\"]//" -e "s/['\"]$//")"
        echo "Seleccione el idioma del informe:"
        echo "  1) Español"
        echo "  2) Inglés"
        read -p "---> Idioma del informe (1/2): " REPORT_LANGUAGE
        echo "Seleccione la versión del informe:"
        echo "  1) Full"
        echo "  2) Compact"
        read -p "---> Versión del informe (1/2): " REPORT_VERSION
        PARAMS=("$PATH_PROJECT" "$REPORT_LANGUAGE" "$REPORT_VERSION")
        PATH_RUN_PIPELINE="$PATH_METAGEN_SHOTGUN_PIPELINE/run_pipeline_shell.sh"
        ;;
    "metagen-amplicon")
        echo ""
        title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
        title2 "💬${TAB_4}Parámetros requeridos para Metagenómica (Amplicones):"
        title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
        read -p "---> Ruta a la carpeta de datos resultado del análisis: " PATH_PROJECT
        PATH_PROJECT="$(echo "$PATH_PROJECT" | sed -e "s/^['\"]//" -e "s/['\"]$//")"
        echo "Seleccione el tipo de análisis metagenómico:"
        echo "  1) 16S"
        echo "  2) 18S"
        echo "  3) ITS"
        echo "  4) 16S + 18S"
        echo "  5) 16S + ITS"
        echo "  6) 18S + ITS"
        echo "  7) 16S + 18S + ITS"
        read -p "---> Tipo de análisis metagenómico (1-7): " AMPLICON_TYPE
        echo "Seleccione el idioma del informe:"
        echo "  1) Español"
        echo "  2) Inglés"
        read -p "---> Idioma del informe (1/2): " REPORT_LANGUAGE
        echo "Seleccione la versión del informe:"
        echo "  1) Full"
        echo "  2) Compact"
        read -p "---> Versión del informe (1/2): " REPORT_VERSION
        PARAMS=("$PATH_PROJECT" "$AMPLICON_TYPE" "$REPORT_LANGUAGE" "$REPORT_VERSION")
        PATH_RUN_PIPELINE="$PATH_METAGEN_AMPLICON_PIPELINE/run_pipeline_shell.sh"
        ;;
    "metatrans-shotgun")
        echo ""
        title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
        title2 "💬${TAB_4}Parámetros requeridos para Metatranscriptómica (Shotgun):"
        title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
        read -p "---> Ruta a la carpeta de datos resultado del análisis: " PATH_PROJECT
        PATH_PROJECT="$(echo "$PATH_PROJECT" | sed -e "s/^['\"]//" -e "s/['\"]$//")"
        echo "Seleccione el idioma del informe:"
        echo "  1) Español"
        echo "  2) Inglés"
        read -p "---> Idioma del informe (1/2): " REPORT_LANGUAGE
        echo "Seleccione la versión del informe:"
        echo "  1) Full"
        echo "  2) Compact"
        read -p "---> Versión del informe (1/2): " REPORT_VERSION
        PARAMS=("$PATH_PROJECT" "$REPORT_LANGUAGE" "$REPORT_VERSION")
        PATH_RUN_PIPELINE="$PATH_METATRANS_SHOTGUN_PIPELINE/run_pipeline_shell.sh"
        ;;
esac


# Asegurar que el script es ejecutable
chmod +x "$PATH_RUN_PIPELINE"


# Construir el comando sin el último parámetro
CMD_PIPELINE="\"$PATH_RUN_PIPELINE\""
for p in "${PARAMS[@]}"; do
    CMD_PIPELINE+=" \"${p}\""
done

echo ""
echo ""


# Ejecutar el pipeline en local
eval "$CMD_PIPELINE"

echo ""
