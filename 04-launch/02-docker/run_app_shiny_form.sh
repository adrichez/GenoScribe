#!/usr/bin/env bash

set -euo pipefail


#############################################################################################################################################################
# SCRIPT PARA LANZAR LA APLICACIÓN GENOSCRIBE MEDIANTE SHINY DENTRO DE UN CONTENEDOR DOCKER (MODALIDAD FORMULARIO)
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
title1 "🚀${TAB_4}Lanzando App GenoScribe desde la interfaz gráfica de Shiny en contenedor Docker"
title1 "###################################################################################################################################"
echo ""


# Configuración de variables robusta
# Cambiar al directorio donde está el script
PATH_SCRIPT_RUN_APP="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$PATH_SCRIPT_RUN_APP"


# Definir la ruta raíz y el nombre del repositorio
PATH_REPOSITORY="$(cd "$PATH_SCRIPT_RUN_APP/../.." && pwd)"  # 2 niveles arriba
REPOSITORY_BASENAME="$(basename "$PATH_REPOSITORY")"
PATH_REPOSITORY_CONTAINER="/workspace/$REPOSITORY_BASENAME"


# Definir variables de la imagen y el contenedor
TAG="latest"
IMAGE_NAME="adrichez/genoscribe:$TAG"
CONTAINER_NAME="genoscribe-lab"
PORT=3838


# Mostrar parámetros de configuración
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
title2 "🛠️${TAB_4}Parámetros de configuración:"
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
info "🔹 Directorio del script: $PATH_SCRIPT_RUN_APP"
info "🔹 Ruta raíz del repositorio: $PATH_REPOSITORY"
info "🔹 Nombre del repositorio: $REPOSITORY_BASENAME"
info "🔹 Contenedor: $CONTAINER_NAME"
info "🔹 Imagen: $IMAGE_NAME"


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


# Definir ruta de la app dentro del contenedor
PATH_APP_CONTAINER="$PATH_REPOSITORY_CONTAINER/01-app"
PATH_APP_REPORTS_CONTAINER="$PATH_REPOSITORY_CONTAINER/01-app/www/reports"

echo ""
echo ""
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
title2 "🚀${TAB_4}Iniciando GenoScribe..."
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
important "📂${TAB_4}Ruta de la carpeta con los datos del proyecto: $PATH_PROJECT"
important "📂${TAB_4}Puede visualizar el informe generado en la ruta de la app: $PATH_APP_REPORTS_CONTAINER/{categoria_omica}/{tipo_analisis}"
important "📂${TAB_4}Así como en la ruta del propio pipeline: $PATH_REPOSITORY_CONTAINER/02-pipelines/{categoria_omica}/{tipo_analisis}/report"
important "🌐${TAB_4}La app estará disponible en: http://localhost:$PORT/app"


# Comprobar contenedor e imagen
echo ""
echo ""
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
title2 "🐳${TAB_4}Comprobando contenedor e imagen..."
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"


# Si no existe la imagen local, descargar de Docker Hub
if ! docker image inspect "$IMAGE_NAME" >/dev/null 2>&1; then
    warn "⚠️${TAB_4}Imagen '$IMAGE_NAME' no encontrada localmente"
    echo "⬇️${TAB_4}Descargando imagen '$IMAGE_NAME' de Docker Hub..."
    docker pull "$IMAGE_NAME"
fi


# Comprobar si el contenedor existe
if [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then
    echo "✅${TAB_4}Contenedor '$CONTAINER_NAME' ya existe"

    # Comprobar si el contenedor está corriendo
    if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
        success "♻️${TAB_4}Contenedor '$CONTAINER_NAME' ya está corriendo"
        echo "🚂${TAB_4}$CONTAINER_NAME running"

    else
        warn "⚠️${TAB_4}Contenedor '$CONTAINER_NAME' está detenido"
        echo "🔄${TAB_4}Iniciando contenedor '$CONTAINER_NAME'..."
        docker start "$CONTAINER_NAME"

        # Esperar a que el contenedor esté en ejecución
        RETRIES=0
        MAX_RETRIES=5
        RETRY_DELAY=2
        while [ ! "$(docker ps -q -f name=$CONTAINER_NAME)" ] && [ $RETRIES -lt $MAX_RETRIES ]; do
            echo "⏳${TAB_4}Esperando a que el contenedor esté listo... (Intento $((RETRIES+1))/$MAX_RETRIES)"
            sleep $RETRY_DELAY
            RETRIES=$((RETRIES+1))
        done

        if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
            success "✅${TAB_4}Contenedor '$CONTAINER_NAME' iniciado correctamente"
        else
            error "❌${TAB_4}No se pudo iniciar el contenedor '$CONTAINER_NAME'"
            echo ""
            exit 1
        fi
    fi

else
    warn "⚠️${TAB_4}Contenedor '$CONTAINER_NAME' no existe"
    echo "🆕${TAB_4}Creando e iniciando contenedor '$CONTAINER_NAME'..."
    docker run -d --name "$CONTAINER_NAME" \
        -p $PORT:3838 \
        -v "$PATH_PROJECT":"$PATH_PROJECT_CONTAINER" \
        -v "$PATH_REPOSITORY":"/workspace/$REPOSITORY_BASENAME" \
        "$IMAGE_NAME"

    # Esperar a que el contenedor arranque
    sleep 2
    success "✅${TAB_4}Contenedor '$CONTAINER_NAME' creado e iniciado"
fi


# FIX: asegurar /home/shiny/.cache/quarto dentro del contenedor
echo "🧩${TAB_4}Comprobando y corrigiendo permisos de /home/shiny/.cache/quarto..."
docker exec "$CONTAINER_NAME" bash -c "mkdir -p /home/shiny/.cache/quarto && chmod -R 777 /home/shiny/.cache"
success "✅${TAB_4}Directorio /home/shiny/.cache/quarto preparado correctamente"


# Comprobar que el repositorio existe dentro del contenedor
docker exec -it "$CONTAINER_NAME" bash -c "[ -d /workspace/$REPOSITORY_BASENAME ] || echo '❌${TAB_4}Repositorio no encontrado dentro del contenedor!'"


# Esperar hasta que Shiny responda
until curl -s "http://localhost:$PORT/app" >/dev/null; do
    sleep 1
done

echo ""
echo ""
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
title2 "🏁${TAB_4}Servidor listo"
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
important "🌐${TAB_4}Abriendo navegador en: http://localhost:$PORT/app"
echo ""


# Abrir navegador según sistema
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    xdg-open "http://localhost:$PORT/app"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    open "http://localhost:$PORT/app"
elif [[ "$OSTYPE" == "msys" ]]; then
    start "http://localhost:$PORT/app"
fi

echo ""
