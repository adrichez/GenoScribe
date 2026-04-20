#!/usr/bin/env nextflow

/*
############################################################################################################################################
    INFORMACIÓN DEL PIPELINE
############################################################################################################################################
*/

println ""
println "---------------------------------------------------------------------------------------------------------------"
println "Output dir -> ${params.outdir}"
println "Ruta carpeta del proyecto -> ${params.project_path}"
println "Idioma del informe -> ${params.report_language}"
println "Versión del informe -> ${params.report_version}"
println "---------------------------------------------------------------------------------------------------------------"
println "\n"








/*
############################################################################################################################################
    DEFINICIÓN DE PROCESOS
############################################################################################################################################
*/

/*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1. Copiar archivos esenciales del proyecto a carpeta de trabajo
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*/

process COPIAR_CARPETA_PROYECTO {
    tag "copiar_proyecto"

    // Carpeta destino
    publishDir "${params.outdir}/01-project-data", mode: 'copy'

    input:
    val project_path
    val project_name

    output:
    path project_name

    script:
    """
    set -euo pipefail

    mkdir -p "$project_name"

    carpetas=(
        "analysis"
        "data"
        "scripts"
    )

    for carpeta in "\${carpetas[@]}"; do
        origen="${project_path}/\${carpeta}"
        destino="$project_name/\${carpeta}"

        if [ -d "\$origen" ]; then
            echo "Copiando carpeta: \$origen"
            mkdir -p "\$destino"
            find "\$origen" -type f -size -200M \\
                -not -name "*.fastq" \\
                -not -name "*.fq" \\
                -not -name "*.fastq.gz" \\
                -not -name "*.gz" \\
                -not -name "*.ht2" \\
                -not -name "*.bai" \\
                -not -name "*.metrics" \\
                -not -name "*.bam" \\
                -not -name "*.sam" \\
                -not -name "*.cram" \\
                -not -name "*.vcf.gz" \\
                -print0 | while IFS= read -r -d '' file; do
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
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2. Proceso para crear el archivo params.yml necesario para renderizar con Quarto
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*/

process CREAR_PARAMS_YML {
    tag "crear_params_yml"

    // Publica el archivo en la carpeta raíz del proyecto
    publishDir "${workflow.projectDir}", mode: 'copy'

    input:
    val project_path
    val report_language
    val report_version

    output:
    path "params.yml", emit: params_file

    script:
    """
    cat <<EOF > params.yml
    project_path: "${project_path}"
    report_language: ${report_language}
    report_version: ${report_version}
    EOF
    """
}





/*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    3. Proceso para crear el archivo _quarto.yml necesario para renderizar con Quarto
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*/

process CREAR_QUARTO_YML {
    tag "crear_quarto_yml"

    // Directorio donde se publicará el archivo generado
    publishDir "${workflow.projectDir}", mode: 'copy'

    input:
    val report_language
    val report_version

    output:
    path "_quarto.yml", emit: quarto_yml

    script:
    """
    python ${workflow.projectDir}/resources/01-essential/03-scripts/05-python/yaml_generator.py \\
        ${report_language} \\
        ${report_version}
    """
}





/*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    4. Proceso para renderizar el informe con Quarto
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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

    quarto render --execute-params params.yml
    """
}








/*
############################################################################################################################################
    DEFINICIÓN DEL WORKFLOW
############################################################################################################################################
*/

workflow {
    // 1. Copiar archivos esenciales del proyecto
    // Canal con la ruta del proyecto
    project_path_ch = Channel.value(params.project_path)

    // Extraer nombre de carpeta base para pasar al proceso
    project_name = params.project_path.tokenize('/')[-1]
    project_name_ch = Channel.value(project_name)

    copiar_out = COPIAR_CARPETA_PROYECTO(project_path_ch, project_name_ch)





    // 2. Crear archivo params.yml para Quarto
    params_yml_out = CREAR_PARAMS_YML(params.project_path, params.report_language, params.report_version)





    // 3. Crear archivo _quarto.yml para Quarto
    quarto_yml_out = CREAR_QUARTO_YML(params.report_language, params.report_version)




    // 4. Renderizar informe con Quarto
    // Barrier: emite UNA SOLA VEZ cuando se han cerrado las tres salidas
    all_done_ch = copiar_out
        .mix(params_yml_out)
        .mix(quarto_yml_out)
        .collect()  // << espera a que terminen y emite una lista única
        .map { true }  // << la lista no nos importa; solo queremos un token

    // Canal con la ruta del directorio base donde se encuentra main.nf e index.qmd
    base_dir_ch = Channel.fromPath('.', checkIfExists: true)

    // Llamar al proceso RENDER_QUARTO
    RENDER_QUARTO(base_dir_ch, all_done_ch)
}
