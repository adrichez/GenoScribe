#!/usr/bin/env bash

set -euo pipefail


#############################################################################################################################################################
# SCRIPT PARA LANZAR LA APLICACIÓN GENOSCRIBE MEDIANTE SHELL EN LOCAL (SIN CONTENEDORES) (MODALIDAD DIRECTA)
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
# CÓDIGO PRINCIPAL Y PARSEO DE ARGUMENTOS
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

echo ""
title1 "###################################################################################################################################"
title1 "🚀${TAB_4}Lanzando App GenoScribe en entorno LOCAL (modo Directo)"
title1 "###################################################################################################################################"
echo ""


# Función de ayuda
usage() {
    title2 "=========================================================================================="
    title2 "📖 AYUDA DE USO - PARÁMETROS DISPONIBLES"
    title2 "=========================================================================================="
    info " -oc, --omics_category: Categoría Ómica (1: Transcriptómica, 2: Metagenómica, 3: Metatranscriptómica)"
    info " -at, --analysis_type: Tipo de análisis (depende de OMICS_CATEGORY)"
    info " -pp, --path_project: Ruta absoluta a la carpeta de datos resultado del análisis"
    info " -rl, --report_language: Idioma del informe (1: Español, 2: Inglés)"
    info " -rv, --report_version: Versión del informe (1: full, 2: compact)"
    info " -en, --experiment_name: Nombre del experimento (Requerido para Bulk RNA-Seq)"
    info " -am, --amplicon_type: Tipo de amplicón (1-7) (Requerido para Metagenómica de Amplicones)"
    echo ""
    important "Correspondencias de opciones:"
    note " omics_category 1 (Transcriptómica) -> analysis_type: 1) Bulk RNA-Seq, 2) Single Cell RNA-Seq, 3) Spatial RNA-Seq"
    note " omics_category 2 (Metagenómica) -> analysis_type: 1) Shotgun, 2) Amplicones"
    note " omics_category 3 (Metatranscriptómica) -> analysis_type: 1) Shotgun"
    echo ""
    exit 1
}


# Inicializar variables
OMICS_CATEGORY=""
ANALYSIS_TYPE=""
PATH_PROJECT=""
REPORT_LANGUAGE=""
REPORT_VERSION=""
EXPERIMENT_NAME=""
AMPLICON_TYPE=""

# Parsear argumentos
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -oc|--omics_category) OMICS_CATEGORY="$2"; shift ;;
        -at|--analysis_type) ANALYSIS_TYPE="$2"; shift ;;
        -pp|--path_project) PATH_PROJECT="$2"; shift ;;
        -rl|--report_language) REPORT_LANGUAGE="$2"; shift ;;
        -rv|--report_version) REPORT_VERSION="$2"; shift ;;
        -en|--experiment_name) EXPERIMENT_NAME="$2"; shift ;;
        -am|--amplicon_type) AMPLICON_TYPE="$2"; shift ;;
        -h|--help) usage ;;
        *) error "❌${TAB_4}Parámetro desconocido: $1"; usage ;;
    esac
    shift
done

# Validar parámetros obligatorios generales
if [[ -z "$OMICS_CATEGORY" || -z "$ANALYSIS_TYPE" || -z "$PATH_PROJECT" || -z "$REPORT_LANGUAGE" || -z "$REPORT_VERSION" ]]; then
    error "❌${TAB_4}Faltan parámetros obligatorios (-oc, -at, -pp, -rl, -rv)."
    echo ""
    usage
fi


# Configuración de variables robusta
# Cambiar al directorio donde está el script
PATH_SCRIPT_RUN_APP="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$PATH_SCRIPT_RUN_APP"

# Definir la ruta raíz y el nombre del repositorio
PATH_REPOSITORY="$(cd "$PATH_SCRIPT_RUN_APP/../.." && pwd)"  # 2 niveles arriba
PATH_PIPELINES="$PATH_REPOSITORY/02-pipelines"

# Rutas a los pipelines específicos (versión local)
PATH_TRANSCRIPTOMICS_BULK_PIPELINE="$PATH_PIPELINES/01-transcriptomics/01-bulk-rna-seq"
PATH_TRANSCRIPTOMICS_SC_PIPELINE="$PATH_PIPELINES/01-transcriptomics/02-sc-rna-seq"
PATH_TRANSCRIPTOMICS_ST_PIPELINE="$PATH_PIPELINES/01-transcriptomics/03-st-rna-seq"
PATH_METAGEN_SHOTGUN_PIPELINE="$PATH_PIPELINES/02-metagenomics/01-shotgun"
PATH_METAGEN_AMPLICON_PIPELINE="$PATH_PIPELINES/02-metagenomics/02-amplicon"
PATH_METATRANS_SHOTGUN_PIPELINE="$PATH_PIPELINES/03-metatranscriptomics/01-shotgun"


# Determinar OMICS_ANALYSIS según OMICS_CATEGORY y ANALYSIS_TYPE
case "$OMICS_CATEGORY" in
    1)
        case "$ANALYSIS_TYPE" in
            1) OMICS_ANALYSIS="trans-bulk" ;;
            2) OMICS_ANALYSIS="trans-sc" ;;
            3) OMICS_ANALYSIS="trans-st" ;;
            *) error "❌${TAB_4}Sub-opción no válida para Transcriptómica. Saliendo..." ; exit 1 ;;
        esac
        ;;
    2)
        case "$ANALYSIS_TYPE" in
            1) OMICS_ANALYSIS="meta-shotgun" ;;
            2) OMICS_ANALYSIS="meta-amplicon" ;;
            *) error "❌${TAB_4}Sub-opción no válida para Metagenómica. Saliendo..." ; exit 1 ;;
        esac
        ;;
    3)
        case "$ANALYSIS_TYPE" in
            1) OMICS_ANALYSIS="metatrans-shotgun" ;;
            *) error "❌${TAB_4}Sub-opción no válida para Metatranscriptómica. Saliendo..." ; exit 1 ;;
        esac
        ;;
    *)
        error "❌${TAB_4}Categoría Ómica (OMICS_CATEGORY) no válida. Saliendo..."
        exit 1
        ;;
esac

# Procesar ruta del proyecto localmente
PATH_PROJECT="$(echo "$PATH_PROJECT" | sed -e "s/^['\"]//" -e "s/['\"]$//")"

# Validar ruta
if [[ ! -d "$PATH_PROJECT" ]]; then
    warn "⚠️${TAB_4}Atención: la ruta de datos de entrada '$PATH_PROJECT' no existe o no es válida."
fi


# Validar y asignar variables específicas según el tipo de análisis
case "$OMICS_ANALYSIS" in
    "trans-bulk")
        if [[ -z "$EXPERIMENT_NAME" ]]; then
            error "❌${TAB_4}Debe proporcionar --experiment_name (-en) para Bulk RNA-Seq."
            exit 1
        fi
        PARAMS=("$PATH_PROJECT" "$EXPERIMENT_NAME" "$REPORT_LANGUAGE" "$REPORT_VERSION")
        PATH_RUN_PIPELINE="$PATH_TRANSCRIPTOMICS_BULK_PIPELINE/run_pipeline_shell.sh"
        ;;
    "trans-sc")
        PARAMS=("$PATH_PROJECT" "$REPORT_LANGUAGE" "$REPORT_VERSION")
        PATH_RUN_PIPELINE="$PATH_TRANSCRIPTOMICS_SC_PIPELINE/run_pipeline_shell.sh"
        ;;
    "trans-st")
        PARAMS=("$PATH_PROJECT" "$REPORT_LANGUAGE" "$REPORT_VERSION")
        PATH_RUN_PIPELINE="$PATH_TRANSCRIPTOMICS_ST_PIPELINE/run_pipeline_shell.sh"
        ;;
    "meta-amplicon")
        if [[ -z "$AMPLICON_TYPE" ]]; then
            error "❌${TAB_4}Debe proporcionar --amplicon_type (-am) para Metagenómica (Amplicones)."
            exit 1
        fi
        PARAMS=("$PATH_PROJECT" "$AMPLICON_TYPE" "$REPORT_LANGUAGE" "$REPORT_VERSION")
        PATH_RUN_PIPELINE="$PATH_METAGEN_AMPLICON_PIPELINE/run_pipeline_shell.sh"
        ;;
    "meta-shotgun")
        PARAMS=("$PATH_PROJECT" "$REPORT_LANGUAGE" "$REPORT_VERSION")
        PATH_RUN_PIPELINE="$PATH_METAGEN_SHOTGUN_PIPELINE/run_pipeline_shell.sh"
        ;;
    "metatrans-shotgun")
        PARAMS=("$PATH_PROJECT" "$REPORT_LANGUAGE" "$REPORT_VERSION")
        PATH_RUN_PIPELINE="$PATH_METATRANS_SHOTGUN_PIPELINE/run_pipeline_shell.sh"
        ;;
esac


# Mostrar resumen de parámetros capturados
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
title2 "📋${TAB_4}Parámetros de ejecución capturados:"
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
info "🔹${TAB_4}Categoría Ómica: $OMICS_CATEGORY"
info "🔹${TAB_4}Análisis Específico: $ANALYSIS_TYPE"
info "🔹${TAB_4}Ruta del Proyecto: $PATH_PROJECT"
[[ -n "$EXPERIMENT_NAME" ]] && info "🔹${TAB_4}Nombre del Experimento: $EXPERIMENT_NAME"
[[ -n "$AMPLICON_TYPE" ]] && info "🔹${TAB_4}Tipo de Amplicón: $AMPLICON_TYPE"
info "🔹${TAB_4}Idioma del Report: $REPORT_LANGUAGE"
info "🔹${TAB_4}Versión del Report: $REPORT_VERSION"


# Comprobaciones de ejecución
if [ ! -f "$PATH_RUN_PIPELINE" ]; then
    error "❌${TAB_4}No se ha encontrado el script ejecutable del pipeline en:"
    error "   $PATH_RUN_PIPELINE"
    exit 1
fi

# Ajustar permisos de ejecución para el script objetivo
chmod +x "$PATH_RUN_PIPELINE"


# Construir el comando final
CMD_PIPELINE="cd \"$(dirname "$PATH_RUN_PIPELINE")\" && ./\"$(basename "$PATH_RUN_PIPELINE")\""
for p in "${PARAMS[@]}"; do
    safe_param="${p//\\/\\\\}"
    safe_param="${safe_param//\"/\\\"}"
    CMD_PIPELINE+=" \"$safe_param\""
done

echo ""
echo ""
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
title2 "⚙️${TAB_4}Ajustes antes de ejecutar el pipeline:"
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
echo "🧩${TAB_4}Comando que se ejecutará en local:"
echo "💻${TAB_4}$CMD_PIPELINE"

echo ""
echo ""
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
title2 "🚀${TAB_4}Ejecutando pipeline en entorno LOCAL..."
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
echo "⏳${TAB_4}Lanzando el pipeline. Por favor, espere..."
echo ""
echo ""

# Ejecutar el comando generado
eval "$CMD_PIPELINE"

echo ""
