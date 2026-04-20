#!/usr/bin/env bash

set -euo pipefail


#############################################################################################################################################################
# SCRIPT GLOBAL PARA LA LIMPIEZA DE PIPELINES Y RESULTADOS GENERADOS EMPLEANDO UN CONTENEDOR APPTAINER
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
title1 "🚀${TAB_4}Iniciando contenedor GenoScribe para limpieza de datos (Apptainer)"
title1 "###################################################################################################################################"
echo ""

# Configuración de variables robusta
# Cambiar al directorio donde está el script
PATH_SCRIPT_RUN_CLEANING="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$PATH_SCRIPT_RUN_CLEANING"


# Definir la ruta raíz y el nombre del repositorio
PATH_REPOSITORY="$(cd "$PATH_SCRIPT_RUN_CLEANING/../.." && pwd)"  # 2 niveles arriba
REPOSITORY_BASENAME="$(basename "$PATH_REPOSITORY")"


# Definir variables del contenedor
CONTAINER_NAME="genoscribe-lab"
PATH_CONTAINER="$PATH_REPOSITORY/03-containers/03-apptainer/${CONTAINER_NAME}.sif"


# Mostrar información de configuración
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
title2 "🛠️${TAB_4}Parámetros de configuración:"
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
info "🔹${TAB_4}Directorio del script: $PATH_SCRIPT_RUN_CLEANING"
info "🔹${TAB_4}Ruta raíz del repositorio: $PATH_REPOSITORY"
info "🔹${TAB_4}Nombre del repositorio: $REPOSITORY_BASENAME"
info "🔹${TAB_4}Nombre del contenedor SIF: $CONTAINER_NAME"
info "🔹${TAB_4}Ruta del contenedor SIF: $PATH_CONTAINER"


# Comprobar existencia de la SIF
echo ""
echo ""
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
title2 "📦${TAB_4}Comprobando imagen Apptainer (SIF)..."
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
# Comprobar la existencia de la imagen SIF
if [ -f "$PATH_CONTAINER" ]; then
    success "✅${TAB_4}Archivo $CONTAINER_NAME.sif encontrado en la ruta esperada: $PATH_CONTAINER"
else
    warn "⚠️${TAB_4}Archivo $CONTAINER_NAME.sif no encontrado en la ruta esperada: $PATH_CONTAINER"
    echo "⬇️${TAB_4}Intentando descargarlo usando apptainer pull desde docker://$IMAGE_NAME ..."
    # Crear carpeta destino si no existe
    DIR_CONTAINER="$(dirname "$PATH_CONTAINER")"
    mkdir -p "$DIR_CONTAINER"
    # Intentar tirar del Docker image y convertir a SIF
    if apptainer pull "$PATH_CONTAINER" "docker://$IMAGE_NAME"; then
        success "✅${TAB_4}Archivo $CONTAINER_NAME descargado correctamente en la ruta: $PATH_CONTAINER"
    else
        error "❌${TAB_4}Falló la descarga desde docker://$IMAGE_NAME"
        warn "⚠️${TAB_4}Compruebe que tiene acceso al repositorio o que el nombre de la imagen es correcto"
        echo ""
        exit 1
    fi
fi


# Definir ruta del script de limpieza dentro del contenedor
echo ""
echo ""
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
title2 "🐳${TAB_4}Preparando ejecución dentro del contenedor Apptainer..."
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
PATH_SCRIPT_RUN_CLEANING_CONTAINER="/workspace/$REPOSITORY_BASENAME/04-launch/01-local/run_cleaning.sh"
echo "⏳${TAB_4}Abriendo la terminal bash dentro del contenedor..."
success "✅${TAB_4}Todo listo para trabajar en el contenedor"
echo ""
echo ""


# Ejecutar script de limpieza dentro de la SIF con bind mount del repositorio
apptainer exec \
    -B "$PATH_REPOSITORY:/workspace/$REPOSITORY_BASENAME" \
    "$PATH_CONTAINER" \
    bash -c "chmod +x '$PATH_SCRIPT_RUN_CLEANING_CONTAINER' && '$PATH_SCRIPT_RUN_CLEANING_CONTAINER'"
