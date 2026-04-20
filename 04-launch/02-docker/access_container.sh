#!/usr/bin/env bash

set -euo pipefail


#############################################################################################################################################################
# SCRIPT PARA ACCEDER AL CONTENEDOR DOCKER GENOSCRIBE
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
title1 "🚀${TAB_4}Accediendo al contenedor GenoScribe"
title1 "###################################################################################################################################"
echo ""

# Configuración de variables robusta
PATH_SCRIPT_RUN_APP="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$PATH_SCRIPT_RUN_APP"


# Definir PATH_REPOSITORY relativo al script (ruta raíz del repositorio GenoScribe)
PATH_REPOSITORY="$(cd "$PATH_SCRIPT_RUN_APP/../.." && pwd)"  # 2 niveles arriba
REPOSITORY_BASENAME="$(basename "$PATH_REPOSITORY")"


# Definir variables del contenedor
CONTAINER_NAME="genoscribe-lab"
MAX_RETRIES=5
RETRY_DELAY=1


# Imprimir información de configuración
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
title2 "🛠️${TAB_4}Parámetros de configuración:"
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
info "🔹${TAB_4}Directorio del script: $PATH_SCRIPT_RUN_APP"
info "🔹${TAB_4}Ruta raíz del proyecto: $PATH_REPOSITORY"
info "🔹${TAB_4}Nombre del proyecto: $REPOSITORY_BASENAME"
info "🔹${TAB_4}Contenedor: $CONTAINER_NAME"


# Comprobar si el contenedor existe y su estado
echo ""
echo ""
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
title2 "🐳${TAB_4}Comprobando estado del contenedor '$CONTAINER_NAME'..."
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"

if [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then
    success "✅${TAB_4}Contenedor '$CONTAINER_NAME' ya existe"

    # Comprobar si está corriendo
    if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
        echo "♻️${TAB_4}Contenedor '$CONTAINER_NAME' ya está corriendo"
        echo "🚂${TAB_4}$CONTAINER_NAME running"

    else
        warn "⚠️${TAB_4}Contenedor '$CONTAINER_NAME' está detenido"
        echo "🔄${TAB_4}Iniciando contenedor '$CONTAINER_NAME'..."
        docker start "$CONTAINER_NAME"

        # Esperar a que el contenedor esté en ejecución
        RETRIES=0
        while [ ! "$(docker ps -q -f name=$CONTAINER_NAME)" ] && [ $RETRIES -lt $MAX_RETRIES ]; do
            echo "⏳${TAB_4}Esperando a que el contenedor esté listo... (Intento $((RETRIES+1))/$MAX_RETRIES)"
            sleep $RETRY_DELAY
            RETRIES=$((RETRIES+1))
        done

        if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
            success "✅${TAB_4}Contenedor '$CONTAINER_NAME' iniciado correctamente"
        else
            error "❌${TAB_4}No se pudo iniciar el contenedor '$CONTAINER_NAME'"
            warn "🙏${TAB_4}Por favor, revisa los logs del contenedor con 'docker logs $CONTAINER_NAME'"
            echo ""
            exit 1
        fi
    fi

else
    error "❌${TAB_4}Contenedor '$CONTAINER_NAME' no existe"
    warn "🙏${TAB_4}Por favor, crea el contenedor con 'docker create' o 'docker run' primero"
    echo ""
    exit 1
fi


# Acceder al contenedor
echo ""
echo ""
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
title2 "⏳${TAB_4}Preparando acceso al contenedor..."
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
echo "💻${TAB_4}Abriendo la terminal bash en el contenedor..."
success "✅${TAB_4}Todo listo para trabajar en el contenedor"
echo ""

docker exec -it "$CONTAINER_NAME" bash


# Mostrar mensaje de despedida
echo ""
echo ""
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
title2 "🏁${TAB_4}Sesión finalizada"
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
echo "👋${TAB_4}Hasta pronto!"
echo ""
