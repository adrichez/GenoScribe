#!/usr/bin/env bash

set -euo pipefail


#############################################################################################################################################################
# SCRIPT GLOBAL PARA LA LIMPIEZA DE PIPELINES Y RESULTADOS GENERADOS DIRECTAMENTE EN SU MÁQUINA LOCAL
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
title1 "🚀${TAB_4}Script global para la limpieza de pipelines y resultados generados"
title1 "###################################################################################################################################"
echo ""


# Configuración de variables robusta
# Cambiar al directorio donde está el script
PATH_SCRIPT_RUN_APP="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$PATH_SCRIPT_RUN_APP"


# Definir la ruta raíz y el nombre del repositorio
PATH_REPOSITORY="$(cd "$PATH_SCRIPT_RUN_APP/../.." && pwd)"  # 2 niveles arriba
REPOSITORY_BASENAME="$(basename "$PATH_REPOSITORY")"

title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
title2 "🛠️${TAB_4}Parámetros de configuración:"
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
info "🔹${TAB_4}Directorio del script: $PATH_SCRIPT_RUN_APP"
info "🔹${TAB_4}Ruta raíz del repositorio: $PATH_REPOSITORY"
info "🔹${TAB_4}Nombre del repositorio: $REPOSITORY_BASENAME"


# Función para ejecutar un run_cleaning_dir.sh dado un directorio
run_clean() {
    local path_pipeline="$1"
    if [ -f "$path_pipeline/run_cleaning_dir.sh" ]; then
        echo ""
        echo ""
        title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
        title2 "🚀${TAB_4}Ejecutando limpieza para el pipeline: $(basename "$path_pipeline")"
        title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
        chmod +x "$path_pipeline/run_cleaning_dir.sh"
        bash "$path_pipeline/run_cleaning_dir.sh"
    else
        warn "⚠️${TAB_4}No se encontró run_cleaning_dir.sh en $path_pipeline"
    fi
}


# Directorios de pipelines con rutas absolutas actualizadas
PATH_TRANSCRIPTOMICS="$PATH_REPOSITORY/02-pipelines/01-transcriptomics"
PATH_METAGENOMICS="$PATH_REPOSITORY/02-pipelines/02-metagenomics"
PATH_METATRANSCRIPTOMICS="$PATH_REPOSITORY/02-pipelines/03-metatranscriptomics"

PATH_TRANS_BULK_PIPELINE="$PATH_TRANSCRIPTOMICS/01-bulk-rna-seq"
PATH_TRANS_SC_PIPELINE="$PATH_TRANSCRIPTOMICS/02-sc-rna-seq"
PATH_TRANS_ST_PIPELINE="$PATH_TRANSCRIPTOMICS/03-st-rna-seq"

PATH_METAGEN_SHOTGUN_PIPELINE="$PATH_METAGENOMICS/01-shotgun"
PATH_METAGEN_AMPLICON_PIPELINE="$PATH_METAGENOMICS/02-amplicon"

PATH_METATRANS_SHOTGUN_PIPELINE="$PATH_METATRANSCRIPTOMICS/01-shotgun"


# Menú interactivo - Nivel 1: Categoría Ómica
echo ""
echo ""
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
title2 "💬${TAB_4}Responda a las siguientes preguntas para determinar qué directorios desea limpiar:"
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
echo ""
title3 "📄${TAB_4}¿Qué categoría ómica desea limpiar?:"
title3 "========================================"
echo "1) Transcriptómica"
echo "2) Metagenómica"
echo "3) Metatranscriptómica"
echo "4) Todas las anteriores (Limpieza total)"
read -rp "---> Ingrese el número de la opción (1-4): " cat_opcion
echo ""

case "$cat_opcion" in
    1)
        # Menú interactivo - Nivel 2: Transcriptómica
        title3 "📄${TAB_4}¿Qué análisis de Transcriptómica desea limpiar?"
        title3 "==================================================="
        echo "1) Bulk RNA-Seq"
        echo "2) Single Cell RNA-Seq"
        echo "3) Transcriptómica Espacial"
        echo "4) Todos los análisis de Transcriptómica"
        read -rp "---> Ingrese el número de la opción (1-4): " sub_opcion
        echo ""
        case "$sub_opcion" in
            1) run_clean "$PATH_TRANS_BULK_PIPELINE" ;;
            2) run_clean "$PATH_TRANS_SC_PIPELINE" ;;
            3) run_clean "$PATH_TRANS_ST_PIPELINE" ;;
            4)
                run_clean "$PATH_TRANS_BULK_PIPELINE"
                run_clean "$PATH_TRANS_SC_PIPELINE"
                run_clean "$PATH_TRANS_ST_PIPELINE"
                ;;
            *) error "❌${TAB_4}Opción no válida. Saliendo..." ; exit 1 ;;
        esac
        ;;
    2)
        # Menú interactivo - Nivel 2: Metagenómica
        title3 "📄${TAB_4}¿Qué análisis de Metagenómica desea limpiar?"
        title3 "================================================"
        echo "1) Shotgun"
        echo "2) Amplicones"
        echo "3) Todos los análisis de Metagenómica"
        read -rp "---> Ingrese el número de la opción (1-3): " sub_opcion
        echo ""
        case "$sub_opcion" in
            1) run_clean "$PATH_METAGEN_SHOTGUN_PIPELINE" ;;
            2) run_clean "$PATH_METAGEN_AMPLICON_PIPELINE" ;;
            3)
                run_clean "$PATH_METAGEN_SHOTGUN_PIPELINE"
                run_clean "$PATH_METAGEN_AMPLICON_PIPELINE"
                ;;
            *) error "❌${TAB_4}Opción no válida. Saliendo..." ; exit 1 ;;
        esac
        ;;
    3)
        # Menú interactivo - Nivel 2: Metatranscriptómica
        title3 "📄${TAB_4}¿Qué análisis de Metatranscriptómica desea limpiar?"
        title3 "======================================================="
        echo "1) Shotgun"
        echo "2) Todos los análisis de Metatranscriptómica"
        read -rp "---> Ingrese el número de la opción (1-2): " sub_opcion
        echo ""
        case "$sub_opcion" in
            1|2) run_clean "$PATH_METATRANS_SHOTGUN_PIPELINE" ;;
            *) error "❌${TAB_4}Opción no válida. Saliendo..." ; exit 1 ;;
        esac
        ;;
    4)
        # Limpieza total de todo
        run_clean "$PATH_TRANS_BULK_PIPELINE"
        run_clean "$PATH_TRANS_SC_PIPELINE"
        run_clean "$PATH_TRANS_ST_PIPELINE"
        run_clean "$PATH_METAGEN_SHOTGUN_PIPELINE"
        run_clean "$PATH_METAGEN_AMPLICON_PIPELINE"
        run_clean "$PATH_METATRANS_SHOTGUN_PIPELINE"
        ;;
    *)
        error "❌${TAB_4}Opción no válida. Saliendo..."
        exit 1
        ;;
esac


echo ""
echo ""
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
title2 "🎉${TAB_4}Limpieza finalizada"
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
success "✅${TAB_4}Directorios relucientes"
echo "🏁${TAB_4}Proceso finalizado"
echo "👋${TAB_4}Hasta pronto!"
echo ""
