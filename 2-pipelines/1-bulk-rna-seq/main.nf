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
println "Nombre del experimento -> ${params.nombre_experimento}"
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
            find "\$origen" -type f -size -300M -print0 | while IFS= read -r -d '' file; do
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
    tag "multiqc"

    // Carpeta destino
    publishDir "${params.outdir}/2-fastqc-report/results-multiqc", mode: 'copy'

    input:
    path fastqc_dir

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

process PROCESAR_RPKM {
    tag "Procesar ${nombre_experimento}_RPKM"

    // Carpeta destino
    publishDir "${params.outdir}/3-analisis-estadistico", mode: 'copy'

    input:
    val ruta_proyecto
    val nombre_experimento
    path r_script

    output:
    path "${nombre_experimento}_RPKM.txt"

    script:
    """
    Rscript ${r_script} \\
        "${ruta_proyecto}" \\
        "${nombre_experimento}" \\
        "./"
    """
}








/*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    4. Transformar archivo RPKM a CSV usando R
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
    fastqc_dir_ch = Channel.value(file("${params.ruta_proyecto}/Analisis/${params.nombre_experimento}/Pre_fastqc_results"))
    multiqc_out = MULTIQC(fastqc_dir_ch)


    // 3. Procesar RPKM
    nombre_experimento_ch = Channel.value(params.nombre_experimento)
    r_script_ch = Channel.fromPath("resources/1-essential/3-scripts/1-R/nextflow-code/procesar_rpkm.R")

    procesar_rpkm_out = PROCESAR_RPKM(ruta_proyecto_ch, nombre_experimento_ch, r_script_ch)


    // 4. Renderizar Quarto
    // Barrier: emite UNA SOLA VEZ cuando se han cerrado las tres salidas
    all_done_ch = copiar_out
        .mix(multiqc_out)
        .mix(procesar_rpkm_out)
        .collect()  // << espera a que terminen y emite una lista única
        .map { true }  // << la lista no nos importa; solo queremos un token

    // Canal con la ruta del directorio base donde se encuentra main.nf e index.qmd
    base_dir_ch = Channel.fromPath('.', checkIfExists: true)

    RENDER_QUARTO(base_dir_ch, all_done_ch)
}
