#!/usr/bin/env bash
set -euo pipefail


##########################################################################################################################################################
# AJUSTES DE PERSONALIZACIÓN DE LA SALIDA
##########################################################################################################################################################

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




##########################################################################################################################################################
# CODIGO PRINCIPAL
##########################################################################################################################################################

echo ""
title1 "###################################################################################################################################"
title1 "📦 Comprobación y obtención de la imagen/contenedor genoscribe-lab.sif"
title1 "###################################################################################################################################"
echo ""

# Configuración de variables robusta
PATH_SCRIPT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$PATH_SCRIPT"

# Definir la ruta raíz y el nombre del repositorio
PATH_REPOSITORY="$(cd "$PATH_SCRIPT/../.." && pwd)"  # 2 niveles arriba
REPOSITORY_BASENAME="$(basename "$PATH_REPOSITORY")"

TAG="latest"
IMAGE_NAME="adrichez/genoscribe:$TAG"
CONTAINER_NAME="genoscribe-lab"
$PATH_REL_CONTAINER="${CONTAINER_NAME}.sif"
$PATH_CONTAINER="$PATH_REPOSITORY/03-containers/03-apptainer/${$PATH_REL_CONTAINER}"

title2 "🛠️ Parámetros de configuración:"
title2 "==============================="
info "🔹 Directorio del script: $PATH_SCRIPT"
info "🔹 Ruta raíz del repositorio: $PATH_REPOSITORY"
info "🔹 Nombre del repositorio: $REPOSITORY_BASENAME"
info "🔹 Nombre de la imagen en DockerHub: $IMAGE_NAME"
info "🔹 Nombre del contenedor SIF: $CONTAINER_NAME"
info "🔹 Ruta esperada del contenedor SIF: $$PATH_CONTAINER"
echo ""

title2 "📦 Comprobando existencia del contenedor '$CONTAINER_NAME'..."
title2 "=============================================================="
# Comprobar si el contenedor .sif existe
if [ -f "$PATH_CONTAINER" ]; then
    echo "✅ Contenedor '$CONTAINER_NAME.sif' encontrado en el directorio esperado: $PATH_CONTAINER"
    echo "🫷 No es necesario descargarlo ni construirlo"
else
    echo "❌ Contenedor '$CONTAINER_NAME.sif' no encontrado en el directorio esperado: $PATH_CONTAINER"
    echo "🙏 Por favor, asegúrese de haberlo descargado o generado antes de ejecutar este script"
    exit 1
fi

echo ""
title2 "==============================================="
title2 "💬 ¿Cómo quiere obtener '$CONTAINER_NAME.sif'?"
title2 "==============================================="
echo "1) Construir desde DockerHub (adrichez/genoscribe:latest)"
echo "2) Importar o copiar manualmente desde otro directorio o descargar desde Mega"
read -e -p "---> Elige una opción (1/2): " OPTION
echo ""

case "$OPTION" in
    1)
        title2 "🐳 Opción 1: Construir SIF desde DockerHub"
        title2 "============================================"
        warn "⚠️ Necesitas tener Docker y Apptainer instalados."

        echo "⬇️ Haciendo pull de la imagen de DockerHub..."
        docker pull "$IMAGE_NAME"

        echo "⬇️ Construyendo el archivo SIF con Apptainer..."
        apptainer build "$PATH_CONTAINER" docker-daemon://"$IMAGE_NAME"

        success "✅ Archivo SIF '$CONTAINER_NAME.sif' generado correctamente."
        ;;
    2)
        title2 "📂 Opción 2: Importar manualmente o descargar desde Mega"
        title2 "=========================================================="
        info "🙏 Por favor, coloca el archivo '$CONTAINER_NAME.sif' en este directorio manualmente: $PATH_CONTAINER"
        info "💡 Alternativamente, puede descargarlo desde este enlace de Mega:"
        important "🌐 https://mega.nz/file/cZc3jAZY#Py5mKxVw1Ck_rsPQcphVa-VM36k4Eu2WY-qh2w5wLyo"
        info "💻 Si está en un cluster o servidor, puede usar scp/rsync para transferirlo desde su máquina local"
        echo ""
        exit 0
        ;;
    *)
        error "❌ Opción no válida"
        info "🙏 Por favor, ejecuta el script de nuevo y elige una opción válida"
        echo "🚪 Saliendo.."
        echo ""
        exit 1
        ;;
esac

echo ""
title2 "🏁 Limpieza finalizada"
title2 "========================"
echo "👋 Hasta pronto!"
echo ""
