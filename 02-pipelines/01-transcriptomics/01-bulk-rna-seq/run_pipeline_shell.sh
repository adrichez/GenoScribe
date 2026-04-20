#!/bin/bash

set -eo pipefail


#############################################################################################################################################################
# SCRIPT PARA LANZAR EL PIPELINE DE TRANSCRIPTOMICS BULK RNA-SEQ MEDIANTE SHELL
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

# Cambiar al directorio del script
cd "$(dirname "$0")"


# Subir dos niveles para llegar a la raíz del proyecto
PATH_REPOSITORY="$(cd ../../.. && pwd)"
REPOSITORY_BASENAME="$(basename "$PATH_REPOSITORY")"


# Leer argumentos
PATH_PROJECT="$1"
EXPERIMENT_NAME="$2"
REPORT_LANGUAGE="$3"
REPORT_VERSION="$4"


# Definir rutas adicionales
PATH_PIPELINE=$(pwd)
PIPELINE_DIR=$(basename "$PATH_PIPELINE")
OMICS_CATEGORY_DIR=$(basename "$(dirname "$PATH_PIPELINE")")

PATH_PIPELINE_REPORT="$PATH_PIPELINE/report"
PATH_APP_REPORTS="$PATH_REPOSITORY/01-app/www/reports/$OMICS_CATEGORY_DIR/$PIPELINE_DIR"


# Ajustar permisos de la carpeta de reportes
if [ -d "$PATH_PIPELINE_REPORT" ]; then
  chmod -R a+rw "$PATH_PIPELINE_REPORT"
  echo ""
fi


# Comprobar en qué categoría y pipeline estamos
case "${OMICS_CATEGORY_DIR}/${PIPELINE_DIR}" in

  "01-transcriptomics/01-bulk-rna-seq")
    OMICS_CATEGORY_NAME="Transcriptomics"
    PIPELINE_NAME="Bulk RNA-Seq"
    ;;

  "01-transcriptomics/02-sc-rna-seq")
    OMICS_CATEGORY_NAME="Transcriptomics"
    PIPELINE_NAME="Single Cell RNA-Seq"
    ;;

  "01-transcriptomics/03-st-rna-seq")
    OMICS_CATEGORY_NAME="Transcriptomics"
    PIPELINE_NAME="Spatial Transcriptomics"
    ;;

  "02-metagenomics/01-shotgun")
    OMICS_CATEGORY_NAME="Metagenomics"
    PIPELINE_NAME="Metagenomics Shotgun"
    ;;

  "02-metagenomics/02-amplicon")
    OMICS_CATEGORY_NAME="Metagenomics"
    PIPELINE_NAME="Metagenomics Amplicon"
    ;;

  "03-metatranscriptomics/01-shotgun")
    OMICS_CATEGORY_NAME="Metatranscriptomics"
    PIPELINE_NAME="Metatranscriptomics Shotgun"
    ;;

  *)
    OMICS_CATEGORY_NAME="Desconocida"
    PIPELINE_NAME="Desconocido"
    ;;

esac


title1 "###################################################################################################################################"
title1 "🚀${TAB_4}[$OMICS_CATEGORY_NAME - $PIPELINE_NAME Pipeline] Lanzando pipeline..."
title1 "###################################################################################################################################"
echo ""
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
title2 "🏗️${TAB_4}Trabajando con los siguientes datos:"
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
info "📂${TAB_4}Ruta del proyecto: $PATH_PROJECT"
info "🧪${TAB_4}Nombre del experimento: $EXPERIMENT_NAME"
info "🌐${TAB_4}Idioma del informe: $REPORT_LANGUAGE"
info "📝${TAB_4}Versión del informe: $REPORT_VERSION"
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
  --experiment_name "$EXPERIMENT_NAME" \
  --report_language "$REPORT_LANGUAGE" \
  --report_version "$REPORT_VERSION"

echo ""
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
title2 "🎉${TAB_4}Ejecución del pipeline finalizada"
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"


# Copiar resultados
if [ -d "$PATH_PIPELINE_REPORT" ]; then
  echo "⏳${TAB_4}Copiando report a la carpeta del proyecto..."
  
  # Borrar el index.html general para dejar solo el del idioma específico
  rm -f "$PATH_PIPELINE_REPORT/index.html"
  
  # Comprobar si la carpeta report ya existe en el proyecto destino y borrarla
  if [ -d "$PATH_PROJECT/report" ]; then
    echo "🧹${TAB_4}Eliminando versión anterior del informe en el destino..."
    rm -rf "$PATH_PROJECT/report"
  fi
  
  # Creamos el directorio destino limpio
  mkdir -p "$PATH_PROJECT/report"
  
  # Copiamos todo el contenido restante al directorio de destino
  cp -r "$PATH_PIPELINE_REPORT"/* "$PATH_PROJECT/report/"
  
  success "✅${TAB_4}Resultados copiados correctamente"
  important "📂${TAB_4}Puede visualizar el informe generado en el directorio del proyecto: $PATH_PROJECT/report"
  important "📂${TAB_4}Así como en la ruta del propio pipeline de $OMICS_CATEGORY_NAME ($PIPELINE_NAME): $PATH_PIPELINE_REPORT"
  echo ""
  echo ""
  title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
  title2 "🏁${TAB_4}Proceso finalizado"
  title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
  echo "👋${TAB_4}Hasta pronto!"
  echo ""
else
  warn "⚠️${TAB_4}Carpeta 'report' no encontrada en $PATH_PIPELINE_REPORT. No se copió ningún archivo."
  echo ""
fi
