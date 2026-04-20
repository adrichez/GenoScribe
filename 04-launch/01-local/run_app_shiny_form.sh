#!/usr/bin/env bash

set -euo pipefail


#############################################################################################################################################################
# SCRIPT PARA LANZAR LA APLICACIÓN GENOSCRIBE MEDIANTE SHINY EN LOCAL (SIN CONTENEDORES, DIRECTAMENTE EN SU MÁQUINA) (MODALIDAD FORMULARIO)
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
title1 "🚀${TAB_4}Lanzando App GenoScribe desde la interfaz gráfica de Shiny en local (sin contenedores, directamente en su máquina)"
title1 "###################################################################################################################################"
echo ""


# Cambiar al directorio donde está el script
PATH_SCRIPT_RUN_APP="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$PATH_SCRIPT_RUN_APP"


# Definir la ruta raíz y el nombre del repositorio
PATH_REPOSITORY="$(cd "$PATH_SCRIPT_RUN_APP/../.." && pwd)"  # 2 niveles arriba
REPOSITORY_BASENAME="$(basename "$PATH_REPOSITORY")"


# Configuración de variables con rutas absolutas
PORT=3838
PATH_APP="$(cd "$PATH_REPOSITORY/01-app" && pwd)"
PATH_APP_REPORTS="$(cd "$PATH_APP/www/reports" && pwd)"


# Imprimir parámetros de configuración
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
title2 "🛠️${TAB_4}Parámetros de configuración:"
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
info "🔹${TAB_4}Directorio del script: $PATH_SCRIPT_RUN_APP"
info "🔹${TAB_4}Ruta raíz del repositorio: $PATH_REPOSITORY"
info "🔹${TAB_4}Nombre del repositorio: $REPOSITORY_BASENAME"
info "🔹${TAB_4}Ruta a la app: $PATH_APP"
info "🔹${TAB_4}Ruta a reports: $PATH_APP_REPORTS"


echo ""
echo ""
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
title2 "⚙️${TAB_4}Realizando ajustes iniciales..."
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"

# Ajustar permisos de la carpeta de reportes
if [ -d "$PATH_APP_REPORTS" ]; then
    echo "⏳${TAB_4}Ajustando permisos de la carpeta de reportes..."
    chmod -R a+rw "$PATH_APP_REPORTS"

    mkdir -p "$PATH_APP_REPORTS/01-transcriptomics/01-bulk-rna-seq"
    chmod -R a+rw "$PATH_APP_REPORTS/01-transcriptomics/01-bulk-rna-seq"

    mkdir -p "$PATH_APP_REPORTS/01-transcriptomics/02-sc-rna-seq"
    chmod -R a+rw "$PATH_APP_REPORTS/01-transcriptomics/02-sc-rna-seq"

    mkdir -p "$PATH_APP_REPORTS/01-transcriptomics/03-st-rna-seq"
    chmod -R a+rw "$PATH_APP_REPORTS/01-transcriptomics/03-st-rna-seq"

    mkdir -p "$PATH_APP_REPORTS/02-metagenomics/01-shotgun"
    chmod -R a+rw "$PATH_APP_REPORTS/02-metagenomics/01-shotgun"

    mkdir -p "$PATH_APP_REPORTS/02-metagenomics/02-amplicon"
    chmod -R a+rw "$PATH_APP_REPORTS/02-metagenomics/02-amplicon"

    mkdir -p "$PATH_APP_REPORTS/03-metatranscriptomics/01-shotgun"
    chmod -R a+rw "$PATH_APP_REPORTS/03-metatranscriptomics/01-shotgun"

    success "✅ Permisos ajustados correctamente"
fi


# Comprobar si el puerto está en uso y matarlo si es necesario
if lsof -i :$PORT >/dev/null 2>&1; then
    warn "⚠️${TAB_4}Puerto $PORT en uso. Cerrando proceso que lo ocupa..."
    lsof -ti :$PORT | xargs kill -9 2>/dev/null || true
    sleep 1
    success "✅${TAB_4}Puerto $PORT liberado"
fi

echo ""
echo ""
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
title2 "🚀${TAB_4}Iniciando GenoScribe..."
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"


# Ajustes iniciales de permisos
chmod -R u+rwX "$PATH_APP"
chown -R "$(whoami)" "$PATH_APP" || echo "⚠️${TAB_4}Algunos archivos no pudieron cambiar ownership"
if [ -d "$PATH_APP_REPORTS" ]; then
    chmod -R u+rwX "$PATH_APP_REPORTS"
    chown -R "$(whoami)" "$PATH_APP_REPORTS" || echo "⚠️${TAB_4}Algunos archivos no pudieron cambiar ownership"
fi

success "👍${TAB_4}Carpetas y permisos listos."
echo "⚙️${TAB_4}Iniciando la aplicación Shiny..."
echo "⏳${TAB_4}Iniciando el servidor..."
important "🌐${TAB_4}Abriendo navegador en: http://localhost:$PORT/app..."
important "📁${TAB_4}El informe estará disponible en el directorio: $PATH_APP_REPORTS"
info "🔒${TAB_4}Una vez finalizado el proceso y generado el informe, pulsar [Ctrl+C] en la terminal para detener el servidor."


# Buscar automáticamente la ruta de Rscript en el sistema
RSCRIPT_PATH=$(command -v Rscript || true)

if [ -z "$RSCRIPT_PATH" ]; then
    echo ""
    error "❌${TAB_4}ERROR: No se encontró 'Rscript' en el sistema."
    error "Asegúrese de tener R instalado y disponible en el PATH."
    error "Puede comprobarlo ejecutando manualmente:"
    error "which Rscript"
    error "En macOS con Apple Silicon puede estar en /opt/homebrew/bin/"
    error "En Linux suele estar en /usr/bin/ o /usr/local/bin/"
    exit 1
fi

note "🧠${TAB_4}Usando Rscript detectado en: $RSCRIPT_PATH"
echo ""


# Ejecutar la app Shiny
"$RSCRIPT_PATH" -e "
suppressWarnings(library(shiny));
runApp(appDir = '$PATH_APP', 
    launch.browser = TRUE, 
    host = '0.0.0.0', 
    port = $PORT,
    display.mode = 'normal')
"
