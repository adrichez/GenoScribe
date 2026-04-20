#!/usr/bin/env bash

set -e


#############################################################################################################################################################
# SCRIPT DE INICIALIZACIÓN PARA EL CONTENEDOR DE GENOSCRIBE
#############################################################################################################################################################

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# DESCRIPCIÓN GENERAL
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

# Este script:
# 1. Activa el entorno Conda "genoscribe" para usar el R correcto
# 2. Ajusta permisos de directorios clave (/srv/shiny-server y /workspace/GenoScribe)
# 3. Crea el enlace simbólico hacia la aplicación principal de Shiny
# 4. Verifica el estado del puerto 3838
# 5. Comprueba e instala los paquetes R necesarios dentro del entorno Conda
# 6. Inicia el servidor Shiny






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
title1 "🚀${TAB_4}[Entrypoint] Iniciando configuración del entorno de GenoScribe"
title1 "###################################################################################################################################"
echo ""

title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
title2 "⚙️${TAB_4}Realizando ajustes iniciales..."
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"


# Activar Conda
echo "🐍${TAB_4}Activando entorno conda 'genoscribe'..."
source /opt/miniconda3/bin/activate /opt/miniconda3/envs/genoscribe
conda activate genoscribe || { error "❌${TAB_4}No se pudo activar el entorno conda 'genoscribe'"; exit 1; }

success_b "✅${TAB_4}Entorno conda 'genoscribe' activado"
echo "🔍${TAB_4}Usando R en: $(which R)"
echo ""


# Permisos /srv/shiny-server
echo "🔧${TAB_4}Ajustando permisos de /srv/shiny-server..."
chmod -R u+rwX /srv/shiny-server
chown -R shiny:shiny /srv/shiny-server || warn "⚠️${TAB_4}Algunos archivos no pudieron cambiar ownership"


# Permisos /workspace/GenoScribe
if [ -d "/workspace/GenoScribe" ]; then
  echo "🔧${TAB_4}Ajustando permisos de /workspace/GenoScribe..."
  chmod -R u+rwX /workspace/GenoScribe
  chown -R shiny:shiny /workspace/GenoScribe || warn "⚠️${TAB_4}Algunos archivos no pudieron cambiar ownership en /workspace/GenoScribe"
fi
success_b "✅${TAB_4}Carpetas y permisos ajustados correctamente."
echo ""


# Crear enlace simbólico a la aplicación Shiny
echo "🔗${TAB_4}Creando enlace simbólico a la aplicación Shiny..." >&2

if [ -e /srv/shiny-server/app ]; then
  echo "🗑️${TAB_4}Eliminando directorio/enlace existente en /srv/shiny-server/app..." >&2
  rm -rf /srv/shiny-server/app
fi

ln -s /workspace/GenoScribe/01-app /srv/shiny-server/app
success_b "✅${TAB_4}Enlace simbólico creado: /srv/shiny-server/app -> /workspace/GenoScribe/01-app"
echo ""


# Comprobar el estado del puerto 3838
echo "🔌${TAB_4}Comprobando si el puerto 3838 está libre..." >&2
if lsof -i :3838 >/dev/null 2>&1; then
  warn "⚠️${TAB_4}Puerto 3838 ya está en uso" >&2
  echo "🐳${TAB_4}El proceso de Shiny Server ha sido activado al crearse el contenedor" >&2
else
  success_b "✅${TAB_4}Puerto 3838 libre" >&2
  echo "⏳${TAB_4}Iniciando Shiny Server..." >&2
fi
echo ""


# Verificar e instalar paquetes R necesarios (usando el R del entorno conda)
echo "📦${TAB_4}Verificando instalación de paquetes R necesarios..."
/opt/miniconda3/envs/genoscribe/bin/Rscript -e "
required <- c(
  'shiny','xfun','knitr','rmarkdown','quarto','fs','jsonlite','dplyr','DT',
  'glue','purrr','stringr','ggplot2','readxl','htmltools','plotly','scales',
  'tidyr','tibble','magrittr','htmlwidgets','tidyverse','qiime2R'
);
missing <- required[!sapply(required, requireNamespace, quietly = TRUE)];
if (length(missing) > 0) {
  cat('⚠️ Faltan paquetes:', paste(missing, collapse = ', '), '\\n');
  cat('🚀 Instalando paquetes faltantes...\\n');
  options(repos = 'https://cloud.r-project.org');
  install.packages(missing, dependencies = TRUE);
  cat('✅ Instalación completada\\n');
} else {
  cat('✅ Todos los paquetes R necesarios están disponibles\\n');
}
" || { echo "❌${TAB_4}Error al verificar o instalar paquetes R"; exit 1; }
echo ""
echo ""


# Inicio de Shiny Server
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
title2 "🚀${TAB_4}Arrancando Shiny Server..."
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
echo "⏳${TAB_4}Iniciando el servidor..."
echo ""

# Ejecutar Shiny Server usando el entorno conda activo
exec /usr/bin/shiny-server

echo ""
