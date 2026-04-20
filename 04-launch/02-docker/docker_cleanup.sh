#!/usr/bin/env bash

set -euo pipefail


#############################################################################################################################################################
# SCRIPT GLOBAL PARA LA LIMPIEZA DE CONTENEDORES E IMÁGENES DOCKER
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
title1 "🧹${TAB_4}Limpieza de contenedores e imágenes Docker"
title1 "###################################################################################################################################"
echo ""


# Variables
CONTAINER_NAME="genoscribe-lab"
IMAGE_NAME="adrichez/genoscribe:latest"

title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
title2 "📄${TAB_4}Preguntas relativas al contenedor..."
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
echo ""
title3 "⚙️${TAB_4}Realizando comprobaciones..."
title3 "================================="
echo "🐳${TAB_4}Comprobando si el contenedor '$CONTAINER_NAME' existe..."
if [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then
    echo "✅${TAB_4}Contenedor '$CONTAINER_NAME' detectado"

    echo ""
    echo ""
    title3 "======================================================"
    title3 "💬${TAB_4}¿Quiere detener el contenedor '$CONTAINER_NAME'?"
    title3 "======================================================"
    read -e -p "---> Elige una opción (s/n): " STOP_CONT
    if [[ "$STOP_CONT" =~ ^[Ss]$ ]]; then
        echo "🛑${TAB_4}Deteniendo contenedor '$CONTAINER_NAME'..."
        docker stop "$CONTAINER_NAME"
        echo "✅${TAB_4}Contenedor detenido"
    else
        echo "⏭️${TAB_4}Se mantiene en ejecución"
    fi

    echo ""
    echo ""
    title3 "======================================================="
    title3 "💬${TAB_4}¿Quiere eliminar el contenedor '$CONTAINER_NAME'?"
    title3 "======================================================="
    read -e -p "---> Elige una opción (s/n): " RM_CONT
    if [[ "$RM_CONT" =~ ^[Ss]$ ]]; then
        echo "🗑️${TAB_4}Eliminando contenedor '$CONTAINER_NAME'..."
        docker rm "$CONTAINER_NAME" >/dev/null 2>&1 || true
        success "✅${TAB_4}Contenedor eliminado"
    else
        echo "⏭️${TAB_4}Contenedor no eliminado"
    fi

else
    echo "ℹ️${TAB_4}Contenedor '$CONTAINER_NAME' no encontrado"
fi


echo ""
echo ""
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
title2 "📄${TAB_4}Preguntas relativas a la imagen..."
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
echo ""
title3 "⚙️${TAB_4}Realizando comprobaciones..."
title3 "================================="
echo "🐳${TAB_4}Comprobando si la imagen '$IMAGE_NAME' existe..."
if [ "$(docker images -q $IMAGE_NAME)" ]; then
    success "✅${TAB_4}Imagen '$IMAGE_NAME' detectada"
    echo ""
    echo ""
    title3 "=============================================================="
    title3 "💬${TAB_4}¿Quiere eliminar la imagen '$IMAGE_NAME'?"
    title3 "=============================================================="
    read -e -p "---> Elige una opción (s/n): " RM_IMAGE
    if [[ "$RM_IMAGE" =~ ^[Ss]$ ]]; then
        echo "🗑️${TAB_4}Eliminando imagen '$IMAGE_NAME'..."
        docker rmi "$IMAGE_NAME" >/dev/null 2>&1 || true
        success "✅${TAB_4}Imagen eliminada"
    else
        echo "⏭️${TAB_4}Imagen no eliminada"
    fi
else
    echo "ℹ️${TAB_4}Imagen '$IMAGE_NAME' no encontrada"
fi


# Mostrar mensaje de despedida
echo ""
echo ""
title2 "🏁${TAB_4}Limpieza finalizada"
title2 "========================"
echo "👋${TAB_4}Hasta pronto!"
echo ""
