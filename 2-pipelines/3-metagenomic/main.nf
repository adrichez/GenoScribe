#!/usr/bin/env nextflow

/*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    Imprimir parámetros de nextflow.config
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*/

println " "
println "--------------------------------------------------------------------------------"
println "Output dir -> ${params.outdir}"
println "Ruta carpeta del proyecto -> ${params.ruta_proyecto}"
println "Tipo de análisis -> ${params.tipo_analisis}"
println "--------------------------------------------------------------------------------"
println "\n"








/*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1. Copiar archivos esenciales del proyecto a carpeta de trabajo
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*/

process COPIAR_CARPETA_PROYECTO {
    tag "copiar_proyecto"

    // Carpeta destino
    publishDir "${params.outdir}/1-project-data", mode: 'copy'

    input:
    val ruta_proyecto
    val project_name

    output:
    path project_name

    script:
    """
    set -euo pipefail

    mkdir -p "$project_name"

    carpetas=(
        "Analisis"
        "Documentacion"
        "Resultados"
    )

    for carpeta in "\${carpetas[@]}"; do
        origen="${ruta_proyecto}/\${carpeta}"
        destino="$project_name/\${carpeta}"

        if [ -d "\$origen" ]; then
            echo "Copiando carpeta: \$origen"
            mkdir -p "\$destino"
            find "\$origen" -type f -size -100M -print0 | while IFS= read -r -d '' file; do
                rel_path=\$(dirname "\${file#\$origen/}")
                mkdir -p "\$destino/\$rel_path"
                cp "\$file" "\$destino/\$rel_path/"
            done
        else
            echo "⚠ Carpeta no encontrada: \$origen"
        fi
    done
    """
}








/*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2. Proceso para ejecutar MultiQC sobre los resultados de FastQC
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*/

process MULTIQC {
    tag { tipo }

    publishDir "${params.outdir}/2-fastqc-report/results-multiqc-${tipo}", mode: 'copy'

    input:
    tuple val(tipo), path(fastqc_dir)

    output:
    path "multiqc_report.html"
    path "multiqc_data"

    script:
    """
    multiqc ${fastqc_dir} --export -o .
    """
}










/*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    3. Transformar archivo RPKM a CSV usando R
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*/

process RENDER_QUARTO {
    tag "render_quarto"

    // Carpeta destino
    publishDir "${params.outdir}/report", mode: 'copy'

    input:
    // Directorio base (donde están main.nf, index.qmd y resources)
    path base_dir
    val dummy_sync

    script:
    """
    cd ${base_dir}

    # Sobrescribir params.yml con los valores de nextflow.config
    cat > params.yml <<EOF
    ruta_proyecto: "${params.ruta_proyecto}"
    nombre_experimento: "${params.nombre_experimento}"
    EOF

    quarto render --execute-params params.yml
    """
}










/*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    Workflow principal
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*/

workflow {
    // 1. Copiar archivos esenciales del proyecto
    // Canal con la ruta del proyecto
    ruta_proyecto_ch = Channel.value(params.ruta_proyecto)

    // Extraer nombre de carpeta base para pasar al proceso
    project_name = params.ruta_proyecto.tokenize('/')[-1]
    project_name_ch = Channel.value(project_name)

    copiar_out = COPIAR_CARPETA_PROYECTO(ruta_proyecto_ch, project_name_ch)


    // 2. MultiQC
    // Mapa de rutas de FASTQC por tipo
    def fastqc_paths = [
        '16S': "${params.ruta_proyecto}/Analisis/miARma_16S/Pre_fastqc_results",
        '18S': "${params.ruta_proyecto}/Analisis/miARma_18S/Pre_fastqc_results",
        'ITS': "${params.ruta_proyecto}/Analisis/miARma_ITS/Pre_fastqc_results"
    ]

    // Determinar qué tipos lanzar según params.tipo_analisis
    def tipos_a_lanzar = []
    switch(params.tipo_analisis) {
        case 1: tipos_a_lanzar = ['16S']; break
        case 2: tipos_a_lanzar = ['18S']; break
        case 3: tipos_a_lanzar = ['ITS']; break
        case 4: tipos_a_lanzar = ['16S','18S']; break
        case 5: tipos_a_lanzar = ['16S','ITS']; break
        case 6: tipos_a_lanzar = ['18S','ITS']; break
        case 7: tipos_a_lanzar = ['16S','18S','ITS']; break
    }

    // Crear un canal con tuplas (tipo, ruta) para MultiQC
    Channel
        .fromList(tipos_a_lanzar.collect { tipo -> [tipo, file(fastqc_paths[tipo])] })
        .set { multiqc_inputs_ch }

    // Llamar al proceso MULTIQC usando el canal
    MULTIQC(multiqc_inputs_ch)
}
