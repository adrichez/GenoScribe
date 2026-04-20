#!/usr/bin/env bash

set -euo pipefail


#############################################################################################################################################################
# SCRIPT PARA LANZAR LA APLICACIÓN GENOSCRIBE MEDIANTE SHELL DENTRO DE UN CONTENEDOR APPTAINER (MODALIDAD DIRECTA)
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
title1 "🚀${TAB_4}Lanzando App GenoScribe desde contenedor Apptainer (modo Directo/CLI)"
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
REPORT_VERSION=""
REPORT_LANGUAGE=""
EXPERIMENT_NAME=""
AMPLICON_TYPE=""

# Parsear argumentos
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -oc|--omics_category) OMICS_CATEGORY="$2"; shift ;;
        -at|--analysis_type) ANALYSIS_TYPE="$2"; shift ;;
        -pp|--path_project) PATH_PROJECT="$2"; shift ;;
        -rv|--report_version) REPORT_VERSION="$2"; shift ;;
        -rl|--report_language) REPORT_LANGUAGE="$2"; shift ;;
        -en|--experiment_name) EXPERIMENT_NAME="$2"; shift ;;
        -am|--amplicon_type) AMPLICON_TYPE="$2"; shift ;;
        -h|--help) usage ;;
        *) error "❌${TAB_4}Parámetro desconocido: $1"; usage ;;
    esac
    shift
done

# Validar parámetros obligatorios generales
if [[ -z "$OMICS_CATEGORY" || -z "$ANALYSIS_TYPE" || -z "$PATH_PROJECT" || -z "$REPORT_VERSION" || -z "$REPORT_LANGUAGE" ]]; then
    error "❌${TAB_4}Faltan parámetros obligatorios (-oc, -at, -pp, -rv, -rl)."
    echo ""
    usage
fi

# Comprobar que apptainer/singularity está disponible
if ! command -v apptainer >/dev/null 2>&1; then
    error "❌${TAB_4}Apptainer no está instalado o no está en PATH."
    warn "⬇️${TAB_4}Instálelo o cargue el módulo correspondiente y vuelva a intentarlo."
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


# Definir variables de la imagen/apptainer
TAG="latest"
IMAGE_NAME="adrichez/genoscribe:$TAG"   # sólo informativo (usado si hay que tirar de docker://)
CONTAINER_NAME="genoscribe-lab"         # nombre informativo
PORT=3838  # para exponer Shiny si se necesitara


# Ruta SIF esperada (relativa a la ubicación del script)
PATH_REL_CONTAINER="../../03-containers/03-apptainer/genoscribe-lab.sif"
PATH_CONTAINER="$(cd "$(dirname "$PATH_SCRIPT_RUN_APP/$PATH_REL_CONTAINER")" >/dev/null 2>&1 && pwd)/$(basename "$PATH_REL_CONTAINER")"


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


# Procesar ruta del proyecto para el contenedor (limpiar comillas y extraer el basename para bind mount)
PATH_PROJECT="$(echo "$PATH_PROJECT" | sed -e "s/^['\"]//" -e "s/['\"]$//")"
PATH_PROJECT_CONTAINER="/workspace/data/$(basename "$PATH_PROJECT")"


# Validar y asignar variables específicas según el tipo de análisis
case "$OMICS_ANALYSIS" in
    "trans-bulk")
        if [[ -z "$EXPERIMENT_NAME" ]]; then
            error "❌${TAB_4}Debe proporcionar --experiment_name (-en) para Bulk RNA-Seq."
            exit 1
        fi
        PARAMS=("$PATH_PROJECT_CONTAINER" "$EXPERIMENT_NAME" "$REPORT_VERSION" "$REPORT_LANGUAGE")
        PATH_RUN_PIPELINE_CONTAINER="/workspace/$REPOSITORY_BASENAME/02-pipelines/01-transcriptomics/01-bulk-rna-seq/run_pipeline_shell.sh"
        ;;
    "trans-sc")
        PARAMS=("$PATH_PROJECT_CONTAINER" "$REPORT_VERSION" "$REPORT_LANGUAGE")
        PATH_RUN_PIPELINE_CONTAINER="/workspace/$REPOSITORY_BASENAME/02-pipelines/01-transcriptomics/02-sc-rna-seq/run_pipeline_shell.sh"
        ;;
    "trans-st")
        PARAMS=("$PATH_PROJECT_CONTAINER" "$REPORT_VERSION" "$REPORT_LANGUAGE")
        PATH_RUN_PIPELINE_CONTAINER="/workspace/$REPOSITORY_BASENAME/02-pipelines/01-transcriptomics/03-st-rna-seq/run_pipeline_shell.sh"
        ;;
    "meta-amplicon")
        if [[ -z "$AMPLICON_TYPE" ]]; then
            error "❌${TAB_4}Debe proporcionar --amplicon_type (-am) para Metagenómica (Amplicones)."
            exit 1
        fi
        PARAMS=("$PATH_PROJECT_CONTAINER" "$AMPLICON_TYPE" "$REPORT_VERSION" "$REPORT_LANGUAGE")
        PATH_RUN_PIPELINE_CONTAINER="/workspace/$REPOSITORY_BASENAME/02-pipelines/02-metagenomics/02-amplicon/run_pipeline_shell.sh"
        ;;
    "meta-shotgun")
        PARAMS=("$PATH_PROJECT_CONTAINER" "$REPORT_VERSION" "$REPORT_LANGUAGE")
        PATH_RUN_PIPELINE_CONTAINER="/workspace/$REPOSITORY_BASENAME/02-pipelines/02-metagenomics/01-shotgun/run_pipeline_shell.sh"
        ;;
    "metatrans-shotgun")
        PARAMS=("$PATH_PROJECT_CONTAINER" "$REPORT_VERSION" "$REPORT_LANGUAGE")
        PATH_RUN_PIPELINE_CONTAINER="/workspace/$REPOSITORY_BASENAME/02-pipelines/03-metatranscriptomics/01-shotgun/run_pipeline_shell.sh"
        ;;
esac

# Mostrar resumen de parámetros capturados
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
title2 "📋${TAB_4}Parámetros de ejecución capturados:"
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
info "🔹${TAB_4}Categoría Ómica: $OMICS_CATEGORY"
info "🔹${TAB_4}Tipo de Análisis: $ANALYSIS_TYPE"
info "🔹${TAB_4}Análisis Específico: $OMICS_ANALYSIS"
info "🔹${TAB_4}Ruta del Proyecto: $PATH_PROJECT"
[[ -n "$EXPERIMENT_NAME" ]] && info "🔹${TAB_4}Nombre del Experimento: $EXPERIMENT_NAME"
[[ -n "$AMPLICON_TYPE" ]] && info "🔹${TAB_4}Tipo de Amplicón: $AMPLICON_TYPE"
info "🔹${TAB_4}Idioma del Report: $REPORT_LANGUAGE"
info "🔹${TAB_4}Versión del Report: $REPORT_VERSION"


# Ajustar permisos de la carpeta del repositorio
if [[ -d "$PATH_REPOSITORY" && -d "${PATH_PROJECT:-}" ]]; then
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

    # Intentar cerrar el proceso que ocupa el puerto
    echo "🔒${TAB_4}Cerrando proceso que usa el puerto..."
    lsof -ti :$PORT | xargs kill -9 2>/dev/null || true
    sleep 2

    success "✅${TAB_4}Puerto $PORT liberado"
fi


# Comprobar la existencia de la imagen SIF
echo ""
echo ""
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
title2 "📦${TAB_4}Comprobando imagen Apptainer (SIF)..."
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
if [ -f "$PATH_CONTAINER" ]; then
    success "✅ Archivo $CONTAINER_NAME.sif encontrado en la ruta esperada: $PATH_CONTAINER"
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


# Nota sobre estado 'persistente' del contenedor:
note "ℹ️${TAB_4}Apptainer ejecuta la imagen SIF directamente (no crea contenedores persistentes como Docker)"
note "ℹ️${TAB_4}Se ejecutará el pipeline dentro de la SIF y usaremos bind mounts para persistencia de datos"


# Comprobar que la ruta del repositorio estará disponible dentro del contenedor (mediante bind)
echo "🔗${TAB_4}Preparando binds y comprobaciones..."


# Asegurarse de que el script del pipeline tenga permisos de ejecución en el host (será bind-mounted)
if [ -f "$PATH_REPOSITORY/02-pipelines" ] || true; then
    # chmod en el host para que quede ejecutable cuando se bindee en el contenedor
    if [ -f "$PATH_REPOSITORY${PATH_RUN_PIPELINE_CONTAINER#/workspace}" ]; then
        chmod -x 2>/dev/null || true
    fi
fi


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
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
title2 "⚙️${TAB_4}Ajustes antes de ejecutar el pipeline:"
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"

echo "🧩${TAB_4}Comando que se ejecutará dentro de la SIF:"
echo "💻${TAB_4}$CMD_PIPELINE"


# Ejecutar: primero comprobar que el repositorio estará bind-mounted; luego chmod +x y ejecutar pipeline
# Usamos -B (bind) para montar PATH_PROJECT y PATH_REPOSITORY
BIND_OPTS=()
# Asegurarnos de que PATH_PROJECT esté definido
if [[ -n "${PATH_PROJECT:-}" && -d "$PATH_PROJECT" ]]; then
    BIND_OPTS+=("-B" "$PATH_PROJECT":"$PATH_PROJECT_CONTAINER")
else
    # Si no existe la carpeta de datos en host, informamos (pero seguimos; quizá el pipeline no la necesite)
    warn "⚠️${TAB_4}Atención: la ruta de datos de entrada '$PATH_PROJECT' no existe en el host o no está definida"
fi
# Bind del repositorio al mismo path que antes
BIND_OPTS+=("-B" "$PATH_REPOSITORY":"/workspace/$REPOSITORY_BASENAME")


# Asegurar que el directorio bind existe en host (al menos el repo)
mkdir -p "$PATH_REPOSITORY" || true

# 1) Comprobar que el repositorio estará disponible dentro del contenedor
echo "🔎${TAB_4}Verificando que el repositorio estará accesible dentro del contenedor (bind)..."
if apptainer exec "${BIND_OPTS[@]}" "$PATH_CONTAINER" bash -c "[ -d /workspace/$REPOSITORY_BASENAME ] && echo '✅${TAB_4}Repositorio disponible dentro de la SIF' || echo '❌${TAB_4}Repositorio NO encontrado dentro de la SIF'"; then
    true
fi

# 2) Asegurarse de que el script del pipeline tenga permisos de ejecución (dentro de la SIF en el path bind-mounted)
echo "🔧${TAB_4}Ajustando permisos del script del pipeline dentro de la SIF (si existe)..."
apptainer exec "${BIND_OPTS[@]}" "$PATH_CONTAINER" bash -c "if [ -f \"$PATH_RUN_PIPELINE_CONTAINER\" ]; then chmod +x \"$PATH_RUN_PIPELINE_CONTAINER\" && echo '✅${TAB_4}Script del pipeline marcado como ejecutable'; else echo '⚠️${TAB_4}Script del pipeline no encontrado en $PATH_RUN_PIPELINE_CONTAINER dentro de la SIF'; fi"

# 3) Ejecutar el pipeline dentro de la SIF
echo ""
echo ""
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
title2 "🚀${TAB_4}Ejecutando pipeline dentro de la SIF..."
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"

echo "⏳${TAB_4}Lanzando el pipeline. Por favor, espere..."
echo ""
echo ""
# Ejecutamos la cadena de comandos inyectada dentro de Apptainer
apptainer exec "${BIND_OPTS[@]}" "$PATH_CONTAINER" bash -c "$CMD_PIPELINE"

echo ""
