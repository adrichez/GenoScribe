#!/usr/bin/env bash

set -euo pipefail


#############################################################################################################################################################
# SCRIPT PARA LANZAR LA APLICACIÓN GENOSCRIBE MEDIANTE SHINY DENTRO DE UN CONTENEDOR APPTAINER (MODALIDAD FORMULARIO)
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
title1 "🚀${TAB_4}Lanzando App GenoScribe desde la interfaz gráfica de Shiny en contenedor Apptainer"
title1 "###################################################################################################################################"
echo ""

# Configuración general
PATH_SCRIPT_RUN_APP="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$PATH_SCRIPT_RUN_APP"


# Ruta raíz del repositorio (2 niveles arriba)
PATH_REPOSITORY="$(cd "$PATH_SCRIPT_RUN_APP/../.." && pwd)"
REPOSITORY_BASENAME="$(basename "$PATH_REPOSITORY")"
PATH_REPOSITORY_CONTAINER="/workspace/$REPOSITORY_BASENAME"


# Imagen e información de contenedor
TAG="latest"
IMAGE_NAME="adrichez/genoscribe:$TAG"
CONTAINER_NAME="genoscribe-lab"
PATH_CONTAINER="$PATH_REPOSITORY/03-containers/03-apptainer/genoscribe-lab.sif"
PORT=3838


# Mostrar información de configuración
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
title2 "🛠️${TAB_4}Parámetros de configuración:"
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
info "🔹${TAB_4}Directorio del script: $PATH_SCRIPT_RUN_APP"
info "🔹${TAB_4}Ruta raíz del repositorio: $PATH_REPOSITORY"
info "🔹${TAB_4}Nombre del repositorio: $REPOSITORY_BASENAME"
info "🔹${TAB_4}Imagen Docker (origen SIF): $IMAGE_NAME"
info "🔹${TAB_4}Nombre del contenedor SIF: $CONTAINER_NAME"
info "🔹${TAB_4}Ruta del contenedor SIF: $PATH_CONTAINER"
info "🔹${TAB_4}Puerto expuesto: $PORT"


# Solicitar rutas de datos
echo ""
echo ""
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
title2 "💬${TAB_4}Antes de acceder al formulario Shiny debe proporcionar la siguiente información:"
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
read -e -p "---> Ruta a la carpeta de datos resultado del análisis: " PATH_PROJECT
PATH_PROJECT="$(echo "$PATH_PROJECT" | sed -e "s/^['\"]//" -e "s/['\"]$//")"
PATH_PROJECT_CONTAINER="/workspace/data/$(basename "$PATH_PROJECT")"
PROJECT_BASENAME="$(basename "$PATH_PROJECT")"


# Ajustar permisos de la carpeta del repositorio
if [[ -d "$PATH_REPOSITORY" && -d "$PATH_PROJECT" ]]; then
    echo ""
    echo ""
    title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
    title2 "⚙️${TAB_4}Realizando ajustes iniciales..."
    title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
    echo "🛠️${TAB_4}Ajustando permisos de la carpeta del repositorio: $REPOSITORY_BASENAME..."
    chmod -R a+rw "$PATH_REPOSITORY"
    echo "🛠️${TAB_4}Ajustando permisos de la carpeta con datos de entrada: $PROJECT_BASENAME..."
    chmod -R a+rw "$PATH_PROJECT"
    success "✅${TAB_4}Permisos ajustados correctamente"
fi


# Comprobar si el puerto está en uso
echo "⏳${TAB_4}Comprobando estado del puerto $PORT..."
if lsof -i :$PORT >/dev/null 2>&1; then
    warn "⚠️${TAB_4}Puerto $PORT en uso"

    CONTAINER_ID=$(docker ps -q --filter "publish=$PORT")
    if [ -n "$CONTAINER_ID" ]; then
        echo "🛑${TAB_4}Deteniendo contenedor que usa el puerto..."
        docker stop "$CONTAINER_ID"
        sleep 2
    else
        echo "🔒${TAB_4}Cerrando proceso que usa el puerto..."
        lsof -ti :$PORT | xargs kill -9 2>/dev/null || true
        sleep 2
    fi
    success "✅${TAB_4}Puerto $PORT liberado"
else
    success "✅${TAB_4}Puerto $PORT libre"
fi


# Comprobar la existencia de la imagen SIF
echo ""
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
title2 "📦${TAB_4}Comprobando imagen Apptainer (SIF)..."
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
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


# Definir ruta de la app dentro del contenedor
PATH_APP_CONTAINER="$PATH_REPOSITORY_CONTAINER/01-app"
PATH_APP_REPORTS_CONTAINER="$PATH_REPOSITORY_CONTAINER/01-app/www/reports"


# Crear carpeta de caché local (para Quarto/Shiny)
CACHE_DIR="$HOME/.apptainer_cache"
if [ ! -w "$HOME" ]; then
    CACHE_DIR="/tmp/${USER}_apptainer_cache"
fi
mkdir -p "$CACHE_DIR"
chmod -R 777 "$CACHE_DIR"


# Ejecutar contenedor
echo ""
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
title2 "🚀${TAB_4}Iniciando GenoScribe con Apptainer..."
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
info "📂${TAB_4}Carpeta de datos del proyecto: $PATH_PROJECT"
info "📂${TAB_4}Carpeta de la app en contenedor: $PATH_APP_CONTAINER"
important "🌐${TAB_4}Acceso local: http://localhost:$PORT/app"
info "💡${TAB_4}Si se encuentra en un cluster remoto, use port forwarding empleando el siguiente comando:"
important "💻${TAB_4}ssh -L ${PORT}:localhost:${PORT} -J ${USER}@halowan.ipb.csic.es ${USER}@$(hostname)"
important "🌐${TAB_4}Luego abra en su navegador local: http://localhost:${PORT}/"
info "⏳${TAB_4}Lanzando servidor Shiny..."


# Ejecutar la app Shiny dentro del contenedor con bind mounts para el repositorio, los datos y la caché
apptainer exec \
    -B "$PATH_PROJECT":"$PATH_PROJECT_CONTAINER" \
    -B "$PATH_REPOSITORY":"$PATH_REPOSITORY_CONTAINER" \
    -B "$CACHE_DIR":"/home/shiny/.cache" \
    "$PATH_CONTAINER" \
    bash -c "\
        Rscript -e \"suppressMessages(library(shiny)); shiny::runApp('$PATH_REPOSITORY_CONTAINER/01-app', port=$PORT, host='0.0.0.0')\" \
    "

echo ""
