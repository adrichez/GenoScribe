#!/usr/bin/env bash

set -euo pipefail


#############################################################################################################################################################
# SCRIPT PARA CREAR LA ESTRUCTURA BASE DE DIRECTORIOS (SCAFFOLD) PARA UN PROYECTO DE TRANSCRIPTÓMICA DE BULK RNA-SEQ
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
title1 "🚀${TAB_4}Creación de la estructura base de directorios para un proyecto Transcriptómico de Bulk RNA-Seq"
title1 "###################################################################################################################################"
echo ""


#============================================================================================================
# Preguntas iniciales para personalizar la estructura de directorios
#============================================================================================================

title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
title2 "💬${TAB_4}Responda a las siguientes preguntas para determinar la estructura de directorios:"
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
echo ""
title3 "📄${TAB_4}¿Qué nombre tiene el proyecto?:"
title3 "==================================="
read -rp "---> Introduce el nombre del proyecto para la carpeta madre: " PROJECT
echo ""
title3 "📄${TAB_4}¿Qué nombre tiene el experimento específico?:"
title3 "================================================"
read -rp "---> Introduce el nombre del experimento para la subcarpeta: " EXPERIMENT
echo ""




#============================================================================================================
# Comprobar que el usuario no ha dejado el nombre vacío
#============================================================================================================

if [ -z "$PROJECT" ]; then
  error "❌${TAB_4}Error: No has introducido ningún nombre. Saliendo del script..."
  exit 1
fi

if [ -z "$EXPERIMENT" ]; then
  error "❌${TAB_4}Error: No has introducido ningún nombre para el experimento. Saliendo del script..."
  exit 1
fi




#============================================================================================================
# Definir las rutas finales a partir de la estructura solicitada
#============================================================================================================

DIRS=(
  # Bloque de Análisis
  "Analisis/$EXPERIMENT/hisat2_index"
  "Analisis/$EXPERIMENT/hisat2_results"
  "Analisis/$EXPERIMENT/Pre_fastqc_results"
  "Analisis/$EXPERIMENT/Readcount_results"
  "Analisis/reads_down_select_$EXPERIMENT"

  # Bloque de Documentación
  "Documentacion"

  # Bloque de Resultados
  "Resultados/$EXPERIMENT/Enrichment"
)




#============================================================================================================
# Creación de directorios de forma iterativa
#============================================================================================================

echo ""
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
title2 "🏗️${TAB_4}Creación de la estructura de directorios para el proyecto"
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
info "🔹${TAB_4}Tipo de análisis: Transcriptómica Bulk RNA-Seq"
info "🔹${TAB_4}Nombre del proyecto: $PROJECT"
info "🔹${TAB_4}Nombre del experimento: $EXPERIMENT"
echo "⌛️${TAB_4}Creando directorios..."


for dir in "${DIRS[@]}"; do
  mkdir -p "$PROJECT/$dir"
done


success_b "✅${TAB_4}¡Estructura de directorios creada con éxito!"




#============================================================================================================
# Creación de archivos adicionales
#============================================================================================================

# Completar este apartado en el caso de que fueran necesarios archivos adicionales (metadata, scripts, etc.)




#============================================================================================================
# Mensaje final de despedida
#============================================================================================================

echo ""
echo ""
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
title2 "🎉${TAB_4}Scaffold finalizado"
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
echo "🏁${TAB_4}Proceso finalizado"
echo "👋${TAB_4}Hasta pronto!"
echo ""
