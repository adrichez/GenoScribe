<p align="center">
  <img src="assets/1-bulk-rna-seq/bulk_rna_seq_cover.jpg" alt="GenoScribe — Banner: Generador de informes bioinformáticos" style="max-width:100%;height:auto;">
</p>

<div align="center">
  <h1>Sistema Inteligente y Reproducible de Generación de Informes Bioinformáticos</h1>
  <h2>Guía de Usuario para Análisis Bulk RNA-Seq</h2>

  <hr style="border:none; height:0.3px; background-color:#777; width:65%; margin:30px auto 35px auto;">

  <p>
    <a href="https://www.r-project.org/"><img src="https://img.shields.io/badge/R-276DC3?style=flat&logo=r&logoColor=white" alt="R"></a>
    <a href="https://rmarkdown.rstudio.com/"><img src="https://img.shields.io/badge/R%20Markdown-3EBB8D?style=flat&logo=r&logoColor=white" alt="R Markdown"></a>
    <a href="https://shiny.rstudio.com/"><img src="https://img.shields.io/badge/Shiny-FF4088?style=flat&logo=r&logoColor=white" alt="Shiny"></a>
    <a href="https://quarto.org/"><img src="https://img.shields.io/badge/Quarto-1DA1F2?style=flat&logo=quarto&logoColor=white" alt="Quarto"></a>
    <a href="https://www.python.org/"><img src="https://img.shields.io/badge/Python-3776AB?style=flat&logo=python&logoColor=white" alt="Python"></a>
    <a href="https://spacy.io/"><img src="https://img.shields.io/badge/SpaCy-3E8E41?style=flat&logo=spaCy&logoColor=white" alt="SpaCy"></a>
    <a href="https://jupyter.org/"><img src="https://img.shields.io/badge/Jupyter-F37626?style=flat&logo=jupyter&logoColor=white" alt="Jupyter"></a>
    <a href="https://www.w3.org/html/"><img src="https://img.shields.io/badge/HTML5-E34F26?style=flat&logo=html5&logoColor=white" alt="HTML5"></a>
    <a href="https://www.w3.org/Style/CSS/"><img src="https://img.shields.io/badge/CSS-1572B6?style=flat&logo=css3&logoColor=white" alt="CSS3"></a>
    <a href="https://www.javascript.com/"><img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=flat&logo=javascript&logoColor=black" alt="JavaScript"></a>
    <a href="https://www.d3js.org/"><img src="https://img.shields.io/badge/D3.js-F9A800?style=flat&logo=d3.js&logoColor=white" alt="D3.js"></a>
    <a href="https://www.nextflow.io/"><img src="https://img.shields.io/badge/Nextflow-1DA1F2?style=flat&logo=nextflow&logoColor=white" alt="Nextflow"></a>
    <a href="https://www.bioconductor.org/"><img src="https://img.shields.io/badge/Bioconductor-3EBB8D?style=flat&logo=bioconductor&logoColor=white" alt="Bioconductor"></a>
    <a href="https://docs.conda.io/en/latest/"><img src="https://img.shields.io/badge/Conda-77B8D8?style=flat&logo=anaconda&logoColor=white" alt="Conda"></a>
    <a href="https://www.docker.com/"><img src="https://img.shields.io/badge/Docker-2496ED?style=flat&logo=docker&logoColor=white" alt="Docker"></a>
    <a href="https://apptainer.org/"><img src="https://img.shields.io/badge/Apptainer-429999?style=flat&logo=apptainer&logoColor=white" alt="Apptainer"></a>
    <a href="https://www.markdownguide.org/"><img src="https://img.shields.io/badge/Markdown-000000?style=flat&logo=markdown&logoColor=white" alt="Markdown"></a>
    <a href="https://git-scm.com/"><img src="https://img.shields.io/badge/Git-F05032?style=flat&logo=git&logoColor=white" alt="Git"></a>
    <a href="https://github.com/adrichez/genoscribe"><img src="https://img.shields.io/badge/GitHub-181717?style=flat&logo=github&logoColor=white" alt="GitHub"></a>
    <a href="https://www.latex-project.org/"><img src="https://img.shields.io/badge/LaTeX-008080?style=flat&logo=latex&logoColor=white" alt="LaTeX"></a>
  </p>

  <p>
    <a href="#section-1">¿Qué es?</a> • 
    <a href="#section-2">Highlights</a> • 
    <a href="#section-3">Estructura</a> • 
    <a href="#section-4">Requisitos</a> • 
    <a href="#section-5">Workflow</a> • 
    <a href="#section-6">Quickstart</a> • 
    <a href="#section-7">Docs</a> • 
    <a href="#section-8">Tecnologías</a> • 
    <a href="#section-9">Objetivos</a> • 
    <a href="#section-10">Contacto</a>
  </p>
</div>





<br>
<br>

---

<h2 id="section-1">1. 📖 Introducción y contexto</h2>

El presente documento constituye la **guía de usuario** para el análisis de datos de **Bulk RNA-Seq** dentro del sistema **GenoScribe**.  
En él se explican los pasos, parámetros y consideraciones necesarias para ejecutar este tipo de análisis, desde la **descarga del proyecto** y la **construcción del contenedor**, hasta la **ejecución del pipeline** y la **generación del informe bioinformático final**.  

A diferencia de otras guías técnicas, el objetivo aquí no es solo indicar qué comandos ejecutar, sino también **ofrecer un marco conceptual y práctico** que permita comprender el valor del análisis y de los informes generados.  




<hr style="border:none; height:1px; background-color:#666; width:85%; margin:60px 0 30px 0;">

<h3 id="section-1-1">1.1 🧬 ¿Qué es Bulk RNA-Seq?</h3>  

El **Bulk RNA-Seq** es una técnica de secuenciación masiva de ARN que permite medir la **expresión génica global** en una muestra biológica.  
En lugar de analizar célula por célula (como ocurre en *single-cell RNA-Seq*), este método obtiene un **perfil promedio** de todas las células presentes en la muestra.  

🔹 **Aplicaciones principales del Bulk RNA-Seq:**  
- 📊 Comparación de expresión génica entre condiciones (ej. tratado vs. control).  
- 🔍 Identificación de **genes diferencialmente expresados (DEGs)**.  
- 🌱 Descubrimiento de **rutas biológicas activadas o reprimidas**.  
- 🧪 Estudio de perfiles transcriptómicos en **tejidos, órganos o líneas celulares**.  




<hr style="border:none; height:1px; background-color:#666; width:85%; margin:60px 0 30px 0;">

<h3 id="section-1-2">1.2 ❓ Ejemplo de pregunta biológica</h3>  

Un investigador puede plantear cuestiones como:  

👉 *“¿Qué genes cambian su expresión en plantas de **Arabidopsis thaliana** cuando se someten a estrés por sequía en comparación con plantas en condiciones normales?”*  

Con Bulk RNA-Seq es posible obtener la respuesta mediante:  
- La **cuantificación de lecturas** alineadas a genes o transcritos.  
- La identificación de **genes sobrerrepresentados o infrarepresentados**.  
- El análisis del impacto en **procesos biológicos y rutas metabólicas**.  




<hr style="border:none; height:1px; background-color:#666; width:85%; margin:60px 0 30px 0;">

<h3 id="section-1-3">1.3 🎯 Objetivo de esta guía</h3>  

El propósito de esta guía no es únicamente mostrar cómo ejecutar el pipeline, sino sobre todo:  

1. 📂 **Centralizar** los datos obtenidos o generados por herramientas bioinformáticas.  
2. 📝 **Transformar** esos resultados en un **informe automatizado, claro y reproducible**.  
3. 👩‍🔬 **Facilitar la comprensión** de los resultados para investigadores sin necesidad de explorar manualmente cada archivo de salida.  
4. 🌐 **Mejorar la comunicación científica**, generando informes listos para ser **compartidos en equipos de investigación, colaboraciones o incluso publicaciones**.  




<hr style="border:none; height:1px; background-color:#666; width:85%; margin:60px 0 30px 0;">

<h3 id="section-1-4">1.4 ✨ Valor añadido de GenoScribe</h3>  

Uno de los principales retos de los análisis bioinformáticos es que los resultados suelen presentarse en **archivos dispersos, de difícil lectura** o poco intuitivos para investigadores no especializados en programación.  

⚡️ Aquí es donde **GenoScribe marca la diferencia**:  
- Genera **informes interactivos** con gráficos, tablas y resúmenes claros.  
- Permite **reproducibilidad**: cualquier investigador puede volver a ejecutar el análisis con los mismos parámetros y obtener el mismo informe.  
- Hace que la **bioinformática sea más accesible**, transformando datos complejos en **conocimiento visual y compartible**.  

> 💡 **En resumen:** GenoScribe no solo ejecuta análisis, sino que **traduce la complejidad en información útil y comunicable**.






<br>
<br>

---

<h2 id="section-2">2. 📂 Proyecto en GitHub y requisitos</h2>

El proyecto **GenoScribe** está publicado en GitHub y se organiza de forma modular para separar:  
- la **interfaz de usuario** (app Shiny),  
- los **pipelines de análisis** (Nextflow + Quarto),  
- los **entornos reproducibles** (Docker / Apptainer),  
- la **documentación**,  
- y los **informes de ejemplo**.  

Esta organización permite que cada tipo de análisis (Bulk RNA-Seq, scRNA-Seq, Metagenómica) disponga de su propia carpeta con todo lo necesario para ser ejecutado, mantenido y extendido de manera independiente.




<hr style="border:none; height:1px; background-color:#666; width:85%; margin:60px 0 30px 0;">

<h3 id="section-2-1">2.1 🏗️ Estructura global del repositorio</h3>

```plaintext
genoscribe         # Directorio principal del proyecto
├── 1-app          # App Shiny e interfaz web
├── 2-pipelines    # Pipelines bioinformáticos (Bulk, scRNA, Metagenómica)
├── 3-containers   # Definición de entornos reproducibles (Docker / Apptainer)
├── 4-launch       # Scripts de ejecución (local, contenedor, HPC/cloud)
├── 5-examples     # Informes generados como referencia
├── 6-info         # Documentación técnica y especificaciones
└── README.md      # Guía general del proyecto
```

Cada directorio tiene un rol específico y está descrito con mayor detalle en el README general.




<hr style="border:none; height:1px; background-color:#666; width:85%; margin:60px 0 30px 0;">

<h3 id="section-2-2">2.2 🧬 Carpeta específica de Bulk RNA-Seq</h3>

El pipeline para este tipo de análisis se encuentra en [genoscribe/2-pipelines/1-bulk-rna-seq](../2-pipelines/1-bulk-rna-seq).

Dentro de esta carpeta se incluyen todos los recursos necesarios para ejecutar el análisis y generar informes Quarto:

```plaintext
1-bulk-rna-seq
├── _quarto.yml
├── index.qmd
├── main.nf
├── nextflow.config
├── params.yml
├── report
├── resources
│   ├── 1-essential
│   │   ├── 1-images
│   │   │   ├── 0-icono
│   │   │   │   ├── favicon.ico
│   │   │   │   └── favicon.svg
│   │   │   ├── 1-portada
│   │   │   │   └── bulk_rna_seq_cover.jpg
│   │   │   └── 2-inicio
│   │   │       └── miARma-Seq-workflow.png
│   │   ├── 2-archives
│   │   │   └── miARma_mRNAs_pipeline_STAR.txt
│   │   └── 3-scripts
│   │       ├── 1-R
│   │       │   ├── nextflow-code
│   │       │   │   └── procesar_rpkm.R
│   │       │   └── sections-code
│   │       │       ├── seccion4.R
│   │       │       └── seccion5.R
│   │       ├── 2-Quarto
│   │       │   ├── Tab2-Resumen
│   │       │   │   └── resumen.qmd
│   │       │   └── Tab3-Analisis
│   │       │       ├── 0-contexto.qmd
│   │       │       ├── 1-revision-inicial.qmd
│   │       │       ├── 2-evaluacion-calidad.qmd
│   │       │       ├── 3-alineamiento.qmd
│   │       │       ├── 4-cuantificacion.qmd
│   │       │       ├── 5-analisis-estadistico.qmd
│   │       │       ├── 5.1-normalizacion.qmd
│   │       │       ├── 5.2-evaluacion-calidad-normalizacion.qmd
│   │       │       ├── 5.3-analisis-expresion.qmd
│   │       │       ├── 5.4-analisis-funcional.qmd
│   │       │       └── 6-conclusiones.qmd
│   │       ├── 3-CSS
│   │       │   └── styles.css
│   │       └── 4-Python
│   │           └── html_tag_counter.ipynb
│   └── 2-nextflow-results
│       ├── 1-project-data
│       ├── 2-fastqc-report
│       └── 3-analisis-estadistico
├── run_cleaning_dir.sh
├── run_pipeline_shell.sh
└── run_pipeline_shiny.sh
```

Más en detalle, tenemos:

* **`main.nf`** → script principal en **Nextflow** que orquesta el pipeline de Bulk RNA-Seq.
* **`nextflow.config`** → configuración general (recursos, perfiles de ejecución, paths).
* **`params.yml`** → parámetros del pipeline (incluye rutas de entrada, metadatos y opciones clave).
* **`index.qmd`** → documento principal de Quarto que incluye el contenido de la pestaña inicial del informe.
* **`_quarto.yml`** → define la estructura del informe final generado con **Quarto**.
* **`report/`** → directorio donde se generará el informe HTML final.
* **`resources/`** → recursos organizados en:
  * `1-essential/` → imágenes (portada, iconos), scripts en R, Python y estilos CSS y demás plantillas Quarto el resto de pestañas.
  * `2-nextflow-results/` → directorios de salida de Nextflow (datos procesados, QC, estadísticos, copia de datos esenciales proporcionados por el usuario para la generación del informe).
* **(`run_pipeline_shell.sh` y `run_pipeline_shiny.sh`)** → permiten ejecutar el análisis directamente desde la terminal o integrarlo con la app Shiny con un simple comando.
* **`run_cleaning_dir.sh`** → script para limpiar los directorios de trabajo generados durante el análisis una vez finalizado si estos ya no son necesarios y así liberar espacio en disco.

📌 En paralelo, los resultados generados y un ejemplo completo pueden encontrarse en [genoscribe/5-examples/1-bulk-rna-seq](../5-examples/1-bulk-rna-seq).

Todo informe generado tendría la siguiente estructura:

```plaintext
1-bulk-rna-seq
├── index.html
├── resources
└── site_libs
```

Donde:

- `index.html` es el informe final generado por Quarto (abrir esto en el navegador).
- `resources/` contiene todos los recursos utilizados en el informe (imágenes, scripts, estilos, etc.).
- `site_libs/` incluye las bibliotecas necesarias para el correcto funcionamiento del informe.

Aquí se incluye un informe final (`index.html`) junto con los recursos asociados para comprender el **formato esperado de salida**.




<hr style="border:none; height:1px; background-color:#666; width:85%; margin:60px 0 30px 0;">

<h3 id="section-2-3">2.3 ⚙️ Requisitos básicos</h3>

Para ejecutar el pipeline de **Bulk RNA-Seq** se recomienda cumplir con los siguientes requisitos:

* **Sistema operativo**: Linux (recomendado Ubuntu ≥ 20.04) o macOS.
* **Software base**:

  * [Nextflow](https://www.nextflow.io/) ≥ 23.04
  * [Quarto](https://quarto.org/) ≥ 1.3
  * [R](https://www.r-project.org/) ≥ 4.2 con librerías de análisis transcriptómico (DESeq2, edgeR, limma, etc.).
  * [Python](https://www.python.org/) ≥ 3.9 (para scripts auxiliares).
* **Contenedores (opcional pero recomendado)**:

  * Docker ≥ 24.0 o
  * Apptainer (Singularity) ≥ 1.1
* **Recursos hardware**:

  * Mínimo 16 GB de RAM.
  * Procesador con ≥ 4 núcleos.
  * Espacio en disco: **50-100 GB** dependiendo del número de muestras y tamaño de los FASTQ.

💡 **Nota**: Todos los entornos y dependencias están preconfigurados en los contenedores (`3-containers/`), lo que permite ejecutar el pipeline sin necesidad de instalar manualmente las dependencias.















<br>
<br>

---

## 3. Workflow del análisis

* **Diagrama de flujo esquemático** que muestre:
  Entrada de datos → Selección de ejecución (Local / HPC / Nube) → Ejecución directa o en contenedor → Pipeline → Informe final.
* Explicación de las distintas **rutas de uso** (ejecución directa vs contenedores).

## 4. Descarga y preparación del entorno

* Cómo clonar el proyecto desde GitHub.
* Instalación de dependencias (si aplica).
* Creación del contenedor (Docker / Apptainer).
* 📸 **GIF ilustrativo** de la descarga y setup.

## 5. Métodos de uso

* **Ejecución de la app** (modo interactivo).
* **Ejecución desde la terminal** (con ejemplos de comandos).
* Ejecución en **Local vs HPC/Nube**.
* 📸 GIF de ejemplo mostrando el flujo de ejecución.

## 6. Parámetros específicos

* Parámetros que requiere este análisis (ej.: estructura de carpetas a adjuntar, ficheros esperados).
* Ejemplos prácticos de carpetas de entrada y cómo deben organizarse.
* Explicación de la procedencia de los datos (p.ej. outputs de **miARMA-Seq** u otro pipeline externo).

## 7. Etapas del pipeline

* Breve descripción de las fases internas (QC, alineamiento, cuantificación, DEG, enriquecimiento, etc. según el caso).
* Ejemplo de outputs intermedios.

## 8. Resultados e informe

* Descripción del **informe generado**:

  * Qué incluye (tablas, gráficas, resúmenes).
  * Ejemplos de resultados relevantes.
* 📸 GIF mostrando un informe real (scroll animado).

## 9. Comentarios finales

* Objetivos de este módulo dentro del proyecto.
* Limitaciones / futuras mejoras.

## 10. Contacto

* Datos de contacto o cómo reportar issues en GitHub.
