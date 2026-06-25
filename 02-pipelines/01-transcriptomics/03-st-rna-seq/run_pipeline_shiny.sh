#!/bin/bash

set -eo pipefail


#############################################################################################################################################################
# SCRIPT PARA LANZAR EL PIPELINE DE TRANSCRIPTÓMICA SPATIAL RNA-SEQ MEDIANTE SHINY
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

PATH_PROJECT="$1"
TECHNOLOGY="$2"
REPORT_LANGUAGE="$3"
REPORT_VERSION="$4"

cd "$(dirname "$0")"

echo ""
title1 "###################################################################################################################################"
title1 "🚀${TAB_4}[Transcriptomics - Spatial RNA-Seq Pipeline] Lanzando pipeline..."
title1 "###################################################################################################################################"


# Validar argumentos
if [ $# -lt 2 ]; then
  echo ""
  error "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
  error "❌${TAB_4}[Error] Faltan argumentos obligatorios"
  error "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
  error "Este script necesita 2 parámetros para ejecutarse correctamente:"
  error "  1️⃣${TAB_6}<project_path>  Ruta a los datos del proyecto"
  error "  2️⃣${TAB_6}<technology>  Tecnología de captura"
  error "  3️⃣${TAB_6}<report_language>  Idioma del informe"
  error "  4️⃣${TAB_6}<report_version>  Versión del informe"
  echo ""
  exit 1
fi


# Imprimir parametros de entrada
echo ""
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
title2 "🏗️${TAB_4}Trabajando con los siguientes datos:"
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
info "📂${TAB_4}Ruta del proyecto: $PATH_PROJECT"
info "🧬${TAB_4}Tecnología de captura: $TECHNOLOGY"
info "🌐${TAB_4}Idioma del informe: $REPORT_LANGUAGE"
info "📝${TAB_4}Versión del informe: $REPORT_VERSION"


# Ajustar PATH y activar entorno directamente
echo ""
echo ""
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
title2 "🐍${TAB_4}Ajustando entornos..."
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"


# Limpiar PATH de duplicados
PATH=$(awk -v RS=: -v ORS=: '!a[$1]++' <<< "$PATH")
PATH=${PATH%:}  # eliminar ':' final
export PATH


# Añadir /opt/miniconda3/bin al PATH si no está
case ":$PATH:" in
  *":/opt/miniconda3/bin:"*) :;;
  *) export PATH=/opt/miniconda3/bin:$PATH;;
esac


# Comprobar y activar entorno Conda
if [ -d "/opt/miniconda3/envs/genoscribe" ]; then
  source /opt/miniconda3/bin/activate /opt/miniconda3/envs/genoscribe
  conda activate genoscribe

  # Añadir /opt/miniconda3/envs/genoscribe/bin al PATH si no está
  case ":$PATH:" in
    *":/opt/miniconda3/envs/genoscribe/bin:"*) :;;
    *) export PATH=/opt/miniconda3/envs/genoscribe/bin:$PATH;;
  esac

  # Configurar R
  export R_HOME=/opt/miniconda3/envs/genoscribe/lib/R
  export R_LIBS=/opt/miniconda3/envs/genoscribe/lib/R/library

  success "✅${TAB_4}Entorno conda 'genoscribe' activado, variables de R configuradas y PATH limpio"
else
  error "❌${TAB_4}No se encontró el entorno 'genoscribe' en /opt/miniconda3/envs/"
  exit 1
fi


# Ejecutar Nextflow
echo "⏳${TAB_4}Ejecutando Nextflow..."
echo ""
echo ""

nextflow run main.nf -resume \
  --project_path "$PATH_PROJECT" \
  --technology "$TECHNOLOGY" \
  --report_language "$REPORT_LANGUAGE" \
  --report_version "$REPORT_VERSION"


echo ""
echo ""
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
title2 "🧹${TAB_4}Perfeccionando resultados generados"
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"

PATH_PIPELINE_REPORT="report"

if [ -d "$PATH_PIPELINE_REPORT" ]; then
  echo "⏳${TAB_4}Limpiando archivo HTML generado por defecto..."
  
  # Borrar el index.html general para dejar solo el del idioma específico
  rm -f "$PATH_PIPELINE_REPORT/index.html"
  
  success "✅${TAB_4}Carpeta de resultados preparada para la gestión de Shiny"
else
  warn "⚠️${TAB_4}Carpeta 'report' no encontrada. Saltando limpieza."
fi


echo ""
echo ""
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
title2 "🎉${TAB_4}Ejecución del pipeline finalizada"
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
echo "🏁${TAB_4}Proceso finalizado"
echo "👋${TAB_4}Hasta pronto!"
echo ""
