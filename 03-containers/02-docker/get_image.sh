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
title1 "📦 Comprobación y obtención de la imagen Docker 'adrichez/genoscribe'"
title1 "###################################################################################################################################"
echo ""

# Configuración de variables robusta
PATH_SCRIPT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$PATH_SCRIPT"

TAG="latest"
IMAGE_NAME="adrichez/genoscribe:$TAG"

title2 "🛠️ Parámetros de configuración:"
title2 "==============================="
info "📌 Directorio actual: $PATH_SCRIPT"
info "📦 Imagen a buscar: $IMAGE_NAME"
echo ""

# Comprobar si la imagen Docker ya existe localmente
echo "🗄️ Comprobando si la imagen Docker '$IMAGE_NAME' ya existe..."
if docker image inspect "$IMAGE_NAME" > /dev/null 2>&1; then
    success "✅ La imagen '$IMAGE_NAME' ya existe localmente."
    echo "🫷 No es necesario descargarla de DockerHub."
    exit 0
else
    warn "⚠️ La imagen '$IMAGE_NAME' no se encuentra localmente."
    echo "⬇️ Procediendo a descargarla desde DockerHub..."
fi

echo ""
title2 "=========================================================="
title2 "💬 ¿Desea continuar con la descarga de la imagen Docker?"
title2 "=========================================================="

while true; do
    echo "1) Sí, descargar desde DockerHub"
    echo "2) No, salir del script"
    read -e -p "---> Elige una opción (s/n): " OPTION
    echo ""

    case "$OPTION" in
        s)
            title2 "🐳 Descargando imagen desde DockerHub..."
            title2 "=========================================="
            if docker pull "$IMAGE_NAME"; then
                echo ""
                success "✅ Imagen Docker '$IMAGE_NAME' descargada correctamente"
            else
                error "❌ Error al descargar la imagen Docker"
                echo "🙏 Por favor, comprueba tu conexión a Internet y los permisos de Docker"
                echo ""
                exit 1
            fi
            break
            ;;
        n)
            echo "🚪 Ha elegido salir del script"
            error "🛑 Proceso cancelado"
            echo ""
            exit 0
            ;;
        *)
            error "❌ Opción no válida"
            echo "🙏 Por favor, ejecuta el script de nuevo y elige una opción válida"
            echo "🚪 Saliendo.."
            echo ""
            exit 1
            ;;
    esac
done

echo ""
title2 "🏁 Proceso finalizado"
title2 "========================"
echo "👋 Hasta pronto!"
echo ""
