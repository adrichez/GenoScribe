#!/usr/bin/env bash

set -euo pipefail


#############################################################################################################################################################
# SCRIPT PARA LANZAR LA APLICACIÓN GENOSCRIBE MEDIANTE SHELL DENTRO DE UN CONTENEDOR DOCKER (MODALIDAD DIRECTA)
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
# CODIGO PRINCIPAL Y PARSEO DE ARGUMENTOS
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

echo ""
title1 "###################################################################################################################################"
title1 "🚀${TAB_4}Lanzando App GenoScribe desde contenedor Docker (modo Directo)"
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
    info " -tg, --technology: Tecnología de captura (Requerido para Spatial RNA-Seq)"
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
EXPERIMENT_NAME=""
TECHNOLOGY=""
AMPLICON_TYPE=""
REPORT_LANGUAGE=""
REPORT_VERSION=""

# Parsear argumentos
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -oc|--omics_category) OMICS_CATEGORY="$2"; shift ;;
        -at|--analysis_type) ANALYSIS_TYPE="$2"; shift ;;
        -pp|--path_project) PATH_PROJECT="$2"; shift ;;
        -en|--experiment_name) EXPERIMENT_NAME="$2"; shift ;;
        -tg|--technology) TECHNOLOGY="$2"; shift ;;
        -am|--amplicon_type) AMPLICON_TYPE="$2"; shift ;;
        -rl|--report_language) REPORT_LANGUAGE="$2"; shift ;;
        -rv|--report_version) REPORT_VERSION="$2"; shift ;;
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

# Comprobar que Docker está instalado
if ! command -v docker >/dev/null 2>&1; then
    error "❌${TAB_4}Docker no está instalado o el demonio no está en ejecución."
    warn "⬇️${TAB_4}Instálelo, inicie el servicio y vuelva a intentarlo."
    echo ""
    exit 1
fi

# Configuración de variables robusta
# Cambiar al directorio donde está el script
PATH_SCRIPT_RUN_APP="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$PATH_SCRIPT_RUN_APP"


# Definir la ruta raíz y el nombre del repositorio
PATH_REPOSITORY="$(cd "$PATH_SCRIPT_RUN_APP/../.." && pwd)"  # 2 niveles arriba
REPOSITORY_BASENAME="$(basename "$PATH_REPOSITORY")"


# Definir variables de la imagen y el contenedor
TAG="latest"
IMAGE_NAME="adrichez/genoscribe:$TAG"
CONTAINER_NAME="genoscribe-lab"
PORT=3838  # para exponer Shiny si se necesitara


# Mostrar parámetros de configuración
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
title2 "🛠️${TAB_4}Parámetros de configuración:"
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
info "🔹${TAB_4}Directorio del script: $PATH_SCRIPT_RUN_APP"
info "🔹${TAB_4}Ruta raíz del repositorio: $PATH_REPOSITORY"
info "🔹${TAB_4}Nombre del repositorio: $REPOSITORY_BASENAME"
info "🔹${TAB_4}Contenedor: $CONTAINER_NAME"
info "🔹${TAB_4}Imagen: $IMAGE_NAME"
echo ""

# Determinar OMICS_ANALYSIS según OMICS_CATEGORY y ANALYSIS_TYPE
case "$OMICS_CATEGORY" in
    1)
        case "$ANALYSIS_TYPE" in
            1) OMICS_ANALYSIS="trans-bulk" ;;
            2) OMICS_ANALYSIS="trans-sc" ;;
            3) OMICS_ANALYSIS="trans-st" ;;
            *) error "❌${TAB_4}Tipo de análisis no válido para Transcriptómica. Saliendo..." ; exit 1 ;;
        esac
        ;;
    2)
        case "$ANALYSIS_TYPE" in
            1) OMICS_ANALYSIS="meta-shotgun" ;;
            2) OMICS_ANALYSIS="meta-amplicon" ;;
            *) error "❌${TAB_4}Tipo de análisis no válido para Metagenómica. Saliendo..." ; exit 1 ;;
        esac
        ;;
    3)
        case "$ANALYSIS_TYPE" in
            1) OMICS_ANALYSIS="metatrans-shotgun" ;;
            *) error "❌${TAB_4}Tipo de análisis no válido para Metatranscriptómica. Saliendo..." ; exit 1 ;;
        esac
        ;;
    *)
        error "❌${TAB_4}Categoría Ómica (OMICS_CATEGORY) no válida. Saliendo..."
        exit 1
        ;;
esac

# Procesar ruta del proyecto para el contenedor
PATH_PROJECT="$(echo "$PATH_PROJECT" | sed -e "s/^['\"]//" -e "s/['\"]$//")"
PATH_PROJECT_CONTAINER="/workspace/data/$(basename "$PATH_PROJECT")"

# Validar y asignar variables específicas según el tipo de análisis
case "$OMICS_ANALYSIS" in
    "trans-bulk")
        if [[ -z "$EXPERIMENT_NAME" ]]; then
            error "❌${TAB_4}Debe proporcionar --experiment_name (-en) para Bulk RNA-Seq."
            exit 1
        fi
        PARAMS=("$PATH_PROJECT_CONTAINER" "$EXPERIMENT_NAME" "$REPORT_LANGUAGE" "$REPORT_VERSION")
        PATH_RUN_PIPELINE_CONTAINER="/workspace/$REPOSITORY_BASENAME/02-pipelines/01-transcriptomics/01-bulk-rna-seq/run_pipeline_shell.sh"
        ;;
    "trans-sc")
        PARAMS=("$PATH_PROJECT_CONTAINER" "$REPORT_LANGUAGE" "$REPORT_VERSION")
        PATH_RUN_PIPELINE_CONTAINER="/workspace/$REPOSITORY_BASENAME/02-pipelines/01-transcriptomics/02-sc-rna-seq/run_pipeline_shell.sh"
        ;;
    "trans-st")
        if [[ -z "$TECHNOLOGY" ]]; then
            error "❌${TAB_4}Debe proporcionar --technology (-tg) para Spatial RNA-Seq."
            exit 1
        fi
        PARAMS=("$PATH_PROJECT" "$TECHNOLOGY" "$REPORT_LANGUAGE" "$REPORT_VERSION")
        PATH_RUN_PIPELINE_CONTAINER="/workspace/$REPOSITORY_BASENAME/02-pipelines/01-transcriptomics/03-st-rna-seq/run_pipeline_shell.sh"
        ;;
    "meta-amplicon")
        if [[ -z "$AMPLICON_TYPE" ]]; then
            error "❌${TAB_4}Debe proporcionar --amplicon_type (-am) para Metagenómica (Amplicones)."
            exit 1
        fi
        PARAMS=("$PATH_PROJECT_CONTAINER" "$AMPLICON_TYPE" "$REPORT_LANGUAGE" "$REPORT_VERSION")
        PATH_RUN_PIPELINE_CONTAINER="/workspace/$REPOSITORY_BASENAME/02-pipelines/02-metagenomics/02-amplicon/run_pipeline_shell.sh"
        ;;
    "meta-shotgun")
        PARAMS=("$PATH_PROJECT_CONTAINER" "$REPORT_LANGUAGE" "$REPORT_VERSION")
        PATH_RUN_PIPELINE_CONTAINER="/workspace/$REPOSITORY_BASENAME/02-pipelines/02-metagenomics/01-shotgun/run_pipeline_shell.sh"
        ;;
    "metatrans-shotgun")
        PARAMS=("$PATH_PROJECT_CONTAINER" "$REPORT_LANGUAGE" "$REPORT_VERSION")
        PATH_RUN_PIPELINE_CONTAINER="/workspace/$REPOSITORY_BASENAME/02-pipelines/03-metatranscriptomics/01-shotgun/run_pipeline_shell.sh"
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
[[ -n "$TECHNOLOGY" ]] && info "🔹${TAB_4}Tecnología de captura: $TECHNOLOGY"
[[ -n "$AMPLICON_TYPE" ]] && info "🔹${TAB_4}Tipo de Amplicón: $AMPLICON_TYPE"
info "🔹${TAB_4}Idioma del Report: $REPORT_LANGUAGE"
info "🔹${TAB_4}Versión del Report: $REPORT_VERSION"


# Ajustar permisos de la carpeta del repositorio
if [[ -d "$PATH_REPOSITORY" && -d "$PATH_PROJECT" ]]; then
    echo ""
    echo ""
    title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
    title2 "⚙️${TAB_4}Realizando ajustes iniciales..."
    title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
    echo "🛠️${TAB_4}Ajustando permisos de la carpeta del repositorio $REPOSITORY_BASENAME..."
    chmod -R a+rw "$PATH_REPOSITORY"
    echo "🛠️${TAB_4}Ajustando permisos de la carpeta con datos de entrada $PATH_PROJECT..."
    chmod -R a+rw "$PATH_PROJECT"
    success "✅${TAB_4}Permisos ajustados correctamente"
fi


# Comprobar si el puerto está en uso
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
fi


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
    success "✅${TAB_4}Contenedor '$CONTAINER_NAME' ya existe"

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


# Comprobar que el repositorio existe dentro del contenedor
docker exec -it "$CONTAINER_NAME" bash -c "[ -d /workspace/$REPOSITORY_BASENAME ] || echo '❌${TAB_4}Repositorio no encontrado dentro del contenedor!'"


# Asegurarse de que el script del pipeline tenga permisos de ejecución
docker exec -it "$CONTAINER_NAME" bash -c "chmod +x \"$PATH_RUN_PIPELINE_CONTAINER\""


# Construir el comando a ejecutar dentro del contenedor
CMD_PIPELINE="cd \"$(dirname "$PATH_RUN_PIPELINE_CONTAINER")\" && ./\"$(basename "$PATH_RUN_PIPELINE_CONTAINER")\""
for p in "${PARAMS[@]}"; do
    # Escapar comillas dobles y backslashes dentro del parámetro
    safe_param="${p//\\/\\\\}"   # primero escapamos backslashes
    safe_param="${safe_param//\"/\\\"}"  # luego escapamos comillas dobles
    CMD_PIPELINE+=" \"$safe_param\""
done

echo ""
echo ""
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
title2 "🚀${TAB_4}Ejecutando pipeline dentro de Docker..."
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
echo "🧩${TAB_4}Comando interno:"
echo "💻${TAB_4}$CMD_PIPELINE"
echo ""

docker exec -it "$CONTAINER_NAME" bash -c "$CMD_PIPELINE"

echo ""
