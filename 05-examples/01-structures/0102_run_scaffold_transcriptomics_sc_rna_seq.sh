#!/usr/bin/env bash

set -euo pipefail


#############################################################################################################################################################
# SCRIPT PARA CREAR LA ESTRUCTURA BASE DE DIRECTORIOS (SCAFFOLD) PARA UN PROYECTO DE TRANSCRIPTÓMICA DE SINGLE CELL RNA-SEQ
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
title1 "🚀${TAB_4}Creación de la estructura base de directorios para un proyecto Transcriptómico de Single Cell RNA-Seq"
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




#============================================================================================================
# Comprobar que el usuario no ha dejado el nombre vacío
#============================================================================================================

if [ -z "$PROJECT" ]; then
  error "❌${TAB_4}Error: No has introducido ningún nombre. Saliendo del script..."
  exit 1
fi




#============================================================================================================
# Definir las rutas finales a partir de la estructura solicitada
#============================================================================================================

DIRS=(
  # Bloque de Análisis
  "analysis/01_qc/01_reads_qc/fastp"
  "analysis/01_qc/01_reads_qc/fastqc"
  "analysis/01_qc/02_cells_qc"


  "analysis/02_dim_reduction"


  "analysis/03_clustering/01_seurat_merged_clusters/01_cluster_umaps"
  "analysis/03_clustering/01_seurat_merged_clusters/02_cluster_proportions"
  "analysis/03_clustering/02_seurat_integrated_clusters/01_cluster_umaps"
  "analysis/03_clustering/02_seurat_integrated_clusters/02_cluster_proportions"


  "analysis/04_markers/01_seurat_merged_clusters"
  "analysis/04_markers/02_seurat_integrated_clusters"


  "analysis/05_cell_annotation/01_automatic_dbs_annotation"

  "analysis/05_cell_annotation/02_manual_annotation/01_version/01_etapa"
  "analysis/05_cell_annotation/02_manual_annotation/01_version/02_big_etapa"
  "analysis/05_cell_annotation/02_manual_annotation/02_version/01_etapa"
  "analysis/05_cell_annotation/02_manual_annotation/02_version/02_big_etapa"


  "analysis/06_population_aggregation/01_version"
  "analysis/06_population_aggregation/02_version"


  "analysis/07_deg_conditions/01_standard_comparisons/01_seurat_numeric_clusters/01_reference_vs_test_within_cluster"
  "analysis/07_deg_conditions/01_standard_comparisons/02_automatic_dbs_clusters/HPCA"
  "analysis/07_deg_conditions/01_standard_comparisons/02_automatic_dbs_clusters/KO_vs_WT"
  "analysis/07_deg_conditions/01_standard_comparisons/02_automatic_dbs_clusters/Monaco"
  "analysis/07_deg_conditions/01_standard_comparisons/02_automatic_dbs_clusters/RNASeqMouse"
  "analysis/07_deg_conditions/01_standard_comparisons/02_automatic_dbs_clusters/TabulaMuris"
  "analysis/07_deg_conditions/01_standard_comparisons/03_manual_aggregated_named_clusters/01_version/01_reference_vs_test_within_cluster"
  "analysis/07_deg_conditions/01_standard_comparisons/03_manual_aggregated_named_clusters/01_version/02_reference_between_clusters_pairwise"
  "analysis/07_deg_conditions/01_standard_comparisons/03_manual_aggregated_named_clusters/01_version/03_test_between_clusters_pairwise"
  "analysis/07_deg_conditions/01_standard_comparisons/03_manual_aggregated_named_clusters/02_version/01_reference_vs_test_within_cluster"
  "analysis/07_deg_conditions/01_standard_comparisons/03_manual_aggregated_named_clusters/02_version/02_reference_between_clusters_pairwise"
  "analysis/07_deg_conditions/01_standard_comparisons/03_manual_aggregated_named_clusters/02_version/03_test_between_clusters_pairwise"

  "analysis/07_deg_conditions/02_custom_comparisons/01_condition_1_vs_condition_2"


  "analysis/08_enrichment/01_standard_comparisons/01_seurat_numeric_clusters/01_reference_vs_test_within_cluster/01_ora/01_go_bp"
  "analysis/08_enrichment/01_standard_comparisons/01_seurat_numeric_clusters/01_reference_vs_test_within_cluster/01_ora/02_go_cc"
  "analysis/08_enrichment/01_standard_comparisons/01_seurat_numeric_clusters/01_reference_vs_test_within_cluster/01_ora/03_go_mf"
  "analysis/08_enrichment/01_standard_comparisons/01_seurat_numeric_clusters/01_reference_vs_test_within_cluster/01_ora/04_kegg"
  "analysis/08_enrichment/01_standard_comparisons/01_seurat_numeric_clusters/01_reference_vs_test_within_cluster/02_gsea/01_go_bp"
  "analysis/08_enrichment/01_standard_comparisons/01_seurat_numeric_clusters/01_reference_vs_test_within_cluster/02_gsea/02_go_cc"
  "analysis/08_enrichment/01_standard_comparisons/01_seurat_numeric_clusters/01_reference_vs_test_within_cluster/02_gsea/03_go_mf"
  "analysis/08_enrichment/01_standard_comparisons/01_seurat_numeric_clusters/01_reference_vs_test_within_cluster/02_gsea/04_kegg"

  "analysis/08_enrichment/01_standard_comparisons/02_automatic_dbs_clusters/HPCA/01_ora/01_go_bp"
  "analysis/08_enrichment/01_standard_comparisons/02_automatic_dbs_clusters/HPCA/01_ora/02_go_cc"
  "analysis/08_enrichment/01_standard_comparisons/02_automatic_dbs_clusters/HPCA/01_ora/03_go_mf"
  "analysis/08_enrichment/01_standard_comparisons/02_automatic_dbs_clusters/HPCA/01_ora/04_kegg"
  "analysis/08_enrichment/01_standard_comparisons/02_automatic_dbs_clusters/HPCA/02_gsea/01_go_bp"
  "analysis/08_enrichment/01_standard_comparisons/02_automatic_dbs_clusters/HPCA/02_gsea/02_go_cc"
  "analysis/08_enrichment/01_standard_comparisons/02_automatic_dbs_clusters/HPCA/02_gsea/03_go_mf"
  "analysis/08_enrichment/01_standard_comparisons/02_automatic_dbs_clusters/HPCA/02_gsea/04_kegg"

  "analysis/08_enrichment/01_standard_comparisons/02_automatic_dbs_clusters/KO_vs_WT/01_ora/01_go_bp"
  "analysis/08_enrichment/01_standard_comparisons/02_automatic_dbs_clusters/KO_vs_WT/01_ora/02_go_cc"
  "analysis/08_enrichment/01_standard_comparisons/02_automatic_dbs_clusters/KO_vs_WT/01_ora/03_go_mf"
  "analysis/08_enrichment/01_standard_comparisons/02_automatic_dbs_clusters/KO_vs_WT/01_ora/04_kegg"
  "analysis/08_enrichment/01_standard_comparisons/02_automatic_dbs_clusters/KO_vs_WT/02_gsea/01_go_bp"
  "analysis/08_enrichment/01_standard_comparisons/02_automatic_dbs_clusters/KO_vs_WT/02_gsea/02_go_cc"
  "analysis/08_enrichment/01_standard_comparisons/02_automatic_dbs_clusters/KO_vs_WT/02_gsea/03_go_mf"
  "analysis/08_enrichment/01_standard_comparisons/02_automatic_dbs_clusters/KO_vs_WT/02_gsea/04_kegg"

  "analysis/08_enrichment/01_standard_comparisons/02_automatic_dbs_clusters/Monaco/01_ora/01_go_bp"
  "analysis/08_enrichment/01_standard_comparisons/02_automatic_dbs_clusters/Monaco/01_ora/02_go_cc"
  "analysis/08_enrichment/01_standard_comparisons/02_automatic_dbs_clusters/Monaco/01_ora/03_go_mf"
  "analysis/08_enrichment/01_standard_comparisons/02_automatic_dbs_clusters/Monaco/01_ora/04_kegg"
  "analysis/08_enrichment/01_standard_comparisons/02_automatic_dbs_clusters/Monaco/02_gsea/01_go_bp"
  "analysis/08_enrichment/01_standard_comparisons/02_automatic_dbs_clusters/Monaco/02_gsea/02_go_cc"
  "analysis/08_enrichment/01_standard_comparisons/02_automatic_dbs_clusters/Monaco/02_gsea/03_go_mf"
  "analysis/08_enrichment/01_standard_comparisons/02_automatic_dbs_clusters/Monaco/02_gsea/04_kegg"

  "analysis/08_enrichment/01_standard_comparisons/02_automatic_dbs_clusters/RNASeqMouse/01_ora/01_go_bp"
  "analysis/08_enrichment/01_standard_comparisons/02_automatic_dbs_clusters/RNASeqMouse/01_ora/02_go_cc"
  "analysis/08_enrichment/01_standard_comparisons/02_automatic_dbs_clusters/RNASeqMouse/01_ora/03_go_mf"
  "analysis/08_enrichment/01_standard_comparisons/02_automatic_dbs_clusters/RNASeqMouse/01_ora/04_kegg"
  "analysis/08_enrichment/01_standard_comparisons/02_automatic_dbs_clusters/RNASeqMouse/02_gsea/01_go_bp"
  "analysis/08_enrichment/01_standard_comparisons/02_automatic_dbs_clusters/RNASeqMouse/02_gsea/02_go_cc"
  "analysis/08_enrichment/01_standard_comparisons/02_automatic_dbs_clusters/RNASeqMouse/02_gsea/03_go_mf"
  "analysis/08_enrichment/01_standard_comparisons/02_automatic_dbs_clusters/RNASeqMouse/02_gsea/04_kegg"

  "analysis/08_enrichment/01_standard_comparisons/02_automatic_dbs_clusters/TabulaMuris/01_ora/01_go_bp"
  "analysis/08_enrichment/01_standard_comparisons/02_automatic_dbs_clusters/TabulaMuris/01_ora/02_go_cc"
  "analysis/08_enrichment/01_standard_comparisons/02_automatic_dbs_clusters/TabulaMuris/01_ora/03_go_mf"
  "analysis/08_enrichment/01_standard_comparisons/02_automatic_dbs_clusters/TabulaMuris/01_ora/04_kegg"
  "analysis/08_enrichment/01_standard_comparisons/02_automatic_dbs_clusters/TabulaMuris/02_gsea/01_go_bp"
  "analysis/08_enrichment/01_standard_comparisons/02_automatic_dbs_clusters/TabulaMuris/02_gsea/02_go_cc"
  "analysis/08_enrichment/01_standard_comparisons/02_automatic_dbs_clusters/TabulaMuris/02_gsea/03_go_mf"
  "analysis/08_enrichment/01_standard_comparisons/02_automatic_dbs_clusters/TabulaMuris/02_gsea/04_kegg"

  "analysis/08_enrichment/01_standard_comparisons/03_manual_aggregated_named_clusters/01_version/01_reference_vs_test_within_cluster/01_ora/01_go_bp"
  "analysis/08_enrichment/01_standard_comparisons/03_manual_aggregated_named_clusters/01_version/01_reference_vs_test_within_cluster/01_ora/02_go_cc"
  "analysis/08_enrichment/01_standard_comparisons/03_manual_aggregated_named_clusters/01_version/01_reference_vs_test_within_cluster/01_ora/03_go_mf"
  "analysis/08_enrichment/01_standard_comparisons/03_manual_aggregated_named_clusters/01_version/01_reference_vs_test_within_cluster/01_ora/04_kegg"
  "analysis/08_enrichment/01_standard_comparisons/03_manual_aggregated_named_clusters/01_version/01_reference_vs_test_within_cluster/02_gsea/01_go_bp"
  "analysis/08_enrichment/01_standard_comparisons/03_manual_aggregated_named_clusters/01_version/01_reference_vs_test_within_cluster/02_gsea/02_go_cc"
  "analysis/08_enrichment/01_standard_comparisons/03_manual_aggregated_named_clusters/01_version/01_reference_vs_test_within_cluster/02_gsea/03_go_mf"
  "analysis/08_enrichment/01_standard_comparisons/03_manual_aggregated_named_clusters/01_version/01_reference_vs_test_within_cluster/02_gsea/04_kegg"

  "analysis/08_enrichment/01_standard_comparisons/03_manual_aggregated_named_clusters/01_version/02_reference_between_clusters_pairwise/01_ora/01_go_bp"
  "analysis/08_enrichment/01_standard_comparisons/03_manual_aggregated_named_clusters/01_version/02_reference_between_clusters_pairwise/01_ora/02_go_cc"
  "analysis/08_enrichment/01_standard_comparisons/03_manual_aggregated_named_clusters/01_version/02_reference_between_clusters_pairwise/01_ora/03_go_mf"
  "analysis/08_enrichment/01_standard_comparisons/03_manual_aggregated_named_clusters/01_version/02_reference_between_clusters_pairwise/01_ora/04_kegg"
  "analysis/08_enrichment/01_standard_comparisons/03_manual_aggregated_named_clusters/01_version/02_reference_between_clusters_pairwise/02_gsea/01_go_bp"
  "analysis/08_enrichment/01_standard_comparisons/03_manual_aggregated_named_clusters/01_version/02_reference_between_clusters_pairwise/02_gsea/02_go_cc"
  "analysis/08_enrichment/01_standard_comparisons/03_manual_aggregated_named_clusters/01_version/02_reference_between_clusters_pairwise/02_gsea/03_go_mf"
  "analysis/08_enrichment/01_standard_comparisons/03_manual_aggregated_named_clusters/01_version/02_reference_between_clusters_pairwise/02_gsea/04_kegg"

  "analysis/08_enrichment/01_standard_comparisons/03_manual_aggregated_named_clusters/01_version/03_test_between_clusters_pairwise/01_ora/01_go_bp"
  "analysis/08_enrichment/01_standard_comparisons/03_manual_aggregated_named_clusters/01_version/03_test_between_clusters_pairwise/01_ora/02_go_cc"
  "analysis/08_enrichment/01_standard_comparisons/03_manual_aggregated_named_clusters/01_version/03_test_between_clusters_pairwise/01_ora/03_go_mf"
  "analysis/08_enrichment/01_standard_comparisons/03_manual_aggregated_named_clusters/01_version/03_test_between_clusters_pairwise/01_ora/04_kegg"
  "analysis/08_enrichment/01_standard_comparisons/03_manual_aggregated_named_clusters/01_version/03_test_between_clusters_pairwise/02_gsea/01_go_bp"
  "analysis/08_enrichment/01_standard_comparisons/03_manual_aggregated_named_clusters/01_version/03_test_between_clusters_pairwise/02_gsea/02_go_cc"
  "analysis/08_enrichment/01_standard_comparisons/03_manual_aggregated_named_clusters/01_version/03_test_between_clusters_pairwise/02_gsea/03_go_mf"
  "analysis/08_enrichment/01_standard_comparisons/03_manual_aggregated_named_clusters/01_version/03_test_between_clusters_pairwise/02_gsea/04_kegg"

  "analysis/08_enrichment/01_standard_comparisons/03_manual_aggregated_named_clusters/02_version/01_reference_vs_test_within_cluster/01_ora/01_go_bp"
  "analysis/08_enrichment/01_standard_comparisons/03_manual_aggregated_named_clusters/02_version/01_reference_vs_test_within_cluster/01_ora/02_go_cc"
  "analysis/08_enrichment/01_standard_comparisons/03_manual_aggregated_named_clusters/02_version/01_reference_vs_test_within_cluster/01_ora/03_go_mf"
  "analysis/08_enrichment/01_standard_comparisons/03_manual_aggregated_named_clusters/02_version/01_reference_vs_test_within_cluster/01_ora/04_kegg"
  "analysis/08_enrichment/01_standard_comparisons/03_manual_aggregated_named_clusters/02_version/01_reference_vs_test_within_cluster/02_gsea/01_go_bp"
  "analysis/08_enrichment/01_standard_comparisons/03_manual_aggregated_named_clusters/02_version/01_reference_vs_test_within_cluster/02_gsea/02_go_cc"
  "analysis/08_enrichment/01_standard_comparisons/03_manual_aggregated_named_clusters/02_version/01_reference_vs_test_within_cluster/02_gsea/03_go_mf"
  "analysis/08_enrichment/01_standard_comparisons/03_manual_aggregated_named_clusters/02_version/01_reference_vs_test_within_cluster/02_gsea/04_kegg"

  "analysis/08_enrichment/01_standard_comparisons/03_manual_aggregated_named_clusters/02_version/02_reference_between_clusters_pairwise/01_ora/01_go_bp"
  "analysis/08_enrichment/01_standard_comparisons/03_manual_aggregated_named_clusters/02_version/02_reference_between_clusters_pairwise/01_ora/02_go_cc"
  "analysis/08_enrichment/01_standard_comparisons/03_manual_aggregated_named_clusters/02_version/02_reference_between_clusters_pairwise/01_ora/03_go_mf"
  "analysis/08_enrichment/01_standard_comparisons/03_manual_aggregated_named_clusters/02_version/02_reference_between_clusters_pairwise/01_ora/04_kegg"
  "analysis/08_enrichment/01_standard_comparisons/03_manual_aggregated_named_clusters/02_version/02_reference_between_clusters_pairwise/02_gsea/01_go_bp"
  "analysis/08_enrichment/01_standard_comparisons/03_manual_aggregated_named_clusters/02_version/02_reference_between_clusters_pairwise/02_gsea/02_go_cc"
  "analysis/08_enrichment/01_standard_comparisons/03_manual_aggregated_named_clusters/02_version/02_reference_between_clusters_pairwise/02_gsea/03_go_mf"
  "analysis/08_enrichment/01_standard_comparisons/03_manual_aggregated_named_clusters/02_version/02_reference_between_clusters_pairwise/02_gsea/04_kegg"
  
  "analysis/08_enrichment/01_standard_comparisons/03_manual_aggregated_named_clusters/02_version/03_test_between_clusters_pairwise/01_ora/01_go_bp"
  "analysis/08_enrichment/01_standard_comparisons/03_manual_aggregated_named_clusters/02_version/03_test_between_clusters_pairwise/01_ora/02_go_cc"
  "analysis/08_enrichment/01_standard_comparisons/03_manual_aggregated_named_clusters/02_version/03_test_between_clusters_pairwise/01_ora/03_go_mf"
  "analysis/08_enrichment/01_standard_comparisons/03_manual_aggregated_named_clusters/02_version/03_test_between_clusters_pairwise/01_ora/04_kegg"
  "analysis/08_enrichment/01_standard_comparisons/03_manual_aggregated_named_clusters/02_version/03_test_between_clusters_pairwise/02_gsea/01_go_bp"
  "analysis/08_enrichment/01_standard_comparisons/03_manual_aggregated_named_clusters/02_version/03_test_between_clusters_pairwise/02_gsea/02_go_cc"
  "analysis/08_enrichment/01_standard_comparisons/03_manual_aggregated_named_clusters/02_version/03_test_between_clusters_pairwise/02_gsea/03_go_mf"
  "analysis/08_enrichment/01_standard_comparisons/03_manual_aggregated_named_clusters/02_version/03_test_between_clusters_pairwise/02_gsea/04_kegg"

  "analysis/08_enrichment/02_custom_comparisons/01_condition_1_vs_condition_2/01_ora/01_go_bp"
  "analysis/08_enrichment/02_custom_comparisons/01_condition_1_vs_condition_2/01_ora/02_go_cc"
  "analysis/08_enrichment/02_custom_comparisons/01_condition_1_vs_condition_2/01_ora/03_go_mf"
  "analysis/08_enrichment/02_custom_comparisons/01_condition_1_vs_condition_2/01_ora/04_kegg"
  "analysis/08_enrichment/02_custom_comparisons/01_condition_1_vs_condition_2/02_gsea/01_go_bp"
  "analysis/08_enrichment/02_custom_comparisons/01_condition_1_vs_condition_2/02_gsea/02_go_cc"
  "analysis/08_enrichment/02_custom_comparisons/01_condition_1_vs_condition_2/02_gsea/03_go_mf"
  "analysis/08_enrichment/02_custom_comparisons/01_condition_1_vs_condition_2/02_gsea/04_kegg"

  "analysis/09_extra/01_specific_genes_of_interest"



  # Bloque de Datos
  "data/01_reads/01_blc"
  "data/01_reads/02_fastq"
  "data/02_genome"
  "data/03_alignment_outputs/visium_cellranger"
  "data/04_processed_objects"
  "data/05_resources/01_metadata"
  "data/05_resources/02_annotations/dbs"
  "data/05_resources/02_annotations/manual"
  "data/05_resources/03_aditional_r_objects"
  "data/05_resources/04_documentation"



  # Bloque de Scripts
  "scripts/01_main"
  "scripts/02_functions"
  "scripts/03_extra"
)




#============================================================================================================
# Creación de directorios de forma iterativa
#============================================================================================================

echo ""
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
title2 "🏗️${TAB_4}Creación de la estructura de directorios para el proyecto"
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
info "🔹${TAB_4}Tipo de análisis: Transcriptómica Single-Cell RNA-Seq"
info "🔹${TAB_4}Nombre del proyecto: $PROJECT"
echo "⌛️${TAB_4}Creando directorios..."


for dir in "${DIRS[@]}"; do
  mkdir -p "$PROJECT/$dir"
done


success_b "✅${TAB_4}¡Estructura de directorios creada con éxito!"




#============================================================================================================
# Creación de archivos adicionales
#============================================================================================================

echo ""
echo ""
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
title2 "🏗️${TAB_4}Creación de archivos adicionales"
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"

# Crear archivos de metadatos
echo ""
title3 "📄${TAB_4}Creación de archivos de metadatos"
title3 "====================================="
info "⌛️${TAB_4}Generando archivos en data/04_resources/01_metadata..."

# Archivo 1: fastq_mapping.tsv
cat <<EOF > "$PROJECT/data/04_resources/01_metadata/fastq_mapping.tsv"
Sample_ID	Condition	Lane	FASTQ_R1	FASTQ_R2
Sample_01	NA	NA	<sample_name>_S<number>_L<lane>_R1_001.fastq.gz	<sample_name>_S<number>_L<lane>_R2_001.fastq.gz
Sample_02	NA	NA	<sample_name>_S<number>_L<lane>_R1_001.fastq.gz	<sample_name>_S<number>_L<lane>_R2_001.fastq.gz
EOF

success_b "✅${TAB_4}Archivo fastq_mapping.tsv generado correctamente"


# Archivo 2: sample_metadata.tsv
cat <<EOF > "$PROJECT/data/04_resources/01_metadata/sample_metadata.tsv"
Sample_ID	Condition	Replicate	Tissue	Age	Sex	Batch	Notes
Sample_01	NA	NA	NA	NA	NA	NA	NA
Sample_02	NA	NA	NA	NA	NA	NA	NA
EOF

success_b "✅${TAB_4}Archivo sample_metadata.tsv generado correctamente"




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
