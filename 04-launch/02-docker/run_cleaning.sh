#!/usr/bin/env bash

set -euo pipefail


#############################################################################################################################################################
# SCRIPT GLOBAL PARA LA LIMPIEZA DE PIPELINES Y RESULTADOS GENERADOS EMPLEANDO UN CONTENEDOR DOCKER
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
title2 "###################################################################################################################################"
title2 "🚀${TAB_4}Iniciando contenedor GenoScribe para limpieza de datos"
title2 "###################################################################################################################################"
echo ""


# Configuración de variables robusta
# Cambiar al directorio donde está el script
PATH_SCRIPT_RUN_APP="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$PATH_SCRIPT_RUN_APP"


# Definir la ruta raíz y el nombre del repositorio
PATH_REPOSITORY="$(cd "$PATH_SCRIPT_RUN_APP/../.." && pwd)"  # 2 niveles arriba
REPOSITORY_BASENAME="$(basename "$PATH_REPOSITORY")"

CONTAINER_NAME="genoscribe-lab"
MAX_RETRIES=5
RETRY_DELAY=1


# Mostrar información de configuración
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
title2 "🛠️${TAB_4}Parámetros de configuración:"
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
info "🔹${TAB_4}Directorio del script: $PATH_SCRIPT_RUN_APP"
info "🔹${TAB_4}Ruta raíz del repositorio: $PATH_REPOSITORY"
info "🔹${TAB_4}Nombre del repositorio: $REPOSITORY_BASENAME"
info "🔹${TAB_4}Contenedor: $CONTAINER_NAME"


echo ""
echo ""
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
title2 "🐳${TAB_4}Comprobando estado del contenedor '$CONTAINER_NAME'..."
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"


# Verificar si el contenedor ya está en ejecución
if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
    success "✅${TAB_4}El contenedor '$CONTAINER_NAME' ya está en ejecución"
    echo "🚂${TAB_4}$CONTAINER_NAME running"


# Verificar si el contenedor existe pero está detenido
elif [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then
    warn "⚠️${TAB_4}El contenedor '$CONTAINER_NAME' existe pero está detenido"
    echo "⚙️${TAB_4}Iniciándolo..."
    docker start "$CONTAINER_NAME"

    # Bucle para esperar hasta que el contenedor esté en estado "running"
    RETRIES=0
    while [ ! "$(docker ps -q -f name=$CONTAINER_NAME)" ] && [ $RETRIES -lt $MAX_RETRIES ]; do
        echo "⏳${TAB_4}Esperando a que el contenedor esté listo... (Intento $((RETRIES+1))/$MAX_RETRIES)"
        sleep $RETRY_DELAY
        RETRIES=$((RETRIES+1))
    done

    # Si el bucle termina y el contenedor no está running, mostramos un error
    if [ ! "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
        error "❌${TAB_4}No se pudo iniciar el contenedor '$CONTAINER_NAME' a tiempo"
        warn "🙏${TAB_4}Por favor, revisa los logs del contenedor con 'docker logs $CONTAINER_NAME'"
        echo ""
        exit 1
    fi

else
    # El contenedor no existe
    error "❌${TAB_4}El contenedor '$CONTAINER_NAME' no existe"
    warn "🙏${TAB_4}Por favor, crea el contenedor con 'docker create' o 'docker run' primero"
    echo ""
    exit 1
fi


# Definir ruta del script de limpieza dentro del contenedor
PATH_SCRIPT_RUN_CLEANING_CONTAINER="/workspace/$REPOSITORY_BASENAME/04-launch/01-local/run_cleaning.sh"

echo "⏳${TAB_4}Abriendo la terminal bash en el contenedor..."
success "✅${TAB_4}Todo listo para trabajar en el contenedor"
echo ""


# Ejecutar script de limpieza dentro del contenedor
docker exec -it "$CONTAINER_NAME" bash -c "chmod +x '$PATH_SCRIPT_RUN_CLEANING_CONTAINER' && '$PATH_SCRIPT_RUN_CLEANING_CONTAINER'"
