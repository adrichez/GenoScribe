<p align="center">
  <img src="assets/02-analyses/01-transcriptomics/01-bulk-rna-seq/transcriptomics_bulk_rna_seq_cover_guide.png" alt="Banner Bulk RNA-Seq" style="max-width:100%; height:auto; border-radius: 10px;">
</p>

<div align="center">
  <h1 style="color: #5283e3;">Sistema Inteligente y Reproducible para la Generación de Informes Bioinformáticos</h1>
  <h2 style="color: #5fa2dd;">Guía de Usuario para el Análisis Transcriptómico de Bulk RNA-Seq</h2>

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
    <a href="https://github.com/adrichez/GenoScribe"><img src="https://img.shields.io/badge/GitHub-181717?style=flat&logo=github&logoColor=white" alt="GitHub"></a>
    <a href="https://www.latex-project.org/"><img src="https://img.shields.io/badge/LaTeX-008080?style=flat&logo=latex&logoColor=white" alt="LaTeX"></a>
  </p>

  <p>
    <a href="#section-1">Introducción</a> • 
    <a href="#section-2">Requisitos</a> • 
    <a href="#section-3">Workflow</a> • 
    <a href="#section-4">Descarga</a> • 
    <a href="#section-5">Métodos</a> • 
    <a href="#section-6">Parámetros</a> • 
    <a href="#section-7">Estructura</a> • 
    <a href="#section-8">Pipeline</a> • 
    <a href="#section-8">Informe</a> • 
    <a href="#section-10">Comentarios</a> • 
    <a href="#section-11">Contacto</a>
  </p>
</div>






<br>
<br>

<img src="assets/03-common/decoration/linea_divisoria_1.png" width="100%" style="border-radius: 10px;">

<h2 id="section-1">1. 📖 Introducción y contexto</h2>

El presente documento constituye la **guía de usuario** para el análisis transcriptómico de datos de **Bulk RNA-Seq** dentro del sistema **GenoScribe**.  

En él se explican los pasos, parámetros y consideraciones necesarias para ejecutar este tipo de análisis, desde la **descarga del proyecto** y la **construcción del contenedor**, hasta la **ejecución del pipeline** y la **generación del informe bioinformático final**.  

A diferencia de otras guías técnicas, el objetivo aquí no es solo indicar qué comandos ejecutar, sino también **ofrecer un marco conceptual y práctico** que permita comprender el valor del análisis y de los informes generados.  




<br>

<img src="assets/03-common/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-1.1">1.1. 🧬 ¿Qué es la Transcriptómica?</h3>  

La **Transcriptómica** es el campo de estudio que analiza el conjunto completo de ARN expresado en una célula, tejido o muestra biológica en un momento determinado. Este conjunto de ARN, conocido como **transcriptoma**, refleja qué genes están activos y en qué nivel de expresión.

A diferencia de la genómica, que estudia el ADN (información potencial), la transcriptómica analiza la **información funcional en acción**, permitiendo comprender cómo responde un sistema biológico ante diferentes condiciones, estímulos o patologías.

Actualmente, existen tres grandes enfoques tecnológicos para estudiar el transcriptoma:

📊 **Bulk RNA-Seq** → Analiza la expresión promedio de todas las células de una muestra.  
🧫 **Single-Cell RNA-Seq (scRNA-Seq)** → Analiza la expresión génica a nivel de célula individual.  
📍 **Transcriptómica Espacial** → Integra expresión génica con información de localización dentro del tejido.

Aunque esta guía se centra exclusivamente en **Bulk RNA-Seq**, es importante entender estas diferencias para contextualizar el tipo de análisis que se está realizando.




<br>

<img src="assets/03-common/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-1.2">1.2. 📊 ¿Qué es Bulk RNA-Seq?</h3>  

El análisis transcriptómico de **Bulk RNA-Seq** es una técnica de secuenciación masiva de ARN que permite medir la **expresión génica global** en una muestra biológica completa.

En lugar de analizar célula por célula, este método obtiene un **perfil promedio de expresión** de todas las células presentes en la muestra. Esto significa que los niveles de expresión observados representan una señal agregada.

El flujo general del análisis incluye:

- 📥 **Secuenciación de ARN** y generación de lecturas.
- 🧬 **Alineamiento o pseudoalineamiento** contra un genoma o transcriptoma de referencia.
- 📊 **Cuantificación de expresión** a nivel de gen o transcrito.
- 📈 **Análisis de expresión diferencial** entre condiciones experimentales.

🔹 **Aplicaciones principales del Bulk RNA-Seq:**  
- 📊 Comparación de expresión génica entre condiciones (ej. tratado vs. control).  
- 🔍 Identificación de **genes diferencialmente expresados (DEGs)**.  
- 🌱 Descubrimiento de **rutas biológicas activadas o reprimidas**.  
- 🧪 Estudio de perfiles transcriptómicos en **tejidos completos, órganos o líneas celulares homogéneas**.  

🔹 **Ventajas principales:**  
- Mayor robustez estadística cuando se analizan tejidos homogéneos.  
- Menor complejidad computacional que enfoques de célula única.  
- Coste más accesible en comparación con single-cell o transcriptómica espacial.

🔹 **Limitaciones:**  
- No permite identificar heterogeneidad celular.  
- Las diferencias observadas pueden estar influenciadas por cambios en proporciones celulares.




<br>

<img src="assets/03-common/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-1.3">1.3. 🔬 Bulk vs Single-Cell vs Transcriptómica Espacial</h3>  

Aunque todas estas técnicas estudian el transcriptoma, no analizan el mismo fenómeno biológico.  
La diferencia clave radica en la **unidad de análisis**, el nivel de **resolución biológica** y el tipo de interpretación que permiten: promedio global, célula individual o contexto espacial.



<hr style="border:none; height:1.5px; background-color:#777; width:100%; margin:35px 0 20px 0;">

<h4 id="section-1.3.1">1.3.1. 📊 Bulk RNA-Seq</h4>

Bulk RNA-Seq analiza el ARN total extraído de una muestra completa, generando un **perfil promedio de expresión génica**. La señal observada representa la suma agregada de todas las células presentes, lo que proporciona una medida robusta y estadísticamente estable para comparar condiciones experimentales.  

Es especialmente adecuado cuando el interés está en identificar **cambios globales en la expresión génica** o cuando el tejido es relativamente homogéneo. Sin embargo, al promediar la señal, se pierde información sobre la heterogeneidad celular y no es posible determinar qué tipos celulares contribuyen a cada cambio detectado.



<hr style="border:none; height:1.5px; background-color:#777; width:100%; margin:35px 0 20px 0;">

<h4 id="section-1.3.2">1.3.2. 🧫 Single-Cell RNA-Seq (scRNA-Seq)</h4>

Single-Cell RNA-Seq analiza la expresión génica en **células individuales**, descomponiendo una muestra en sus distintas poblaciones celulares. Este enfoque permite identificar subtipos celulares, estados transcripcionales específicos y dinámicas de diferenciación o activación.  

A diferencia de Bulk, la señal deja de ser un promedio y pasa a representarse como una distribución de perfiles individuales. Esto aporta una resolución biológica mucho mayor, pero también implica mayor complejidad analítica, mayor variabilidad técnica y un coste experimental superior.



<hr style="border:none; height:1.5px; background-color:#777; width:100%; margin:35px 0 20px 0;">

<h4 id="section-1.3.3">1.3.3. 📍 Transcriptómica Espacial</h4>

La transcriptómica espacial incorpora, además de la expresión génica, la **información de localización dentro del tejido**, preservando su arquitectura. Esto permite estudiar no solo qué genes se expresan y en qué células, sino también **dónde ocurre esa expresión** y cómo se organizan las poblaciones celulares en su microambiente.  

Es el enfoque más completo en términos de contexto biológico, pero también el más exigente desde el punto de vista experimental, tecnológico y computacional.



<hr style="border:none; height:1.5px; background-color:#777; width:100%; margin:35px 0 20px 0;">

<h4 id="section-1.3.4">1.3.4. ⚡️ Resumen</h4>

La siguiente tabla resume sus diferencias principales:

| Característica | Bulk RNA-Seq | Single-Cell RNA-Seq | Transcriptómica Espacial |
|----------------|--------------|---------------------|---------------------------|
| **Unidad de análisis** | Muestra completa | Célula individual | Célula o región espacial |
| **Resolución biológica** | Promedio global | Alta (nivel celular) | Alta + contexto espacial |
| **Heterogeneidad celular** | No detectable directamente | Detectable | Detectable + localización |
| **Complejidad analítica** | Media | Alta | Muy alta |
| **Costo experimental** | Moderado | Alto | Muy alto |
| **Tipo de pregunta principal** | Cambios globales entre condiciones | Identificación de subpoblaciones | Organización y arquitectura tisular |

Esta guía aborda exclusivamente el análisis de **Bulk RNA-Seq**, por lo que el pipeline y el informe generado están diseñados para responder a preguntas de expresión génica a nivel global de muestra.




<br>

<img src="assets/03-common/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-1.4">1.4. ❓ Ejemplo de pregunta biológica</h3>  

Un investigador puede plantear cuestiones como:  

👉 *“¿Qué genes cambian su expresión en plantas de **Arabidopsis thaliana** cuando se someten a estrés por sequía en comparación con plantas en condiciones normales?”*  

Con Bulk RNA-Seq es posible obtener la respuesta mediante:  
- La **cuantificación de lecturas** alineadas a genes o transcritos.  
- La identificación de **genes sobrerrepresentados o infrarepresentados**.  
- El análisis del impacto en **procesos biológicos y rutas metabólicas**.  




<br>

<img src="assets/03-common/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-1.5">1.5. 🎯 Objetivo de esta guía</h3>  

El propósito de esta guía no es únicamente mostrar cómo ejecutar el pipeline, sino sobre todo:  

1. 📂 **Centralizar** los datos obtenidos o generados por herramientas bioinformáticas.  
2. 📝 **Transformar** esos resultados en un **informe automatizado, claro y reproducible**.  
3. 👩‍🔬 **Facilitar la comprensión** de los resultados para investigadores sin necesidad de explorar manualmente cada archivo de salida.  
4. 🌐 **Mejorar la comunicación científica**, generando informes listos para ser **compartidos en equipos de investigación, colaboraciones o incluso publicaciones**.  




<br>

<img src="assets/03-common/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-1.4">1.4. ✨ Valor añadido de GenoScribe</h3>  

Uno de los principales retos de los análisis bioinformáticos es que los resultados suelen presentarse en **archivos dispersos, de difícil lectura** o poco intuitivos para investigadores no especializados en programación.  

⚡️ Aquí es donde **GenoScribe marca la diferencia**:  
- Genera **informes interactivos** con gráficos, tablas y resúmenes claros.  
- Permite **reproducibilidad**: cualquier investigador puede volver a ejecutar el análisis con los mismos parámetros y obtener el mismo informe.  
- Hace que la **bioinformática sea más accesible**, transformando datos complejos en **conocimiento visual y compartible**.  

> [!NOTE]
> **En resumen:** GenoScribe no solo ejecuta análisis, sino que **traduce la complejidad en información útil y comunicable**.






<br>
<br>

<img src="assets/03-common/decoration/linea_divisoria_1.png" width="100%" style="border-radius: 10px;">

<h2 id="section-2">2. 📂 Proyecto en GitHub y requisitos</h2>

El proyecto **GenoScribe** está publicado en GitHub y se organiza de forma modular para separar:  
- la **interfaz gráfica de usuario** (app Shiny),  
- los **pipelines de análisis** (Nextflow + Quarto),  
- los **entornos reproducibles** (Docker / Apptainer),  
- los **scripts de ejecución**,
- los **informes de ejemplo**,
- y la **documentación**. 

Esta organización permite que cada tipo de análisis **(Transcriptómica, Metagenómica, Metatranscriptómica, etc.)** y sus subtipos, dispongan de su propia carpeta con todo lo necesario para ser ejecutado, mantenido y extendido de manera independiente.




<br>

<img src="assets/03-common/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-2.1">2.1. 🏗️ Estructura global del repositorio</h3>

```plaintext
GenoScribe         # Directorio principal del proyecto
├── 01-app         # App Shiny e interfaz web
├── 02-pipelines   # Pipelines bioinformáticos
├── 03-containers  # Definición de entornos reproducibles (Docker / Apptainer)
├── 04-launch      # Scripts de ejecución (local, contenedor, HPC/cloud)
├── 05-examples    # Estructuras base e informes de ejemplo
├── 06-info        # Documentación técnica y especificaciones
└── README.md      # Guía general del proyecto
```

Cada directorio tiene un rol específico y está descrito con mayor detalle en el [README](../README.md) general.




<br>

<img src="assets/03-common/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-2.2">2.2. 🧬 Carpeta específica del pipeline de Bulk RNA-Seq</h3>

El pipeline para este tipo de análisis se encuentra en [GenoScribe/02-pipelines/01-transcriptomics/01-bulk-rna-seq](../02-pipelines/01-transcriptomics/01-bulk-rna-seq).

Dentro de esta carpeta se incluyen todos los recursos necesarios para ejecutar el análisis y generar informes Quarto:

```plaintext
01-bulk-rna-seq
├── _quarto.yml
├── index_en.qmd
├── index_es.qmd
├── main.nf
├── nextflow.config
├── params.yml
├── report
├── resources
│   ├── 01-essential
│   │   ├── 01-images
│   │   │   ├── icons
│   │   │   │   ├── bot_blue.png
│   │   │   │   ├── bot_white.png
│   │   │   │   ├── favicon_form.ico
│   │   │   │   ├── favicon_form.svg
│   │   │   │   ├── favicon.ico
│   │   │   │   ├── favicon.svg
│   │   │   │   └── ipbln.png
│   │   │   ├── tab0-inicio
│   │   │   │   ├── transcriptomics_bulk_rna_seq_cover_report.jpg
│   │   │   │   └── transcriptomics_bulk_rna_seq_cover_report.mp4
│   │   │   ├── tab1-metodologia
│   │   │   │   └── miARma_Seq_workflow.png
│   │   │   ├── tab2-resumen
│   │   │   └── tab3-analisis
│   │   ├── 02-archives
│   │   │   ├── 01-fixed
│   │   │   │   ├── tab0-inicio
│   │   │   │   ├── tab1-metodologia
│   │   │   │   ├── tab2-resumen
│   │   │   │   └── tab3-analisis
│   │   │   └── 02-tmp
│   │   │       ├── tab0-inicio
│   │   │       ├── tab1-metodologia
│   │   │       ├── tab2-resumen
│   │   │       └── tab3-analisis
│   │   └── 03-scripts
│   │       ├── 01-r
│   │       │   ├── 01-sections-code
│   │       │   │   ├── seccion4.R
│   │       │   │   └── seccion5.R
│   │       │   └── 02-nextflow-code
│   │       ├── 02-quarto
│   │       │   ├── 01-spanish-language
│   │       │   │   ├── 01-full-version
│   │       │   │   │   ├── tab1-metodologia
│   │       │   │   │   │   └── metodologia.qmd
│   │       │   │   │   ├── tab2-resumen
│   │       │   │   │   │   └── resumen.qmd
│   │       │   │   │   └── tab3-analisis
│   │       │   │   │       ├── 00-contexto.qmd
│   │       │   │   │       ├── 01-revision-inicial.qmd
│   │       │   │   │       ├── 02-evaluacion-calidad.qmd
│   │       │   │   │       ├── 03-alineamiento.qmd
│   │       │   │   │       ├── 04-cuantificacion.qmd
│   │       │   │   │       ├── 05.0-analisis-estadistico.qmd
│   │       │   │   │       ├── 05.1-normalizacion.qmd
│   │       │   │   │       ├── 05.2-evaluacion-calidad-normalizacion.qmd
│   │       │   │   │       ├── 05.3-analisis-expresion.qmd
│   │       │   │   │       ├── 05.4-analisis-funcional.qmd
│   │       │   │   │       └── 06-conclusiones.qmd
│   │       │   │   └── 02-compact-version
│   │       │   │       ├── tab2-resumen
│   │       │   │       │   └── resumen.qmd
│   │       │   │       └── tab3-analisis
│   │       │   │           ├── 00-contexto.qmd
│   │       │   │           ├── 01-revision-inicial.qmd
│   │       │   │           ├── 02-evaluacion-calidad.qmd
│   │       │   │           ├── 03-alineamiento.qmd
│   │       │   │           ├── 04-cuantificacion.qmd
│   │       │   │           ├── 05.0-analisis-estadistico.qmd
│   │       │   │           ├── 05.1-normalizacion.qmd
│   │       │   │           ├── 05.2-evaluacion-calidad-normalizacion.qmd
│   │       │   │           ├── 05.3-analisis-expresion.qmd
│   │       │   │           ├── 05.4-analisis-funcional.qmd
│   │       │   │           └── 06-conclusiones.qmd
│   │       │   └── 02-english-language
│   │       │       ├── 01-full-version
│   │       │       │   ├── tab1-metodologia
│   │       │       │   │   └── metodologia.qmd
│   │       │       │   ├── tab2-resumen
│   │       │       │   │   └── resumen.qmd
│   │       │       │   └── tab3-analisis
│   │       │       │       ├── 00-contexto.qmd
│   │       │       │       ├── 01-revision-inicial.qmd
│   │       │       │       ├── 02-evaluacion-calidad.qmd
│   │       │       │       ├── 03-alineamiento.qmd
│   │       │       │       ├── 04-cuantificacion.qmd
│   │       │       │       ├── 05.0-analisis-estadistico.qmd
│   │       │       │       ├── 05.1-normalizacion.qmd
│   │       │       │       ├── 05.2-evaluacion-calidad-normalizacion.qmd
│   │       │       │       ├── 05.3-analisis-expresion.qmd
│   │       │       │       ├── 05.4-analisis-funcional.qmd
│   │       │       │       └── 06-conclusiones.qmd
│   │       │       └── 02-compact-version
│   │       │           ├── tab2-resumen
│   │       │           │   └── resumen.qmd
│   │       │           └── tab3-analisis
│   │       │               ├── 00-contexto.qmd
│   │       │               ├── 01-revision-inicial.qmd
│   │       │               ├── 02-evaluacion-calidad.qmd
│   │       │               ├── 03-alineamiento.qmd
│   │       │               ├── 04-cuantificacion.qmd
│   │       │               ├── 05.0-analisis-estadistico.qmd
│   │       │               ├── 05.1-normalizacion.qmd
│   │       │               ├── 05.2-evaluacion-calidad-normalizacion.qmd
│   │       │               ├── 05.3-analisis-expresion.qmd
│   │       │               ├── 05.4-analisis-funcional.qmd
│   │       │               └── 06-conclusiones.qmd
│   │       ├── 03-css
│   │       │   └── styles.css
│   │       ├── 04-javascript
│   │       │   ├── chatbot.js
│   │       │   ├── embeddings_web_reduced.js
│   │       │   ├── english_responses.js
│   │       │   ├── script.js
│   │       │   └── spanish_responses.js
│   │       ├── 05-python
│   │       │   ├── html_tag_counter.ipynb
│   │       │   └── yaml_generator.py
│   │       └── 06-bash
│   │           └── run_report_server.sh
│   └── 02-nextflow-results
│       ├── 01-project-data
│       ├── 02-multiqc-report
│       └── 03-analisis-estadistico
├── run_cleaning_dir.sh
├── run_pipeline_shell.sh
└── run_pipeline_shiny.sh
```

Más en detalle, tenemos:

* **`main.nf`** **&rArr;** script principal de **Nextflow** que orquesta el pipeline de Bulk RNA-Seq.
* **`nextflow.config`** **&rArr;** configuración general de **Nextflow** (recursos, perfiles de ejecución, paths).
* **`params.yml`** **&rArr;** parámetros para este tipo de análisis específico (incluye rutas de entrada, metadatos y opciones clave).
* **`_quarto.yml`** **&rArr;** define la estructura del informe final generado con **Quarto**.
* **`index.qmd`** **&rArr;** documento principal de Quarto que incluye el contenido de la pestaña inicial del informe.
* **`report/`** **&rArr;** directorio donde se generará el informe HTML final.
* **`resources/`** **&rArr;** recursos organizados en:
  * `01-essential/` **&rArr;** imágenes (portada, iconos), scripts en R, Python y estilos CSS y demás plantillas Quarto el resto de pestañas.
  * `02-nextflow-results/` **&rArr;** directorios de salida de Nextflow (datos procesados, QC, estadísticos, copia de datos esenciales proporcionados por el usuario para la generación del informe).
* **(`run_pipeline_shell.sh` y `run_pipeline_shiny.sh`)** **&rArr;** permiten ejecutar el análisis directamente desde la terminal o integrarlo con la app Shiny con un simple comando.
* **`run_cleaning_dir.sh`** **&rArr;** script para limpiar los directorios de trabajo generados durante el análisis una vez finalizado si estos ya no son necesarios y así liberar espacio en disco.

📌 En paralelo, un ejemplo completo de este tipo de informe puede encontrarse en [GenoScribe/05-examples/02-reports/01-transcriptomics/01-bulk-rna-seq](../05-examples/02-reports/01-transcriptomics/01-bulk-rna-seq).

Todo informe generado tendría la siguiente estructura:

```plaintext
report
├── resources
├── site_libs
└── index.html
```

Donde:

- `resources/` contiene todos los recursos utilizados en el informe (imágenes, scripts, estilos, etc.).
- `site_libs/` incluye las bibliotecas necesarias para el correcto funcionamiento del informe.
- `index.html` es el informe final generado por Quarto (abrir esto en el navegador).

Adicionalmente, como se ha mencionado en el `README.md` general del proyecto, cada informe tiene incorporado un **Mini Chatbot RAG (Recuperación Augmentada por IA)** que permite al usuario interactuar y hacer preguntas relativas a la información contenida en el informe generado, además de disponer de información adicional sobre el sistema GenoScribe y temas relacionados con la bioinformática y el análisis de datos de secuenciación masiva.

Para que este Chatbot funcione correctamente, es necesario que el informe HTML se abra en un servidor local (necesario disponer de un entorno Python instalado), y para ello se ha diseñado un script específico llamado `run_report_server.sh` que se encuentra en `resources/01-essential/03-scripts/05-python/`, el cual puede lanzarse simplemente con doble clic o desde la terminal para iniciar un servidor local y abrir el informe en el navegador con todas sus funcionalidades activas (incluido el Chatbot).

El comando para ejecutar este script desde la terminal es:

```bash
cd resources/01-essential/03-scripts/05-python/
./run_report_server.sh
```

Y automáticamente abrirá el informe en el navegador predeterminado del sistema, con todas las funcionalidades activas.




<br>

<img src="assets/03-common/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-2.3">2.3. ⚙️ Requisitos básicos</h3>

Antes de utilizar el sistema y ejecutar el pipeline de **Bulk RNA-Seq** asegúrese de contar con los siguientes elementos para garantizar un funcionamiento correcto y reproducible:

* 📦 **Docker o Apptainer** **&rArr;** imprescindibles para construir y ejecutar los **contenedores** que incluyen la aplicación Shiny, los pipelines y todas las dependencias bioinformáticas.

  * **Docker** **&rarr;** recomendado para entornos de desarrollo, uso local y en la nube.
  * **Apptainer (antes Singularity)** **&rarr;** recomendado en clústeres HPC o entornos donde Docker no está permitido.

* 💻 **Terminal / Línea de comandos** **&rArr;** utilizada para lanzar los scripts y gestionar la ejecución de los contenedores.

  * Compatible con **macOS, Linux y Windows**.
  * En Windows se recomienda **WSL2 (Windows Subsystem for Linux)**, **Git Bash** o **PowerShell** con soporte adecuado para contenedores.

* 🌐 **Navegador web moderno** **&rArr;** necesario para explorar los **informes HTML interactivos**.

  * Se recomienda **Google Chrome** o **Firefox**.
  * Safari y Edge son compatibles pero pueden presentar limitaciones con algunos gráficos **D3.js** o en la visualización de algunos archivos incrustados.

* 📶 **Conexión a internet** **&rArr;** (opcional) necesaria si:

  * Desea descargar datos de referencia o bases externas durante la ejecución de un pipeline (normalmente no será necesario ya que esto se hace antes de generar el informe).
  * Si quiere descargar o actualizar imágenes de contenedores.
  * El sistema también puede ejecutarse **100% offline** si ya cuenta con los recursos necesarios preinstalados.

* 💾 **Recursos mínimos recomendados** **&rArr;** para un uso fluido en los análisis típicos tratados:

  * **RAM**: ≥ ideal ≥ 8 GB.
  * **CPU**: ≥ 4 núcleos.
  * **Almacenamiento**: ≥ 30 GB libres (la imagen del contenedor pesa unos 16 GB para la versión en docker y unos 4 GB para el archivo `.sif` de Apptainer).

> [!NOTE]
> Con estos requisitos cumplidos, la instalación y ejecución del sistema es directa y garantiza que todos los elementos interactivos de los informes funcionen de manera correcta y reproducible.






<br>
<br>

<img src="assets/03-common/decoration/linea_divisoria_1.png" width="100%" style="border-radius: 10px;">

<h2 id="section-3">3. 🔄 Workflow del análisis</h2>

El **workflow de GenoScribe** describe el recorrido completo desde la preparación de los datos hasta la obtención del informe interactivo final. Incluye decisiones clave como el **entorno de ejecución**, el uso de **contenedores** y la elección de la **interfaz de usuario**.




<br>

<img src="assets/03-common/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-3.1">3.1. 📝 Diagrama general</h3>

El siguiente **diagrama de flujo esquemático** representa las rutas disponibles para ejecutar GenoScribe (centrándonos en el **pipeline de Bulk RNA-Seq**):

<p align="center">
  <img src="assets/03-common/workflows/output/specific/transcriptomics_bulk_rna_seq_workflow_gris.png" alt="Diagrama del flujo de trabajo para Análisis Transcriptómico de Bulk RNA-Seq" width="65%" style="border-radius: 10px;">
</p>

<br>

**🗒️ Recorrido resumido:**

* 💻 **Ejecución en PC:**  

  * Directamente en el **ordenador** o dentro de un **contenedor** (recomendado).
  * Contenedores disponibles en **Docker** o **Apptainer**.
  * Interacción mediante **terminal (CLI, Shell)** o **interfaz gráfica (GUI, Shiny)**.

* 🖥️ **Ejecución en HPC / Nube:**  

  * Mediante un **cluster** o dentro de un **contenedor** (recomendado).
  * Contenedores disponibles en **Docker** o **Apptainer** (este último más común en HPC y recomendado).
  * Interacción mediante **terminal (CLI, Shell)** o **interfaz gráfica (GUI, Shiny)**.

> [!TIP]
> Ejecutar siempre dentro de un **contenedor** garantiza **reproducibilidad**, aislamiento de dependencias y facilita la gestión. La ejecución directa (sin contenedor) se recomienda solo para pruebas o debugging.
> En HPC/Cloud pueden requerirse pasos adicionales, como cargar **módulos del sistema** o configurar variables de entorno, para asegurar que todas las dependencias estén disponibles.

Una vez que el usuario ha definido el entorno de ejecución de **GenoScribe** (local o clúster) y ha decidido si emplear o no la tecnología de contenedores, el siguiente paso es proporcionar los **parámetros de configuración** que orquestarán el análisis. Esta interacción puede llevarse a cabo a través de dos interfaces distintas:

* 🖥️ **Interfaz Gráfica (GUI, Shiny) &rArr;** Un entorno visual, guiado e intuitivo, ideal para usuarios menos experimentados, aunque con un despliegue ligeramente más lento.
* 💻 **Interfaz de Línea de Comandos (CLI, Shell) &rArr;** Una ejecución directa mediante consola, mucho más rápida, ligera y perfecta para la automatización en servidores.

Tras acceder a la interfaz deseada, la arquitectura modular de GenoScribe requiere que el usuario navegue por un proceso de selección en dos niveles. Primero, se selecciona la **Categoría Ómica** principal y, a continuación, el **Tipo de Análisis** específico:

🧬 **1. Transcriptómica**
  * 📊 **1.1. Bulk RNA-Seq &rArr;** Analiza la expresión génica promediada de un tejido o población celular completa, proporcionando una visión global de los cambios transcripcionales.
  * 🧫 **1.2. Single-Cell RNA-Seq (scRNA-Seq) &rArr;** Disecciona la expresión a nivel de célula individual, revelando la heterogeneidad oculta, subpoblaciones raras y dinámicas de linaje.
  * 📍 **1.3. Spatial Transcriptomics (ST-RNA-Seq) &rArr;** Integra los perfiles de expresión génica con la arquitectura histológica, mapeando exactamente en qué coordenada física del tejido ocurre cada proceso molecular.

🦠 **2. Metagenómica**
  * 🧩 **2.1. Shotgun Metagenomics &rArr;** Secuencia todo el ADN genómico presente en una muestra ambiental o clínica, perfilando tanto la taxonomía completa como el potencial funcional de la comunidad.
  * 🏷️ **2.2. Amplicones (16S/18S/ITS) &rArr;** Secuenciación dirigida exclusivamente a genes marcadores, ideal para realizar censos taxonómicos eficientes de bacterias, arqueas o ecosistemas fúngicos.

🔬 **3. Metatranscriptómica**
  * 🧪 **3.1. Shotgun Metatranscriptomics &rArr;** Captura el ARN mensajero de una comunidad microbiana, revelando no solo "quién está ahí", sino "qué genes están expresando activamente" en respuesta a su entorno.

Una vez definida esta ruta (ej. *Transcriptómica > Bulk RNA-Seq*), el sistema desplegará el formulario correspondiente para configurar los parámetros biológicos y técnicos de ese *pipeline* en concreto. La ejecución culminará con la **generación de un informe HTML interactivo**, unificado y listo para su exploración.

<br>

**🧑‍🏫 Resumen conceptual del workflow actualizado:**

1. Preparación y validación de los **datos de entrada** (crudos o procesados).
2. Elección del **entorno de ejecución** (Estación de trabajo local vs. Servidor/HPC).
3. Decisión sobre el uso de **contenedores** (Docker/Apptainer) o entorno nativo.
4. Selección de la **interfaz de control** (GUI Shiny interactiva o CLI automatizada).
5. Selección de la **Categoría Ómica** (Transcriptómica, Metagenómica o Metatranscriptómica).
6. Elección del **Pipeline Específico** (Bulk, scRNA, Shotgun, Amplicones, etc.).
7. Configuración de **parámetros analíticos** y lanzamiento del módulo.
8. Obtención del **informe HTML interactivo** final.




<br>

<img src="assets/03-common/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-3.2">3.2. 📐 Pasos resumidos</h3>

Para adaptarse a las distintas necesidades y entornos de trabajo, **GenoScribe** ofrece tres modalidades de ejecución principales empleando contenedores (garantizando así la máxima reproducibilidad computacional). Antes de comenzar a detallar cada flujo, estas son las opciones disponibles:

1. **🖼️ Interfaz Gráfica Interactiva (GUI, Shiny):** Ideal para usuarios que prefieren un entorno visual y amigable en el navegador web.
2. **🖥️ Interfaz de Terminal Interactiva (CLI Formulario):** Perfecta para trabajar rápidamente desde la consola mediante un menú guiado paso a paso.
3. **⚙️ Interfaz de Terminal Directa (CLI Directo):** Diseñada para entornos de supercomputación (HPC), permitiendo lanzar el proceso de forma desatendida mediante argumentos, ideal para gestores de colas como SLURM.

A continuación, se detalla el esquema lógico paso a paso de cada una de ellas:


<br>

**1. 🖼️ Interfaz gráfica interactiva (GUI, Shiny)**

Este flujo muestra la ejecución típica del sistema empleando la **interfaz gráfica web de Shiny** para rellenar el formulario de parámetros:

```ascii
→ Descargar repositorio GenoScribe desde GitHub.
   → Construir o descargar la imagen y contenedor (Docker/Apptainer).
   → Ejecutar el script "04-launch/02-docker/run_app_shiny_form.sh" o "04-launch/03-apptainer/run_app_shiny_form.sh".
   → Se despliega el servidor Shiny y se expone en el puerto 3838.
   → Acceder a la interfaz web a través del navegador local (localhost:3838).
   → Seleccionar de forma visual el tipo de análisis a reportar.
   → Rellenar las cajas de texto y menús desplegables con los parámetros del proyecto.
   → Pulsar el botón de ejecución para que Shiny lance el pipeline de Nextflow subyacente.
   → Se generan los outputs estadísticos y el informe HTML interactivo.
   → Acceder, descargar y explorar el informe final.
```


<br>

**2. 🖥️ Interfaz de terminal interactiva (CLI, Shell Formulario)**

Si se prefiere prescindir del navegador web pero se desea mantener una **guía paso a paso**, este flujo interactivo en consola es la opción adecuada:

```ascii
→ Descargar repositorio GenoScribe desde GitHub.
   → Construir o descargar la imagen y contenedor (Docker/Apptainer).
   → Ejecutar el script "04-launch/02-docker/run_app_shell_form.sh" o "04-launch/03-apptainer/run_app_shell_form.sh".
   → Se despliega un menú interactivo directamente en la terminal de comandos.
   → Seleccionar numéricamente el tipo de análisis deseado.
   → Introducir los parámetros solicitados por pantalla (rutas, nombres, versiones).
   → Al finalizar el cuestionario, el script lanza automáticamente el pipeline de Nextflow.
   → Se generan los outputs estadísticos y el informe HTML interactivo.
   → Acceder y explorar el informe final en el directorio del proyecto.
```


<br>

**3. ⚙️ Interfaz de terminal directa (CLI, Shell Directo)**

Esta es la modalidad más robusta y automatizable. En lugar de responder a un formulario interactivo, todos los parámetros se proporcionan de una sola vez mediante banderas (*flags*) en la misma línea de ejecución. Esto permite **integrar GenoScribe en scripts de envío (`sbatch`)** y delegar su ejecución al gestor de colas del clúster (ej. SLURM), optimizando los recursos y permitiendo configurar alertas automáticas (ej. correos al finalizar el trabajo).

```ascii
→ Descargar repositorio GenoScribe desde GitHub.
   → Construir o descargar la imagen y contenedor (Docker/Apptainer).
   → Preparar un script de envío para el clúster (sbatch) o abrir la terminal.
   → Ejecutar "run_app_shell_direct.sh" pasando los parámetros con banderas (ej. -oc 1 -at 1 -pp /ruta...).
   → El script valida los argumentos silenciosamente sin requerir interacción humana (modo desatendido).
   → El sistema inyecta las variables y lanza el pipeline de Nextflow de forma nativa.
   → Se generan los outputs estadísticos y el informe HTML interactivo en segundo plano.
   → El gestor de colas finaliza el trabajo (y opcionalmente notifica al usuario).
   → Acceder y explorar el informe final en el directorio del proyecto.
```

Estos esquemas permiten **visualizar rápidamente** la secuencia completa de pasos, ayudando a seleccionar la modalidad que mejor se adapte a su infraestructura (ordenador personal, servidor interactivo o nodo de computación HPC).




<br>

<img src="assets/03-common/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-3.3">3.3. 🎬 Demostración visual</h3>

El siguiente **GIF** ofrece una visión dinámica del flujo principal: inicio de la app Shiny, completado del formulario, selección del análisis y ejecución del pipeline dentro del contenedor. El proceso finaliza con la **generación automática del informe HTML interactivo** y su exploración en el navegador.

<p align="center">
  <img src="assets/02-analyses/01-transcriptomics/01-bulk-rna-seq/transcriptomics_bulk_rna_seq_demo_process.gif" alt="Demostración flujo de trabajo GenoScribe" width="65%" style="border-radius: 10px;">
</p>

> [!NOTE]
> Este GIF es una **guía visual rápida** y no muestra todos los pasos intermedios ni outputs secundarios. Para información completa, incluyendo **entradas, salidas y parámetros específicos**, continuar leyendo más adelante, donde se profundizará con más detalle en estos aspectos.




<br>
<br>

<img src="assets/03-common/decoration/linea_divisoria_1.png" width="100%" style="border-radius: 10px;">

<h2 id="section-4">4. ⬇️ Descarga y preparación del entorno</h2>

Antes de ejecutar cualquier análisis con **GenoScribe**, es necesario obtener el repositorio completo y asegurarse de que todas las dependencias estén disponibles. Esta sección describe cómo **clonar o descargar el repositorio**, así como los pasos iniciales de preparación del entorno, tanto para usuarios que trabajen **en local** como aquellos que utilicen **HPC o la nube**.

El objetivo es que cualquier usuario pueda iniciar GenoScribe de manera rápida y reproducible, con un flujo de trabajo consistente y control sobre versiones y actualizaciones. Además, se facilita la construcción de contenedores **(Docker o Apptainer)**, que aseguran un entorno aislado y preconfigurado, evitando conflictos de dependencias y problemas de compatibilidad.

Dicho esto, comenzamos en el siguiente apartado comentando cómo obtener el código fuente del proyecto.




<br>

<img src="assets/03-common/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-4.1">4.1. 🐙 Clonar o descargar el repositorio</h3>

Existen varias formas de obtener todo el código, pipelines y archivos necesarios para iniciar **GenoScribe**. Las dos opciones principales son:

* **🧑‍💻 Clonar con Git** **&rArr;** recomendado para usuarios habituales de Git y desarrolladores.
* **⬇️ Descargar ZIP desde GitHub** **&rArr;** opción sencilla para usuarios menos familiarizados con Git.

A continuación se detallan ambos métodos.



<hr style="border:none; height:1.5px; background-color:#777; width:100%; margin:35px 0 20px 0;">

<h4 id="section-4.1.1">4.1.1. 🧑‍💻 Clonar con Git (recomendado)</h4>

La opción más flexible y recomendable es **clonar el repositorio**, lo que permite mantenerlo actualizado fácilmente y gestionar versiones mediante `git pull`.

```bash
git clone https://github.com/adrichez/GenoScribe.git
cd GenoScribe
```

Una vez realizado esto, en el caso de que se quieran obtener también los archivos de ejemplo ubicados en la carpeta `05-examples/02-reports/`, se puede ejecutar el siguiente comando dentro del directorio clonado:

```bash
git lfs pull
```

Estos archivos se encuentran almacenados con **Git LFS (Large File Storage)** debido a su tamaño, por lo que es necesario tener instalado Git LFS previamente. Para más información sobre su instalación, consulte [https://git-lfs.github.com/](https://git-lfs.github.com/).

> [!NOTE]
> **Ventaja:** facilita actualizaciones y control de versiones, ideal para usuarios que planean ejecutar el sistema regularmente o integrar nuevas funcionalidades.



<hr style="border:none; height:1.5px; background-color:#555; width:100%; margin:35px 0 20px 0;">

<h4 id="section-4.1.2">4.1.2. ⬇️ Descargar ZIP desde GitHub</h4>

Para un uso puntual o en sistemas sin Git, se puede descargar el ZIP directamente:

1. Acceda a [https://github.com/adrichez/GenosSribe](https://github.com/adrichez/GenoScribe).
2. Pulse **Code &rArr; Download ZIP**.
3. Descomprime y accede a la carpeta desde la terminal.

> [!NOTE]
> Esta opción es más limitada para actualizaciones, pero útil para pruebas rápidas o entornos donde Git no está disponible. Además hay que tener en cuenta que mediante esta opción no se obtendrán los archivos grandes almacenados con Git LFS.




<br>

<img src="assets/03-common/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-4.2">4.2. 🛠️ Instalación de dependencias</h3>

GenoScribe requiere diversas herramientas y librerías para ejecutar correctamente los pipelines y generar los informes interactivos. La instalación depende del **modo de ejecución** elegido: dentro de un contenedor **(Docker o Apptainer)** o directamente en el **sistema local sin contenedor**.



<hr style="border:none; height:1.5px; background-color:#777; width:100%; margin:35px 0 20px 0;">

<h4 id="section-4.2.1">4.2.1. 📦 Dentro de contenedor (Docker / Apptainer)</h4>

Si se ejecuta GenoScribe dentro de un contenedor, **todas las dependencias ya están preinstaladas**. Esto incluye:

* Nextflow para la ejecución de pipelines.
* R con paquetes necesarios para análisis y generación de informes (shiny, tidyverse, ggplot2, DT, plotly, entre otros).
* Python y librerías bioinformáticas como `pandas`, `numpy`, `scipy`, `scanpy`, `biopython`.
* Quarto CLI para renderizar informes HTML interactivos.
* MultiQC para resumen de calidad de secuencias.
* Miniconda/Mamba y entornos específicos para análisis (por ejemplo, `genoscribe` environment).

> [!NOTE]
> **Ventaja:** el contenedor garantiza un entorno reproducible y controlado, sin conflictos de dependencias. Esta es la opción **recomendada** para la ejecución de pipelines, tanto en local como en HPC o nube.



<hr style="border:none; height:1.5px; background-color:#777; width:100%; margin:35px 0 20px 0;">

<h4 id="section-4.2.2">4.2.2. 💻 Sin contenedor (local)</h4>

Ejecutar GenoScribe directamente en el sistema local requiere instalar manualmente todas las herramientas y librerías. Esto se puede deducir del **Dockerfile**, que lista los paquetes y dependencias necesarias:

* **Nextflow** **&rArr;** se instala con `curl -s https://get.nextflow.io | bash`.
* **R y RStudio** **&rArr;** incluyendo paquetes clave como `shiny`, `tidyverse`, `ggplot2`, `plotly`, `DT`, `dplyr`, `readxl`, `stringr`, `purrr`, `quarto`, `rmarkdown`, entre otros.
* **Python 3** y librerías bioinformáticas **&rArr;** `pandas`, `numpy`, `scipy`, `scanpy`, `biopython`.
* **Quarto CLI** **&rArr;** se descarga e instala desde [quarto.org](https://quarto.org).
* **Conda / Mamba** **&rArr;** para gestión de entornos y creación de entornos específicos (por ejemplo, `env_genoscribe.yml`).
* **Paquetes del sistema** **&rArr;** herramientas de compilación (`libssl-dev`, `libcurl4-openssl-dev`, `libxml2-dev`, `pkg-config`), Java (`openjdk-17-jre-headless`), utilidades (`curl`, `git`, `unzip`, `nano`, `less`).

> [!NOTE]
> Esta opción es más propensa a errores de instalación y conflictos de dependencias, y se recomienda principalmente **para depuración, desarrollo o pruebas rápidas**. Para análisis reproducibles y robustos, el uso de contenedores es siempre preferible.



<hr style="border:none; height:1.5px; background-color:#777; width:100%; margin:35px 0 20px 0;">

<h4 id="section-4.2.3">4.2.3. 📝 Resumen y recomendaciones</h4>

1. **Contenedor** **&rArr;** opción recomendada, ideal para producción, local/HPC/nube o ejecución repetida: reproducible, seguro y listo para usar.
2. **Local sin contenedor** **&rArr;** solo para pruebas, desarrollo o depuración: requiere instalación manual de todas las dependencias y configuración cuidadosa del entorno.

> [!TIP]
> **Consejo práctico:** aunque se ofrece la opción de ejecución local sin contenedor, **la instalación y mantenimiento de dependencias puede ser compleja**. Construir y ejecutar el contenedor simplifica enormemente este proceso y asegura resultados consistentes.




<br>

<img src="assets/03-common/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-4.3">4.3. 🏗️ Construcción del contenedor</h3>

GenoScribe puede ejecutarse en **Docker** o adaptarse a **Apptainer**. La lógica principal está planteada en Docker, pero se proporcionan instrucciones para convertir la imagen a Apptainer, ideal para entornos HPC.

Dicho esto, se comienza explicando cómo construir/obtener la imagen Docker, para luego detallar la conversión/obtención de la imagen Apptainer.



<hr style="border:none; height:1.5px; background-color:#777; width:100%; margin:35px 0 20px 0;">

<h4 id="section-4.3.1">4.3.1. 🐳 Contenedor Docker</h4>

En este caso, podemos optar por obtener la imagen de dos formas diferentes:

* **🛠️ Construir la imagen localmente** a partir del Dockerfile.
* **⬇️ Descargar una imagen preconstruida** desde Docker Hub (recomendado).

A continuación se detallan ambas opciones.


<br>

**🛠️ Construir imagen localmente:**

Para construir la imagen Docker desde el Dockerfile incluido en el repositorio, ejecute:

```bash
cd GenoScribe
docker build --no-cache -f 03-containers/02-docker/Dockerfile -t adrichez/genoscribe:latest .
```

Esto construirá la imagen con todas las dependencias necesarias y estará disponible localmente bajo la etiqueta `adrichez/genoscribe:latest` en su sistema Docker.


<br>

**⬇️ Descargar imagen preconstruida:**

Para evitar tiempos de construcción largos, puede descargar la imagen ya construida y alojada en Docker Hub:

```bash
docker pull adrichez/genoscribe:latest
```

Esto descargará la imagen directamente a su sistema Docker, lista para usarse.

Y así, una vez que se dispone de la imagen Docker, se puede proceder a ejecutar los scripts de lanzamiento que se describen en la siguiente sección.

> [!NOTE]
> Siempre es recomendable descargar la imagen preconstruida para evitar tiempos de construcción largos y asegurar que se cuenta con la versión más reciente y estable.



<hr style="border:none; height:1.5px; background-color:#777; width:100%; margin:35px 0 20px 0;">

<h4 id="section-4.3.2">4.3.2. 🛡️ Contenedor Apptainer</h4>

Dado que la lógica principal de GenoScribe está planteada en Docker, para crear la imagen Apptainer se debe **convertir la imagen Docker previamente construida o descargada**. Esto garantiza que ambas imágenes sean equivalentes en cuanto a dependencias y funcionalidad.

Esto lo podemos realizar de varias formas, algunas de ellas pueden ser:

* **🛠️ Construir la imagen Apptainer a partir de una imagen Docker local**: primero se debe haber construido la imagen Docker desde el Dockerfile incluido en el repositorio o tenerla descargada en el sistema. Esta opción requiere disponer de Docker, ya que Apptainer utilizará la imagen local para generar el contenedor `.sif`.

* **🔄 Convertir la imagen Docker desde Docker Hub a formato Apptainer**: Apptainer puede descargar directamente la imagen desde Docker Hub y crear la versión `.sif`, sin necesidad de tener Docker instalado localmente. Esta es la **opción recomendada**, sencilla y reproducible.

* **⬇️ Descargar una imagen Apptainer preconstruida**: se puede obtener directamente un contenedor `.sif` alojado en un servidor externo, por ejemplo **Mega**. Esta es la forma más rápida y simple, ideal para usuarios que solo quieran ejecutar GenoScribe sin construir imágenes.


A continuación se detallan estas tres opciones.


<br>

**🛠️ Construir Apptainer desde imagen Docker local:**

Para construir la imagen Apptainer a partir de una imagen Docker local, primero debe haber construido la imagen Docker desde el Dockerfile incluido en el repositorio exactamente como se ha indicado anteriormente:

```bash
cd GenoScribe
docker build --no-cache -f 03-containers/02-docker/Dockerfile -t adrichez/genoscribe:latest .
```

o bien, haber descargada previamente la imagen desde Docker Hub:

```bash
docker pull adrichez/genoscribe:latest
```

Una vez que la imagen Docker está disponible localmente, se puede generar la versión Apptainer `.sif` mediante:

```bash
cd GenoScribe/03-containers/03-apptainer
apptainer build genoscribe-lab.sif docker-daemon://adrichez/genoscribe:latest
```

Donde:

* `docker-daemon://` **&rArr;** indica que Apptainer tomará la imagen directamente desde el daemon de Docker local.
* `genoscribe-lab.sif` **&rArr;** será el contenedor Apptainer resultante, listo para ejecutarse en entornos HPC.

> [!NOTE]
> Esta opción requiere Docker instalado y en ejecución, pero garantiza que la imagen Apptainer sea idéntica a la Docker.


<br>

**🔄 Convertir imagen Docker desde Docker Hub:**

Si no se desea construir o tener Docker instalado localmente, Apptainer permite descargar directamente la imagen desde Docker Hub y convertirla en `.sif`:

```bash
cd GenoScribe/03-containers/03-apptainer
apptainer pull genoscribe-lab.sif docker://adrichez/genoscribe:latest
```

* No requiere Docker instalado ni ejecutándose en el sistema.
* Apptainer descargará la imagen desde Docker Hub y la convertirá automáticamente en `.sif`.
* Esta es la opción **recomendada** por su simplicidad y reproducibilidad.

> [!NOTE]
> Se necesita conexión a Internet y permisos de escritura en el directorio donde se generará `genoscribe-lab.sif`.


<br>

**⬇️ Descargar imagen Apptainer preconstruida:**

La forma más rápida de obtener el contenedor Apptainer es descargar directamente una imagen `.sif` ya construida desde un servidor externo. En este caso, la imagen está alojada en **Mega** y se puede descargar empleando la herramienta `megatools`, que permite obtener archivos directamente desde MEGA mediante línea de comandos.

Primero, instala `megatools` (si aún no está disponible en tu sistema) utilizando **Homebrew**:

```bash
brew install megatools
```

Una vez instalada la herramienta, descarga la imagen `.sif` con el siguiente comando:

```bash
cd GenoScribe/03-containers/03-apptainer
megadl "https://mega.nz/file/oVliDKQR#3bXVPKVuLtugL30WfUthMDf_AvQWxL4VXnIgWHt9-5Y"
```

Esto descargará automáticamente el archivo `genoscribe.sif` en el directorio actual.

Alternativamente, también se puede descargar manualmente desde el navegador web accediendo al siguiente enlace: 👉 **[https://mega.nz/file/oVliDKQR#3bXVPKVuLtugL30WfUthMDf_AvQWxL4VXnIgWHt9-5Y](https://mega.nz/file/oVliDKQR#3bXVPKVuLtugL30WfUthMDf_AvQWxL4VXnIgWHt9-5Y)** y después una vez descargado el archivo, ubicarlo en el directorio correspondiente (`cd GenoScribe/03-containers/03-apptainer`) para su posterior uso.

Así, algunas de las ventajas de esta opción son:

* No requiere Docker ni construcción local.
* Ideal para usuarios que solo quieren ejecutar GenoScribe sin preocuparse por la creación de imágenes.
* Recomendable verificar la fuente y la integridad de la imagen antes de usarla en producción.

> [!NOTE]
> Este método es especialmente útil en entornos HPC donde no se permite construir imágenes localmente o se carece de permisos de administrador.



<hr style="border:none; height:1.5px; background-color:#777; width:100%; margin:35px 0 20px 0;">

<h4 id="section-4.3.3">4.3.3. 🎬 Visualización del proceso (GIF)</h4>

El flujo completo, desde la **construcción de la imagen hasta la generación del informe con la interfaz gráfica de Shiny**, se puede visualizar en el **GIF de ejemplo** mostrado en el apartado anterior de **<a href="#section-3.3">Demostración visual</a>**. En ese caso específico, dicha imagen se construyó de manera local a partir del Dockerfile, pero como ya hemos mencionado antiormente, existen distintas formas de obtener la imagen del contenedor (tanto Docker como Apptainer).

> [!NOTE]
> 📌 Ilustra todo el proceso de preparación del entorno, permitiendo comprender de manera visual la secuencia de pasos recomendada.






<br>
<br>

<img src="assets/03-common/decoration/linea_divisoria_1.png" width="100%" style="border-radius: 10px;">

<h2 id="section-5">5. 🚀 Métodos de uso</h2>

GenoScribe ofrece distintos modos de ejecución según el perfil del usuario y el entorno disponible. 

Una vez descargado el repositorio y construido el contenedor (si se opta por su uso), el siguiente paso es **poner en marcha GenoScribe**.  
Para adaptarse a los diferentes perfiles de usuario y arquitecturas computacionales, existen tres modalidades principales de ejecución:  

* 🖼️ **Interfaz Gráfica Interactiva (GUI, Formulario Shiny):** Ofrece una experiencia visual y guiada en el navegador web.  
* 🖥️ **Interfaz de Terminal Interactiva (CLI, Formulario Shell):** Despliega un menú guiado paso a paso directamente en la consola.
* ⚙️ **Interfaz de Terminal Directa (CLI, Directo):** Recibe todos los parámetros en una sola línea de comandos, ideal para flujos automatizados y gestores de colas en entornos HPC.

A su vez, cada una de estas tres opciones puede ejecutarse de tres formas distintas según el nivel de aislamiento deseado: **en local sin contenedor**, **dentro de un contenedor Docker**, o **dentro de un contenedor Apptainer**.

A continuación se detallan exhaustivamente estas modalidades y sus respectivos métodos de despliegue.




<br>

<img src="assets/03-common/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-5.1">5.1. 🖼️ Ejecución mediante interfaz gráfica (GUI, Formulario Shiny)</h3>

La interfaz gráfica de **GenoScribe** está desarrollada en **R Shiny**, lo que permite ejecutar la aplicación en un servidor local o dentro de un contenedor, mostrando una interfaz web interactiva accesible desde el navegador. Esta opción está pensada para usuarios que prefieren una experiencia visual y guiada, ideal para explorar resultados, generar informes o realizar ajustes sin necesidad de usar comandos manuales.



<hr style="border:none; height:1.5px; background-color:#777; width:100%; margin:35px 0 20px 0;">

<h4 id="section-5.1.1">5.1.1. 💻 Ejecución en local sin contenedor</h4>

En esta modalidad, la aplicación se ejecuta directamente en el entorno local del usuario, sin usar contenedores.  
Es ideal para pruebas rápidas, desarrollo o entornos donde ya se tienen instaladas las dependencias necesarias.

Para lanzar la interfaz:

```bash
cd GenoScribe
./04-launch/01-local/run_app_shiny_form.sh
```

o bien:

```bash
cd GenoScribe/04-launch/01-local/
./run_app_shiny_form.sh
```

Este script iniciará el servidor Shiny en el puerto configurado (por defecto `localhost:3838`) y abriendo automáticamente dicho formulario en el navegador web predeterminado con la finalidad de proporcionar los parámetros necesarios para generar los informes. Además, si por cualquier caso no se abre automáticamente, se puede acceder manualmente a través de la URL: 👉 **[http://localhost:3838/app](http://localhost:3838/app)**.

> [!IMPORTANT]
> Asegúrese de tener instaladas todas las dependencias de R indicadas en la sección de instalación, así como permisos de ejecución para el script (`chmod +x` si fuera necesario).



<hr style="border:none; height:1.5px; background-color:#777; width:100%; margin:35px 0 20px 0;">

<h4 id="section-5.1.2">5.1.2. 🐳 Ejecución dentro de un contenedor Docker</h4>

Esta opción es la más conveniente para entornos donde se desea **aislar las dependencias** o garantizar la **reproducibilidad**.
Docker se encargará de lanzar la aplicación en un entorno controlado con todas las librerías preinstaladas.

Ejecute el siguiente script:

```bash
cd GenoScribe
./04-launch/02-docker/run_app_shiny_form.sh
```

o bien:

```bash
cd GenoScribe/04-launch/02-docker/
./run_app_shiny_form.sh
```

El script realiza automáticamente los siguientes pasos:

1. Comprueba si la imagen `adrichez/genoscribe:latest` está disponible localmente.
2. Si no lo está, la descarga desde **Docker Hub**.
3. Lanza un contenedor con los puertos correspondientes mapeados (por defecto `3838:3838`) para acceder desde el navegador a `http://localhost:3838`.

De igual modo que anteriormente, este script abrirá automáticamente la aplicación Shiny en el navegador predeterminado. Si no lo hace, puede acceder manualmente a través de: 👉 **[http://localhost:3838/app](http://localhost:3838/app)**.

> [!NOTE]
> No se requiere disponer de dependencias locales, ya que todo se ejecuta dentro del contenedor.

> [!IMPORTANT]
> Asegúrese de que el servicio Docker esté activo antes de ejecutar el script.



<hr style="border:none; height:1.5px; background-color:#777; width:100%; margin:35px 0 20px 0;">

<h4 id="section-5.1.3">5.1.3. 🛡️ Ejecución dentro de un contenedor Apptainer</h4>

Esta modalidad está pensada principalmente para entornos **HPC (High Performance Computing)**, donde el uso de Docker no suele estar permitido.
Apptainer permite ejecutar el mismo entorno de GenoScribe en formato `.sif`, garantizando portabilidad y compatibilidad en sistemas con restricciones.

Para ejecutar la app con Apptainer:

```bash
cd GenoScribe
./04-launch/03-apptainer/run_app_shiny_form.sh
```

o bien:

```bash
cd GenoScribe/04-launch/03-apptainer/
./run_app_shiny_form.sh
```

El script ejecuta internamente el siguiente flujo:

1. Comprueba la existencia del archivo `genoscribe-lab.sif` en el directorio actual.
2. Si no lo encuentra, intenta generar el contenedor `.sif` a partir de la imagen disponible en Docker Hub.
3. Inicia la aplicación Shiny dentro del entorno Apptainer, mapeando el puerto local (`3838`) y los directorios de trabajo necesarios.

Una vez iniciado, se puede acceder desde cualquier navegador web a: 👉 **[http://localhost:3838](http://localhost:3838)**.

En este caso, dado que está pensado para ejecuciones en servidores o clústeres, es posible que necesite configurar un túnel SSH para redirigir el puerto local al servidor remoto donde se está ejecutando la aplicación. Para hacer esto, por ejemplo en el caso específico del cluster Halowan del IPB-CSIC, puede usar el siguiente comando desde su máquina local:

```bash
# Crear túnel SSH para acceder a la aplicación Shiny en el cluster
ssh -L 3838:localhost:3838 -J user@halowan.ipb.csic.es user@nodo0X
```

Donde `user` es su nombre de usuario en el cluster y `nodo0X` es el nodo donde se está ejecutando la aplicación. Una vez realizado esto, ya sí podrá acceder al formulario web desde su navegador local en el enlace indicado anteriormente.

> [!NOTE]
> **Ventaja:** permite ejecutar GenoScribe en sistemas sin Docker, manteniendo la reproducibilidad y sin requerir permisos de root.

> [!TIP]
> **Recomendación:** use esta opción en clústeres, servidores multiusuario o infraestructuras con control estricto de software.




<br>

<img src="assets/03-common/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-5.2.">5.2. 💻 Ejecución mediante terminal de forma interactiva (CLI, Formulario Shell)</h3>

Además de la interfaz gráfica, **GenoScribe** puede ejecutarse directamente desde la **terminal (modo CLI o Shell)**.  
Esta modalidad permite lanzar los análisis o pipelines de forma más directa y automatizada, mostrando un formulario básico en texto donde el usuario introduce los parámetros necesarios para la ejecución.

Está especialmente pensada para:

* usuarios que prefieren trabajar en consola o entornos sin entorno gráfico,
* automatizar procesos en scripts o pipelines,
* y entornos **HPC o de servidor remoto** donde emplear una interfaz web puede ser más complejo y requiere realizar pasos adicionales como configurar túneles SSH, ya comentado anteriormente.



<hr style="border:none; height:1.5px; background-color:#777; width:100%; margin:35px 0 20px 0;">

<h4 id="section-5.2.1">5.2.1. 💻 Ejecución en local sin contenedor</h4>

En este modo, GenoScribe se ejecuta directamente en el entorno local, sin necesidad de contenedores.  
El formulario de entrada aparece directamente en la terminal, permitiendo introducir los parámetros paso a paso (por ejemplo, ruta de entrada, tipo de análisis, parámetros de configuración, etc.).

Para lanzar la aplicación en modo Shell:

```bash
cd GenoScribe
./04-launch/01-local/run_app_shell_form.sh
```

o bien:

```bash
cd GenoScribe/04-launch/01-local/
./run_app_shell_form.sh
```

Durante la ejecución, el script mostrará en la terminal las distintas opciones disponibles y solicitará la introducción de los valores correspondientes.
Una vez completado el formulario, el sistema iniciará automáticamente el pipeline o flujo de trabajo especificado.

> [!IMPORTANT]
> Asegúrese de tener instaladas las dependencias necesarias de R y bash indicadas en la sección de instalación, así como permisos de ejecución para el script (`chmod +x` si fuera necesario).



<hr style="border:none; height:1.5px; background-color:#777; width:100%; margin:35px 0 20px 0;">

<h4 id="section-5.2.2">5.2.2. 🐳 Ejecución dentro de un contenedor Docker</h4>

Esta opción es ideal para mantener la reproducibilidad y evitar conflictos de dependencias.
La aplicación se ejecutará en modo texto dentro del contenedor, utilizando exactamente el mismo entorno de ejecución que en la versión gráfica, pero sin interfaz web.

Para ejecutarla:

```bash
cd GenoScribe
./04-launch/02-docker/run_app_shell_form.sh
```

o bien:

```bash
cd GenoScribe/04-launch/02-docker/
./run_app_shell_form.sh
```

El script realiza automáticamente las siguientes tareas:

1. Comprueba si la imagen `adrichez/genoscribe:latest` está disponible localmente.
2. Si no lo está, la descarga desde **Docker Hub**.
3. Lanza el contenedor en modo interactivo (`-it`), permitiendo al usuario introducir los parámetros directamente desde la terminal.
4. Ejecuta el formulario CLI dentro del contenedor, mostrando las opciones disponibles paso a paso.

Durante la ejecución, los resultados generados se guardarán automáticamente en los directorios montados desde el sistema local, garantizando la persistencia de los datos.

> [!NOTE]
> **Ventaja:** no requiere tener instaladas dependencias locales, y se ejecuta en un entorno controlado y reproducible.

> [!IMPORTANT]
> **Nota:** asegúrese de que el servicio Docker esté activo antes de ejecutar el script.



<hr style="border:none; height:1.5px; background-color:#777; width:100%; margin:35px 0 20px 0;">

<h4 id="section-5.2.3">5.2.3. 🛡️ Ejecución dentro de un contenedor Apptainer</h4>

En entornos donde Docker no está disponible (como clústeres HPC o servidores multiusuario), se puede utilizar **Apptainer** para ejecutar la versión CLI de GenoScribe.
El comportamiento es idéntico al modo Docker, pero utilizando la imagen `.sif` para garantizar portabilidad y compatibilidad.

Para lanzarlo con Apptainer:

```bash
cd GenoScribe
./04-launch/03-apptainer/run_app_shell_form.sh
```

o bien:

```bash
cd GenoScribe/04-launch/03-apptainer/
./run_app_shell_form.sh
```

El script ejecuta internamente el siguiente flujo:

1. Verifique la existencia del archivo `genoscribe-lab.sif` en el directorio `GenoScribe/03-containers/03-apptainer/`.
2. Si no lo encuentra, debe obtener este archivo siguiendo las instrucciones de la sección de construcción del contenedor Apptainer y colocarlo en la ruta indicada.
3. Ejecuta el contenedor en modo interactivo (`apptainer exec`), mostrando el formulario en la propia terminal del usuario.
4. Permite la introducción manual o automatizada de los parámetros necesarios, iniciando el pipeline correspondiente.

En el caso de ejecutarse en un **clúster remoto**, el usuario puede conectarse mediante SSH y lanzar la aplicación directamente en el nodo de cómputo.
No se requiere túnel ni entorno gráfico, ya que toda la interacción ocurre por línea de comandos.

> [!NOTE]
> **Ventaja:** ejecución 100 % reproducible y segura en entornos sin Docker ni permisos de root.

> [!TIP]
> **Recomendación:** utilice esta opción para automatizar procesos o integrarla en flujos de análisis programados.




<br>

<img src="assets/03-common/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-5.3.">5.3. ⌨️ Ejecución mediante terminal directa (CLI, Directo / Batch)</h3>

Esta es la modalidad más potente y robusta orientada a la **automatización masiva y supercomputación**. En lugar de responder a un cuestionario en pantalla, el usuario proporciona todos los parámetros de configuración en una única línea de comandos mediante el uso de *banderas* (flags).

Es la opción indispensable si se desea integrar GenoScribe en scripts de envío para gestores de colas como **SLURM (`sbatch`)**, permitiendo enviar decenas de análisis de forma simultánea y desatendida, o programar su ejecución automática. Al no requerir intervención humana, el proceso fluye desde la validación de parámetros hasta la generación final del informe en segundo plano.

**Tabla de Parámetros Disponibles:**
Los scripts directos aceptan la siguiente nomenclatura (se puede usar la versión corta o la larga indistintamente):

  * `-oc` o `--omics_category` ➜ **[Obligatorio]** Categoría Ómica (1: Transcriptómica, 2: Metagenómica, 3: Metatranscriptómica).
  * `-at` o `--analysis_type` ➜ **[Obligatorio]** Tipo de análisis (ej. 1 para Bulk RNA-Seq, 2 para scRNA-Seq, etc.).
  * `-pp` o `--path_project` ➜ **[Obligatorio]** Ruta absoluta a la carpeta de datos del proyecto.
  * `-rl` o `--report_language` ➜ **[Obligatorio]** Idioma en el que se generará el informe (1: Español, 2: Inglés).
  * `-rv` o `--report_version` ➜ **[Obligatorio]** Versión del informe (1: Full, 2: Compact).
  * `-en` o `--experiment_name` ➜ *(Condicional)* Nombre del experimento (Requerido en Bulk RNA-Seq).
  * `-am` o `--amplicon_type` ➜ *(Condicional)* Marcador taxonómico del 1 al 7 (Requerido en Metagenómica de Amplicones).
  * `-h` o `--help` ➜ (Opcional) Muestra el menú de ayuda con el listado completo de parámetros y correspondencias, finalizando la ejecución del script sin lanzar ningún análisis.



<hr style="border:none; height:1.5px; background-color:#777; width:100%; margin:35px 0 20px 0;">

<h4 id="section-5.2.1">5.2.1. 💻 Ejecución en local sin contenedor</h4>

En este modo, GenoScribe valida los parámetros pasados por línea de comandos y ejecuta el proceso directamente en el entorno local del sistema. Es ideal para incluir la ejecución dentro de otros scripts de Bash propios del usuario o tareas programadas (cron jobs).

Para lanzarlo:

```bash
cd GenoScribe/04-launch/01-local/
./run_app_shell_direct.sh -oc 1 -at 1 -pp "/ruta/absoluta/al/proyecto" -en "nombre_experimento" -rl 1 -rv 1
```

El script verificará silenciosamente que todas las rutas existan y que no falte ningún argumento obligatorio antes de arrancar el pipeline subyacente de Nextflow.

> [!NOTE]
> **Ventaja:** Automatización total sin esperas en la terminal.



<hr style="border:none; height:1.5px; background-color:#777; width:100%; margin:35px 0 20px 0;">

<h4 id="section-5.2.2">5.2.2. 🐳 Ejecución dentro de un contenedor Docker</h4>

Al igual que en la versión de formulario, pero sin detenerse a realizar preguntas, esta opción levanta el contenedor de Docker de forma efímera para procesar los datos indicados y se cierra al terminar. Es perfecta para flujos de integración continua (CI/CD) o servidores "headless" dedicados a análisis masivo.

Para lanzarlo:

```bash
cd GenoScribe/04-launch/02-docker/
./run_app_shell_docker_direct.sh -oc 2 -at 2 -pp "/ruta/absoluta/al/proyecto" -am 7 -rl 2 -rv 2
```

El script realiza automáticamente las siguientes tareas:

1.  Comprueba y obtiene la imagen `adrichez/genoscribe:latest` si no está presente.
2.  Parsea los argumentos y levanta el contenedor montando los volúmenes correspondientes.
3.  Ejecuta el pipeline en segundo plano y almacena los resultados en el directorio de su proyecto.

> [!NOTE]
> **Ventaja:** Trazabilidad, aislamiento absoluto y nula intervención del usuario.



<hr style="border:none; height:1.5px; background-color:#777; width:100%; margin:35px 0 20px 0;">

<h4 id="section-5.2.3">5.2.3. 🛡️ Ejecución dentro de un contenedor Apptainer</h4>

Esta es la forma estándar de trabajo en **HPC y supercomputación**. En un entorno de clúster, el investigador no debe ejecutar tareas pesadas en el nodo principal de conexión (nodo *login*), sino enviarlas a los nodos de cómputo mediante el gestor de colas (ej. **SLURM**).

Al poder pasarle todos los parámetros a Apptainer en una sola línea, GenoScribe se convierte en un comando más dentro de un archivo de trabajo (`.sh`).

> [!IMPORTANT]
> Para que el sistema resuelva correctamente las rutas internas relativas del repositorio, es **estrictamente necesario** que el script de SLURM haga un `cd` al directorio donde se encuentra el script `run_app_shell_direct.sh` antes de invocarlo.

A continuación se muestra un ejemplo de archivo **`job_genoscribe.sh`** listo para enviar a la cola:

```bash
#!/bin/bash
#SBATCH --job-name=GenoScribe  # Nombre del job
#SBATCH --nodelist=nodo01  # Nodo específico
#SBATCH --nodes=1  # Número de nodos
#SBATCH --ntasks=1  # Número de tareas
#SBATCH --cpus-per-task=16  # Núcleos a usar
#SBATCH --output=logs/genoscribe_%j.out  # Archivo de registro
#SBATCH --error=logs/genoscribe_%j.err  # Archivo de errores
#SBATCH --mail-user=tucorreocorreo@ipb.csic.es  # Mi correo
#SBATCH --mail-type=ALL  # Opciones: BEGIN, END, FAIL, REQUEUE, ALL
#SBATCH --get-user-env  # Cargar variables de entorno del usuario

# 1. Crear carpeta de logs si no existe
mkdir -p logs

# 2. Navegar al directorio donde se encuentra el lanzador de Apptainer
# ¡ESTO ES VITAL PARA QUE ENCUENTRE EL RESTO DE SCRIPTS DEL REPOSITORIO!
cd /ruta/absoluta/a/GenoScribe/04-launch/03-apptainer/

# 3. Lanzar la aplicación en modo CLI Directo inyectando todos los parámetros
./run_app_shell_direct.sh -oc 1 -at 1 -pp "/ruta/absoluta/al/proyecto" -en "nombre_experimento" -rl 1 -rv 1
```

Una vez guardado este archivo, simplemente tiene que enviarlo a la cola del clúster desde la terminal mediante:

```bash
mkdir logs
sbatch job_genoscribe.sh
```

El gestor de colas se encargará de asignarle los recursos, ejecutar GenoScribe de forma transparente en el nodo correspondiente, y **enviarle un correo electrónico** cuando su informe esté terminado y listo para ser consultado en su carpeta de proyecto.

> [!NOTE]
> **Ventaja:** Permite lanzar y encolar múltiples informes de forma simultánea, gestionando eficientemente los recursos del clúster sin bloquear el terminal del usuario.

> [!TIP]
> **Recomendación:** Guarde plantillas de sus scripts `sbatch` para futuros proyectos, cambiando únicamente la línea de ejecución de parámetros.

> [!TIP]
> **Tip avanzado:** Si en algún momento no recuerda qué número correspondía a cada opción, puede ejecutar cualquiera de los scripts directos añadiendo la bandera `--help` (ej. `./run_app_shell_direct.sh --help`) para imprimir por pantalla el glosario completo de opciones y advertencias de sintaxis.




<br>

<img src="assets/03-common/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-5.4">5.4. 🧹 Scripts auxiliares de limpieza y depuración</h3>

Además de los scripts principales para lanzar la aplicación y ejecutar los pipelines, **GenoScribe** incluye una serie de **scripts auxiliares** ubicados en cada uno de los directorios correspondientes, según el modo de ejecución **(local, Docker o Apptainer)** que se desee emplear:

* **💻 Local** **&rArr;** `GenoScribe/04-launch/01-local/`
* **🐳 Docker** **&rArr;** `GenoScribe/04-launch/02-docker/`
* **🛡️ Apptainer** **&rArr;** `GenoScribe/04-launch/03-apptainer/`

Estos scripts están diseñados para facilitar tareas comunes de mantenimiento, depuración y gestión del entorno, asegurando que el usuario pueda mantener un control total sobre las ejecuciones y outputs generados. Dichos scripts incluyen:

* **`run_cleaning.sh`** **&rArr;** limpia logs, cachés y directorios temporales (`work`, `_quarto`, etc.) para liberar espacio y evitar conflictos en ejecuciones sucesivas.
* **`access_container.sh`** **&rArr;** abre terminal dentro de contenedor Docker o Apptainer para inspección manual, depuración o ejecución de comandos personalizados.
* **`docker_cleanup.sh`** **&rArr;** sirve para parar y eliminar contenedores Docker antiguos o no utilizados si se desea, al igual que imágenes huérfanas con el fin de liberar espacio en disco.
* **`apptainer_cleanup.sh`** **&rArr;** opción de eliminar imágenes Apptainer `.sif` antiguas o no utilizadas para mantener el entorno limpio.

> [!TIP]
> Mantener el entorno limpio y con control total sobre pipelines y outputs garantiza reproducibilidad y facilita la gestión de proyectos bioinformáticos complejos.

A continuación, más en detalle, se describen en detalle los scripts de limpieza y depuración, explicando su funcionalidad, estructura y modo de uso.



<hr style="border:none; height:1.5px; background-color:#777; width:100%; margin:35px 0 20px 0;">

<h4 id="section-5.4.1">5.4.1. 🚿 Script de limpieza de directorios</h4>

El script `run_cleaning.sh` se encuentra para todos los modos de ejecución (local, Docker, Apptainer) en los siguientes directorios:

* **💻 Local** **&rArr;** `GenoScribe/04-launch/01-local/run_cleaning.sh`
* **🐳 Docker** **&rArr;** `GenoScribe/04-launch/02-docker/run_cleaning.sh`
* **🛡️ Apptainer** **&rArr;** `GenoScribe/04-launch/03-apptainer/run_cleaning.sh`

Este script elimina de forma **segura y controlada** ficheros y directorios generados automáticamente por los pipelines. Entre los elementos eliminados están:

- Directorios temporales: `work/`, `.nextflow/`, `.quarto/`, `*_cache`, `*_freeze`  
- Archivos de logs y trazas: `*.log*`, `.nextflow.log*`, `.RData`, `.Rhistory`  
- Artefactos auxiliares del sistema: `*.DS_Store`, `*.rds`  
- Resultados de informes o análisis previos dentro de `resources/02-nextflow-results/`  

Además, en lugar de borrar completamente ciertas carpetas, **las vacía sin eliminarlas**, preservando su estructura y el archivo `.gitkeep` cuando existe. Ejemplos:  

- `report/`  
- `resources/02-nextflow-results/*`  
- `01-app/www/reports/<categoria>/<pipeline>`  


<br>

**📂 Estructura del script**

El script `run_cleaning.sh` actúa como un orquestador general y presenta un **menú interactivo** estructurado en dos niveles, guiando al usuario para seleccionar exactamente qué entorno de trabajo desea restaurar:

1. **Categoría Ómica &rArr;** Primero se selecciona la disciplina principal (Transcriptómica, Metagenómica, Metatranscriptómica o limpiar todo el proyecto).
2. **Análisis Específico &rArr;** Dentro de la categoría seleccionada, se concreta el *pipeline* exacto que se desea limpiar (ej. Bulk RNA-Seq, Single-Cell RNA-Seq, etc., o todos los de esa categoría).

```plaintext
📄 ¿Qué categoría ómica desea limpiar?:
========================================
1) Transcriptómica
2) Metagenómica
3) Metatranscriptómica
4) Limpiar todos los directorios
---> Ingrese el número de la opción: 

📄 ¿Qué análisis desea limpiar?
====================================================
1) Análisis específico 1 (ej. Bulk RNA-Seq)
2) Análisis específico 2 (ej. Single Cell RNA-Seq)
3) Análisis específico 3 (ej. Transcriptómica Espacial)
4) Todos los análisis de esta categoría
---> Ingrese el número de la opción: 
```

Internamente, este script lanza los correspondientes `run_cleaning_dir.sh` dentro de cada pipeline. Este script específico para cada tipo de análisis/directorio, contiene las reglas específicas de limpieza para cada pipeline, aplicando patrones de eliminación y vaciado de carpetas.


<br>

**▶️ Ejecución del script**

Este script puede ejecutarse para cada método de lanzamiento (local, Docker, Apptainer) directamente **desde la raíz del repositorio GenoScribe** de las siguientes formas:

- **💻 En local:**  

  ```bash
  cd GenoScribe
  ./04-launch/01-local/run_cleaning.sh
  ```

* **🐳 Dentro de contenedor Docker:**  

  ```bash
  cd GenoScribe
  ./04-launch/02-docker/run_cleaning.sh
  ```

* **🛡️ Dentro de contenedor Apptainer:**

  ```bash

  cd GenoScribe
  ./04-launch/03-apptainer/run_cleaning.sh
  ```

O bien, accediendo primeramente al **directorio donde se encuentra el script** para cada modo de ejecución y lanzándolo desde allí:

- **💻 En local:**  

  ```bash
  cd GenoScribe/04-launch/01-local/
  ./run_cleaning.sh
  ```

* **🐳 Dentro de contenedor Docker:**  

  ```bash
  cd GenoScribe/04-launch/02-docker/
  ./run_cleaning.sh
  ```

* **🛡️ Dentro de contenedor Apptainer:**

  ```bash
  cd GenoScribe/04-launch/03-apptainer/
  ./run_cleaning.sh
  ```

<br>

> [!TIP]
> Ejecutar `run_cleaning.sh` antes de un nuevo análisis garantiza un entorno libre de residuos y evita errores inesperados.

> [!CAUTION]
> Este script elimina ficheros de forma irreversible, por lo que se recomienda revisar su contenido antes de ejecutarlo en proyectos con datos importantes.



<hr style="border:none; height:1.5px; background-color:#777; width:100%; margin:35px 0 20px 0;">

<h4 id="section-5.4.2">5.4.2. ⌨️ Script de acceso interactivo al contenedor</h4>

Otro script auxiliar útil, en el caso de que se haya decidido ejecutar GenoScribe dentro de un contenedor **(Docker o Apptainer)**, es `access_container.sh`, que abre una **terminal dentro del contenedor** empleado. Esto es útil para inspeccionar manualmente outputs, depurar fallos o lanzar comandos personalizados.

Dicho script se puede ejecutar para cada uno de los métodos (Docker o Apptainer) de las siguientes formas que se describen a continuación.


<br>

**🐳 Ejemplo de ejecución en Docker:**  

Directamente **desde la raíz del repositorio GenoScribe**:

```bash
cd GenoScribe
./04-launch/02-docker/access_container.sh
```

o bien, accediendo primeramente al **directorio donde se encuentra el script** y lanzándolo desde allí:

```bash
cd GenoScribe/04-launch/02-docker/
./access_container.sh
```


<br>

**🛡️ Ejemplo de ejecución en Apptainer:**  

Directamente **desde la raíz del repositorio GenoScribe**:

```bash
cd GenoScribe
./04-launch/03-apptainer/access_container.sh
```

o bien, accediendo primeramente al **directorio donde se encuentra el script** y lanzándolo desde allí:

```bash
cd GenoScribe/04-launch/03-apptainer/
./access_container.sh
```

<br>

> [!NOTE]
> Para depuración avanzada, `access_container.sh` ofrece control directo sobre el contenedor sin modificar los pipelines principales.



<hr style="border:none; height:1.5px; background-color:#777; width:100%; margin:35px 0 20px 0;">

<h4 id="section-5.4.3">5.4.3. ⌨️ Scripts de limpieza de imágenes y contenedores</h4>

Finalmente, para gestionar el espacio en disco y mantener el entorno limpio, existen dos scripts específicos para eliminar imágenes y contenedores, según el método de ejecución empleado (Docker o Apptainer):

* **🐳 `docker_cleanup.sh`** **&rArr;** este script detiene y elimina contenedores Docker antiguos o no utilizados, así como imágenes huérfanas que ya no son necesarias.
* **🛡️ `apptainer_cleanup.sh`** **&rArr;** este script realiza una limpieza similar pero para archivos `.sif` de Apptainer.


<br>

**▶️ Ejecución de los scripts**

Estos scripts se encuentran en los siguientes directorios:

* **🐳 `docker_cleanup.sh`** **&rArr;** `GenoScribe/04-launch/02-docker/`
* **🛡️ `apptainer_cleanup.sh`** **&rArr;** `GenoScribe/04-launch/03-apptainer/`

Para ejecutarlos, de igual modo, se pueden ejecutar directamente desde la raíz del repositorio GenoScribe:

```bash
# Para Docker
cd GenoScribe/04-launch/02-docker/
./docker_cleanup.sh
```

```bash
# Para Apptainer
cd GenoScribe/04-launch/03-apptainer/
./apptainer_cleanup.sh
```

O bien accediendo primeramente al **directorio donde se encuentra el script** para cada modo de ejecución y lanzándolo desde allí:

```bash
# Para Docker
cd GenoScribe/04-launch/02-docker/
./docker_cleanup.sh
```

```bash
# Para Apptainer
cd GenoScribe/04-launch/03-apptainer/
./apptainer_cleanup.sh
```

<br>

> [!TIP]
> **Recomendación:** ejecutar estos scripts cuando se quiera liberar espacio y no se vaya a ejecutar GenoScribe en un periodo cercano.

> [!CAUTION]
> **Precaución:** estos scripts eliminan imágenes y contenedores de forma irreversible, por lo que se recomienda estar seguro de que ya no se necesitan antes de ejecutarlos. Una vez eliminados, el proceso de reconstrucción o descarga puede llevar tiempo y ser costoso en recursos.




<br>

<img src="assets/03-common/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-5.5">5.5. 🎬 Flujo de ejecución resumido (GIF)</h3>

Para visualizar el **proceso completo de ejecución**, desde la construcción de la imagen del contenedor hasta la obtención del informe final, se puede consultar, al igual que en apartado anterior, el **GIF de ejemplo** en la sección **<a href="#section-3.3">3.3. Demostración visual</a>**.

> [!NOTE]
> Este GIF sirve como guía visual para entender el flujo recomendado, aunque los comandos pueden ejecutarse directamente en terminal para usuarios avanzados.






<br>
<br>

<img src="assets/03-common/decoration/linea_divisoria_1.png" width="100%" style="border-radius: 10px;">

<h2 id="section-6">6. 📥 Proporción de parámetros para la generación del informe</h2>

Para ejecutar correctamente los análisis en **GenoScribe**, es necesario proporcionar unos **parámetros de entrada** bien definidos. Estos parámetros permiten localizar los datos generados previamente por herramientas bioinformáticas (como **<a href="https://github.com/eandresleon/miARma-seq">miARma-seq</a>**) y adaptarlos al flujo de generación de informes reproducibles.

Como ya hemos mencionado, disponemos de tres formas de proporcionar estos parámetros:

- **🖼️ Mediante formulario interactivo desde la interfaz gráfica (GUI, Shiny)** al ejecutar `run_app_shiny_form.sh`.  
- **💻 Mediante formulario interactivo desde la terminal (CLI, Shell)** al ejecutar `run_app_shell_form.sh`.  
- **⌨️ De forma directa desde la terminal (CLI, Shell)** al ejecutar `run_app_shell_direct.sh`.  




<br>

<img src="assets/03-common/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-6.1">6.1. 📑 Parámetros y datos requeridos para el análisis de Bulk RNA-Seq</h3>

En el caso concreto de **Bulk RNA-Seq**, es necesario proporcionar los siguientes **4 parámetros** clave para que **GenoScribe** pueda localizar y procesar correctamente los resultados generados por el análisis bioinformático previo y generar el informe final tal y como se espera. Estos parámetros son:

1. **📁 Ruta absoluta del proyecto con los resultados del análisis bioinformático previo (`path_project`)**  

    - Corresponde a la **ruta de la carpeta** principal donde se encuentran los **resultados generados por la herramienta bioinformática** empleada.  
    - Ejemplo de cómo proporcionar esta ruta si GenoScribe se ejecuta en un entorno local: 

      ```bash
      /workspace/data/0101-EXT-25-Transcriptomics-Bulk-RNA-Seq
      ```

2. **🧪 Nombre del experimento dentro la carpeta del proyecto principal de Bulk RNA-Seq (`experiment_name`)**  

    - Es el **nombre del subdirectorio** dentro de `Analisis/` y `Resultados/` que agrupa todos los outputs de un mismo experimento.  
    - Esto se especifica ya que puede ser que **dentro de un mismo proyecto se hayan realizado varios experimentos** independientes.
    - Ejemplo:  

      ```bash
      mary
      ```

3. **📄 Idioma del informe (`report_language`)** - Indica el **idioma del informe** que se desea generar para adaptar el contenido según la preferencia o región del destinatario.  
    - Se dispone de una **versión en español** (`es`), ideal para laboratorios, clínicas o clientes finales de habla hispana, y de una **versión en inglés** (`en`), pensada para un público internacional o para ajustarse a estándares científicos globales.  
    - Para proporcionar este parámetro, se debe indicar un número entero (1-2), el cual representa cada uno de los idiomas disponibles para el informe:  
      - `1` **&rArr;** Informe en **español** (`es`).  
      - `2` **&rArr;** Informe en **inglés** (`en`).
    - Ejemplo:  

      ```bash
      1
      ```

4. **📄 Versión del informe (`report_version`)**  

    - Indica la **versión del informe** que se desea generar según a quien este vaya dirigido (por ejemplo, una versión para el laboratorio o una versión para el cliente final).  
    - Se dispone de una **versión más detallada** y extensa (`full`), donde se especifica cómo se ha construido el informe y detalles más técnicos que el usuario no experto puede no necesitar y de una **versión más resumida y simplificada** (`compact`), pensada para usuarios finales o clientes que solo quieren ver los resultados principales sin entrar en detalles técnicos.  
    - Para proporcionar este parámetro, se debe indicar un número entero (1-2), el cuál representa cada una de las posibles versiones del informe:  
      - `1` **&rArr;** Versión **completa** del informe (`full`).  
      - `2` **&rArr;** Versión **resumida** del informe (`compact`).
    - Ejemplo:  

      ```bash
      1
      ```


Ejemplo de todos los parámetros combinados (contenido del archivo `params.yaml`):

```yaml
path_project: "/workspace/data/0101-EXT-25-Transcriptomics-Bulk-RNA-Seq"
experiment_name: "mary"
report_language: 1
report_version: 1
```


<br>

⚠️ **Importante**:  

Si la ejecución se hace desde la **interfaz gráfica de Shiny y empleando un contenedor** (Docker o Apptainer), la ruta local se monta como volumen. En ese caso, en el formulario Shiny se debe indicar una ruta absoluta, pero en este caso, dentro del contenedor. Por lo tanto, en lugar de la ruta completa del sistema local, se debe proporcionar la **ruta relativa dentro del contenedor** del siguiente modo:

```bash
workspace/data/{nombre_carpeta_proyecto}
```

Por ejemplo:

```bash
workspace/data/0101-EXT-25-Transcriptomics-Bulk-RNA-Seq
```

En lugar de la ruta completa de la máquina local, como se mostró anteriormente.


<br>

⚠️ **Adicionalmente**:

En el caso de proporcionar los parámetros mediante el script `run_app_shell_direct.sh` (de forma **directa desde la terminal**), es necesario especificar **2 parámetros adicionales** que indican el tipo de análisis con el que estamos trabajando. Esto se debe a que, al usar los scripts que despliegan el formulario interactivo, esta selección se realiza de forma guiada al inicio.

Estos parámetros son:

  - **🧬 Categoría Ómica (`omics_category`)** - Indica la **categoría principal** del análisis bioinformático.

      - Para proporcionar este parámetro, se debe indicar un número entero (1-3):
          - `1` **⇒** Transcriptómica (`transcriptomics`).
          - `2` **⇒** Metagenómica (`metagenomics`).
          - `3` **⇒** Metatranscriptómica (`metatranscriptomics`).
      - En este caso concreto, al estar en la guía de Bulk RNA-Seq, se debe especificar el valor `1`.

  - **🔬 Tipo de Análisis (`analysis_type`)** - Indica el **tipo de análisis específico** dentro de la categoría ómica seleccionada.

      - Las opciones disponibles dependen de la `omics_category`. Para el caso de Transcriptómica (`1`), disponemos de:
          - `1` **⇒** Bulk RNA-Seq.
          - `2` **⇒** Single-Cell RNA-Seq.
          - `3` **⇒** Spatial Transcriptomics.
      - Para este caso específico de Bulk RNA-Seq, se debe especificar el valor `1`.

Un ejemplo sería:

```bash
cd GenoScribe/04-launch/01-local/
./run_app_shell_direct.sh -oc 1 -at 1 -pp "/ruta/absoluta/al/proyecto" -en "nombre_experimento" -rl 1 -rv 1
```




<br>

<img src="assets/03-common/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-6.2">6.2. 🌟 Procedencia de los datos: miARma-seq</h3>

El **directorio con los datos** resultado del **análisis bioinformático previo** que se deben proporcionar a **GenoScribe** provienen de la herramienta **[miARma-seq](https://github.com/eandresleon/miARma-seq)**, desarrollada por **[Eduardo Andrés León](https://github.com/eandresleon)** et al.

**miARma-seq** es un pipeline modular para análisis de datos **RNA-Seq (bulk y small RNA)**. Sus características principales son:

* **Control de calidad** de lecturas con *FastQC*.
* **Alineamiento** contra genomas de referencia usando *HISAT2*, *Bowtie2* u otros algoritmos.
* **Cuantificación de expresión** (matrices crudas y normalizadas).
* **Análisis de expresión diferencial** (con *DESeq2*, *edgeR*).
* **Enriquecimiento funcional** de genes diferencialmente expresados (GO, KEGG, etc.).
* **Reproducibilidad**: genera siempre la misma estructura de carpetas y ficheros, lo que facilita su integración con GenoScribe.

Y el **workflow** típico diseñado para esta herramienta incluye las **etapas** que podemos visualizar en la siguiente imagen:

<p align="center">
  <img src="assets/03-common/tools/miarma-seq/miARma_Seq_workflow.png" alt="Workflow miARma-seq" width="65%" style="border-radius: 10px;">
</p>

<br>

Así, una vez realizado todo el **análisis bioinformático** correspondiente, para el caso de **Bulk RNA-Seq**, según el protocolo definido para la correcta **integración con GenoScribe**, se deben aportar los siguientes resultados en los correspondientes directorios bien definidos dentro de la carpeta del proyecto {`nombre_proyecto`} proporcionada mediante el parámetro de `path_project` como resultado de este análisis previo:

`{nombre_proyecto}/`

  * **`Analisis/`**  
    * **`{experiment_name}/`**  
      * `Pre_fastqc_results/` **&rArr;** informes `.html` de *FastQC* previos al alineamiento.  
      * `hisat2_index/` **&rArr;** archivos `.ht2` generados por *HISAT2* para la indexación del genoma de referencia **&rarr;** *(opcional)*.  
      * `hisat2_results/` **&rArr;** archivos `.bam`, `.sam` y métricas del alineamiento **&rarr;** *(opcional)*.  
      * `Readcount_results/` **&rArr;** matriz cruda de conteos (no normalizada).  
    * **`reads_down_select_{experiment_name}/`** **&rArr;** archivos `.fastq` empleados en el experimento **&rarr;** *(opcional)*.  
    * **`miARma_workflow.ini`** **&rArr;** archivo de configuración empleado para ejecutar el pipeline de miARma-Seq **&rarr;** *(opcional)*.  
    * **`Slurm.sh`** **&rArr;** script de ejecución en clúster **&rarr;** *(opcional)*.  

  * **`Documentacion/`** **&rArr;** Carpeta opcional con documentación, informes o metadatos adicionales relevantes al proyecto. 

  * **`Resultados/`**  
    * **`{experiment_name}/`**    
      * `{experiment_name}_QC.pdf` **&rArr;** informe de control de calidad global.  
      * `{experiment_name}_RPKM.xls` **&rArr;** matriz de expresión normalizada (RPKM).  
      * `*_DEG*.xlsx` **&rArr;** resultados de expresión diferencial.  
      * `*Volcano*.pdf` **&rArr;** volcano-plots de genes diferencialmente expresados.  
      * `Enrichment/` **&rArr;** resultados de análisis de enriquecimiento (PDF y XLS por comparativa). 
    * **`targets_{experiment_name}.txt`** **&rArr;** archivo de metadatos con la definición de muestras y condiciones.

Donde la idea es sustituir estos parámetros comentados anteriormente por el caso de estudio específico, con el fin de mantener una estructura reproducible y que la lógica del informe sea capaz de leer estos datos sin obtener ningún error, por ejemplo:

* **`nombre_proyecto`** = `basename(path_project) `**&rArr;** `0101-EXT-25-Transcriptomics-Bulk-RNA-Seq`
* **`experiment_name`** **&rArr;** `mary`.

> [!CAUTION]
> Asegurarse de proporcionar correctamente los datos de entrada a GenoScribe ya que, de lo contrario, el programa no podrá leer los datos y lo más probable es que la ejecución no pueda realizarse, a no ser que ese dato no sea imprescindible. En la siguiente sección se detallarán dichos formatos en profundidad con un proyecto de ejemplo.






<br>
<br>

<img src="assets/03-common/decoration/linea_divisoria_1.png" width="100%" style="border-radius: 10px;">

<h2 id="section-7">7. 🌳 Ejemplo de estructura base y formatos para el directorio con los datos a proporcionar</h2>

Una vez comprendido el flujo de trabajo biológico, de donde provienen dichos datos y la estructura de directorios general, es fundamental trasladar estos resultados a una organización de archivos estandarizada. En este apartado se detalla, en primer lugar, cómo desplegar automáticamente el árbol de carpetas vacío requerido por **GenoScribe** y, a continuación, se especifican los formatos y nomenclaturas exactas que debe contener cada subdirectorio para asegurar la correcta lectura de los datos.




<br>

<img src="assets/03-common/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-7.1">7.1. 🏗️ Generación de la estructura base (Scaffolding)</h3>

Como se ha descrito en la sección anterior, la correcta generación del informe interactivo en **GenoScribe** depende de que los datos de entrada sigan una jerarquía estricta. Idealmente, el flujo de trabajo bioinformático previo, junto con las herramientas empleadas en él, generan esta organización de archivos de forma predeterminada. 

Sin embargo, en proyectos más complejos o con múltiples ramificaciones analíticas, las rutas de salida pueden alterarse. Para garantizar una compatibilidad total, facilitar la labor del investigador y evitar errores de lectura, GenoScribe proporciona un script de inicialización (*scaffolding*) ubicado en el directorio [`05-examples/01-structures`](../05-examples/01-structures).

Al ejecutar este script, se despliega automáticamente el árbol de directorios vacío con la estructura mínima y esencial requerida para un proyecto de **Bulk RNA-Seq**. Esta plantilla ilustra la organización exacta de las subcarpetas, reflejando el control de versiones iterativo y las profundas ramificaciones analíticas necesarias para los estudios de expresión diferencial y enriquecimiento funcional.

El script correspondiente es [`0102_run_scaffold_transcriptomics_bulk_rna_seq.sh`](../05-examples/01-structures/0102_run_scaffold_transcriptomics_bulk_rna_seq.sh) y se ejecuta desde la terminal de la siguiente manera:

```bash
./0102_run_scaffold_transcriptomics_bulk_rna_seq.sh
```

Generando por consiguiente la siguiente estructura base detallada:

```plaintext
{project_name}
├── Analisis
│   ├── {experiment_name}
│   │   ├── hisat2_index
│   │   ├── hisat2_results
│   │   ├── Pre_fastqc_results
│   │   └── Readcount_results
│   └── reads_down_select_{experiment_name}
└── Resultados
    ├── {experiment_name}
    └── └── Enrichment
```

Una vez generada esta estructura base, el usuario únicamente debe trasladar los archivos resultantes de su análisis previo a sus carpetas correspondientes (si es que no los ha generado directamente siguiendo esta estructura), asegurando así una integración perfecta con el pipeline de generación del informe.

Adicionalmente, si se desea consultar un caso práctico para comprender exactamente cómo deben distribuirse los archivos dentro de cada carpeta, se incluye un directorio de prueba completamente funcional y poblado con datos reales en [`GenoScribe/05-examples/02-reports/01-transcriptomics/01-bulk-rna-seq/`](../05-examples/02-reports/01-transcriptomics/01-bulk-rna-seq), cuyo detalle se aborda en profundidad en la siguiente sección y en la <a href="#section-9.6">Sección 9.6</a>.




<br>

<img src="assets/03-common/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-7.2">7.2. 📂 Formatos y nomenclatura de archivos: Caso práctico</h3>

Una vez desplegada la estructura base (ya sea de forma nativa por el flujo de trabajo previo o mediante el script de *scaffolding*), el paso más crítico es poblar estos directorios con los resultados bioinformáticos correspondientes. **GenoScribe** es estricto en cuanto a las rutas, nomenclaturas y extensiones de archivo que es capaz de leer para integrarlos correctamente en el informe interactivo final.

Para ilustrar de forma clara y precisa qué archivos se esperan en cada ruta y qué reglas de estandarización deben seguir, utilizaremos los datos de un proyecto de ejemplo completamente funcional (`0101-EXT-25-Transcriptomics-Bulk-RNA-Seq`):

```plaintext
basename(path_project) = project_name = 0101-EXT-25-Transcriptomics-Bulk-RNA-Seq
```

Concretamente, en este proyecto, nos centramos en el experimento específico llamado `mary`, ya que dentro de un proyecto específico, nos podemos encontrar distintos esperimentos, y es por ello que se decidió incorporar el parámero `experiment_name`:

```plaintext
experiment_name = mary
```

A continuación, procederemos a ir describiendo parte por parte dicha estructura (seguiremos un orden alfabético, tal y como se vio en la estructura anterior), detallando los archivos de ejemplo que irían en cada directorio y el formato específico que deben cumplir para una correcta lectura por parte de la herramienta.



<hr style="border:none; height:1.5px; background-color:#777; width:100%; margin:35px 0 20px 0;">

**Directorio Base de Análisis (`Analisis/`)**

```plaintext
0101-EXT-25-Transcriptomics-Bulk-RNA-Seq
├── Analisis
│   ├── mary
│   ├── miARma_workflow.ini
│   ├── reads_down_select_mary
│   └── Slurm.sh
```

Este es el directorio principal de entrada que aloja tanto la configuración inicial del experimento como los resultados brutos y procesados del flujo de trabajo de miARma-seq. Para garantizar una integración fluida con GenoScribe, es imperativo que la estructura y los nombres de las carpetas respeten la jerarquía predefinida, utilizando el identificador del experimento (definido en el parámetro `experiment_name`, en este caso hipotético, `mary`).

* 📄 **Archivos de Configuración y Ejecución (Opcionales)**
En la raíz del directorio `Analisis/`, se pueden depositar los archivos que documentan cómo se ejecutó el pipeline bioinformático. Aunque su inclusión no es obligatoria para la compilación del informe, si se aportan, GenoScribe los integrará en la pestaña de Metodología para maximizar la trazabilidad y reproducibilidad del estudio:
  * **`miARma_workflow.ini` &rArr;** Archivo que contiene los parámetros y configuraciones exactas utilizadas por miARma-seq. Debe conservar **estrictamente** este nombre para ser detectado e incrustado en el informe interactivo.
  * **`Slurm.sh` &rArr;** Script utilizado para lanzar los procesos en el clúster computacional. Al igual que el anterior, su nombre debe ser exacto para que el sistema lo procese correctamente.

* 📂 **`reads_down_select_{experiment_name}/` &rArr; Archivos FastQ (Opcional)**
Este directorio está destinado a almacenar las lecturas crudas (`.fastq` o `.fastq.gz`) empleadas en el experimento. GenoScribe explorará esta carpeta para extraer estadísticos básicos de los archivos de entrada si están disponibles. La nomenclatura del directorio debe incluir el prefijo `reads_down_select_` seguido exactamente del nombre del experimento (ej. `reads_down_select_mary`).

* 📂 **`{experiment_name}/` &rArr; Resultados del Flujo de Trabajo**
Esta es la carpeta central que encapsula el procesamiento bioinformático, nombrada con el identificador exacto del experimento (ej. `mary/`). Su interior debe dividirse en subdirectorios específicos. **Las carpetas estrictamente obligatorias que deben contener datos para evitar un error crítico de compilación son `Pre_fastqc_results/` y `Readcount_results/`**; el resto pueden estar vacías, aunque se recomienda encarecidamente poblarlas para explotar toda la capacidad analítica del informe:
  * 📁 **`Pre_fastqc_results/` (Obligatorio) &rArr;** Debe contener los informes de control de calidad primario (FastQC).
  * 📁 **`Readcount_results/` (Obligatorio) &rArr;** Contiene la matriz cruda de conteos de expresión, fundamental para los análisis estadísticos posteriores.
  * 📁 **`hisat2_index/` (Opcional) &rArr;** Destinado a los archivos del índice del genoma de referencia.
  * 📁 **`hisat2_results/` (Opcional) &rArr;** Almacena los alineamientos (`.bam`) y las métricas de mapeo.

> [!NOTE]
> **Nota de Integridad:** La ausencia de los archivos `.ini` o `.sh`, así como el hecho de dejar vacías las carpetas opcionales (como `hisat2_results/`), no interrumpirá la generación del informe. GenoScribe simplemente omitirá esas secciones o mostrará un aviso de ausencia de datos. Sin embargo, dejar vacías las carpetas obligatorias o alterar el nombre de la carpeta `{experiment_name}` (ej. `mary/`) romperá la lógica de búsqueda de Quarto, provocando errores insalvables en el renderizado final.



<hr style="border:none; height:1.5px; background-color:#777; width:100%; margin:35px 0 20px 0;">

**Índice del Genoma de Referencia (`Analisis/{experiment_name}/hisat2_index/`)**

```plaintext
│   ├── mary
│   │   ├── hisat2_index
│   │   │   ├── TAIR10.58.1.ht2
│   │   │   ├── TAIR10.58.2.ht2
│   │   │   ├── TAIR10.58.4.ht2
│   │   │   ├── TAIR10.58.5.ht2
│   │   │   ├── TAIR10.58.6.ht2
│   │   │   ├── TAIR10.58.7.ht2
│   │   │   └── TAIR10.58.8.ht2
```

Adentrándonos en el directorio específico del experimento (en este caso práctico, `mary/`), la primera subcarpeta que evaluamos es la encargada de almacenar el índice del genoma de referencia. Este índice es una estructura de datos optimizada generada previamente, típicamente mediante el comando `hisat2-build`. Su presencia permite a la herramienta HISAT2 buscar de forma rápida y eficiente coincidencias entre las secuencias transcriptómicas y el genoma.

* 📂 **`hisat2_index/` &rArr; Estructura del Índice Genómico (Opcional)**
  Esta carpeta alberga los diferentes fragmentos o particiones que componen la base de datos del índice genómico. Para que GenoScribe pueda leer e integrar correctamente estos archivos en la sección de alineamiento del informe interactivo, se debe cumplir la siguiente regla de nomenclatura:
  * 📄 **Formatos soportados (`.ht2`) &rArr;** Quarto inspeccionará dinámicamente este directorio buscando de forma exclusiva aquellos archivos que posean la extensión `.ht2`.
  * 📊 **Visualización en el informe &rArr;** Debido a su naturaleza técnica y estructural, estos archivos no se renderizan gráficamente. En su lugar, el informe autogenerará un listado interactivo (*box-files*) que mostrará todos los archivos `.ht2` detectados. Esto permite al usuario y a otros investigadores auditar rápidamente qué versión del genoma particionado se empleó en la fase de mapeo.

> [!NOTE]
> **Nota metodológica:** Tal y como se adelantó en la revisión de la arquitectura base, este directorio es **opcional** para la compilación del documento. Si la carpeta `hisat2_index/` se encuentra vacía o los archivos depositados en ella carecen de la extensión `.ht2`, el pipeline de GenoScribe no se interrumpirá. Simplemente, la pestaña de análisis mostrará un recuadro de advertencia (*alert-box*) indicando la ausencia de estos índices, garantizando que la lectura y visualización del resto de los resultados continúe con total normalidad.



<hr style="border:none; height:1.5px; background-color:#777; width:100%; margin:35px 0 20px 0;">

**Resultados del Alineamiento (`Analisis/{experiment_name}/hisat2_results/`)**

```plaintext
│   │   ├── hisat2_results
│   │   │   ├── PX_Cd0_Rep1_nat_his.bam
│   │   │   ├── PX_Cd0_Rep1_nat_his.bam.bai
│   │   │   ├── PX_Cd0_Rep1_nat_his.metrics
│   │   │   ├── PX_Cd0_Rep1_nat_his_no_aligned.fastq.1.gz
│   │   │   ├── PX_Cd0_Rep1_nat_his_no_aligned.fastq.2.gz
│   │   │   ├── PX_Cd0_Rep2_nat_his.bam
│   │   │   ├── PX_Cd0_Rep2_nat_his.bam.bai
│   │   │   ├── PX_Cd0_Rep2_nat_his.metrics
│   │   │   ├── PX_Cd0_Rep2_nat_his_no_aligned.fastq.1.gz
│   │   │   ├── PX_Cd0_Rep2_nat_his_no_aligned.fastq.2.gz
│   │   │   ├── PX_Cd0_Rep3_nat_his.bam
│   │   │   ├── PX_Cd0_Rep3_nat_his.bam.bai
│   │   │   ├── PX_Cd0_Rep3_nat_his.metrics
│   │   │   ├── PX_Cd0_Rep3_nat_his_no_aligned.fastq.1.gz
│   │   │   ├── PX_Cd0_Rep3_nat_his_no_aligned.fastq.2.gz
│   │   │   ├── WT_Cd0_Rep1_nat_his.bam
│   │   │   ├── WT_Cd0_Rep1_nat_his.bam.bai
│   │   │   ├── WT_Cd0_Rep1_nat_his.metrics
│   │   │   ├── WT_Cd0_Rep1_nat_his_no_aligned.fastq.1.gz
│   │   │   ├── WT_Cd0_Rep1_nat_his_no_aligned.fastq.2.gz
│   │   │   ├── WT_Cd0_Rep3_nat_his.bam
│   │   │   ├── WT_Cd0_Rep3_nat_his.bam.bai
│   │   │   ├── WT_Cd0_Rep3_nat_his.metrics
│   │   │   ├── WT_Cd0_Rep3_nat_his_no_aligned.fastq.1.gz
│   │   │   └── WT_Cd0_Rep3_nat_his_no_aligned.fastq.2.gz
```

Continuando dentro del directorio del experimento, una vez preparado el índice genómico, encontramos la carpeta destinada a almacenar los resultados directos del mapeo de las secuencias. Este directorio encapsula la salida de la ejecución de **HISAT2**, donde cada lectura cruda ha sido evaluada y asignada (o descartada) a una coordenada específica del genoma de referencia.

* 📂 **`hisat2_results/` &rArr; Mapeo y Métricas de Alineamiento (Directorio Obligatorio, Contenido Opcional)**
  Esta carpeta centraliza los archivos binarios de alineamiento y las estadísticas de éxito del proceso. Es fundamental comprender que **la carpeta en sí misma debe existir siempre en la estructura**, aunque depositar archivos en su interior sea opcional. Además, para que GenoScribe detecte y clasifique los resultados en el informe interactivo, **no importa el nombre de los archivos**, sino que el sistema buscará exclusivamente las siguientes extensiones y sufijos:
  
  * 📄 **Archivos de Alineamiento (`.bam` y `.bai`) &rArr;** Archivos binarios que contienen las lecturas mapeadas (`.bam`) y sus respectivos índices (`.bai` o `.bam.bai`) para permitir un acceso computacional rápido.
  * 📄 **Estadísticas de Mapeo (`.metrics`) &rArr;** Archivos de texto plano que resumen los porcentajes de éxito del alineamiento, lecturas multimapeadas o discordantes.
  * 📄 **Lecturas No Alineadas (`_no_aligned.fastq.1.gz` y `_no_aligned.fastq.2.gz`) &rArr;** Archivos comprimidos que capturan exclusivamente aquellas secuencias que no encontraron homología en el genoma de referencia (útiles para auditar posibles contaminaciones). Es vital que estos archivos terminen exactamente con estos sufijos numéricos de cadena para ser reconocidos.

  * 📊 **Visualización en el informe &rArr;** Dado el gran tamaño y la naturaleza binaria de estos archivos, no se incrustan visualmente en el documento. GenoScribe construirá dinámicamente un explorador interactivo (*box-files*) que los listará ordenados, asignándoles iconos específicos según su extensión, permitiendo al usuario auditarlos o descargarlos directamente con un solo clic.

> [!NOTE]
> **Nota metodológica:** Aunque el contenido de esta carpeta es opcional (si se encuentra vacía no se generará ningún error fatal, simplemente la pestaña "Alineamiento" mostrará un recuadro notificando la ausencia de datos), **se recomienda encarecidamente poblarla**. Incluir estos archivos permite comprender todo el proceso de mapeo y auditar la calidad del alineamiento directamente desde el informe. Sin embargo, se reitera que **el directorio `hisat2_results/` como tal no puede ser eliminado** del árbol de carpetas, ya que rompería la estructura esperada por el pipeline.



<hr style="border:none; height:1.5px; background-color:#777; width:100%; margin:35px 0 20px 0;">

**Control de Calidad Pre-Alineamiento (`Analisis/{experiment_name}/Pre_fastqc_results/`)**

```plaintext
│   │   ├── Pre_fastqc_results
│   │   │   ├── PX_Cd0_Rep1_R1_fastqc.html
│   │   │   ├── PX_Cd0_Rep1_R1_fastqc.zip
│   │   │   ├── PX_Cd0_Rep1_R2_fastqc.html
│   │   │   ├── PX_Cd0_Rep1_R2_fastqc.zip
│   │   │   ├── PX_Cd0_Rep2_R1_fastqc.html
│   │   │   ├── PX_Cd0_Rep2_R1_fastqc.zip
│   │   │   ├── PX_Cd0_Rep2_R2_fastqc.html
│   │   │   ├── PX_Cd0_Rep2_R2_fastqc.zip
│   │   │   ├── PX_Cd0_Rep3_R1_fastqc.html
│   │   │   ├── PX_Cd0_Rep3_R1_fastqc.zip
│   │   │   ├── PX_Cd0_Rep3_R2_fastqc.html
│   │   │   ├── PX_Cd0_Rep3_R2_fastqc.zip
│   │   │   ├── WT_Cd0_Rep1_R1_fastqc.html
│   │   │   ├── WT_Cd0_Rep1_R1_fastqc.zip
│   │   │   ├── WT_Cd0_Rep1_R2_fastqc.html
│   │   │   ├── WT_Cd0_Rep1_R2_fastqc.zip
│   │   │   ├── WT_Cd0_Rep2_R1_fastqc.html
│   │   │   ├── WT_Cd0_Rep2_R1_fastqc.zip
│   │   │   ├── WT_Cd0_Rep2_R2_fastqc.html
│   │   │   ├── WT_Cd0_Rep2_R2_fastqc.zip
│   │   │   ├── WT_Cd0_Rep3_R1_fastqc.html
│   │   │   ├── WT_Cd0_Rep3_R1_fastqc.zip
│   │   │   ├── WT_Cd0_Rep3_R2_fastqc.html
│   │   │   └── WT_Cd0_Rep3_R2_fastqc.zip
```

Retrocediendo a las fases iniciales del flujo de trabajo, encontramos la carpeta dedicada a la evaluación técnica de las lecturas crudas de secuenciación. Este directorio captura la salida directa de la herramienta **FastQC** antes de someter las secuencias a cualquier proceso de filtrado o alineamiento. A diferencia de los directorios anteriores, **esta carpeta es estrictamente obligatoria**.

* 📂 **`Pre_fastqc_results/` &rArr; Evaluación de Calidad (Obligatorio)**
  Este directorio desempeña un doble papel crítico en el informe interactivo: alimenta directamente las secciones detalladas de la pestaña "Análisis" y, en paralelo, el pipeline de Nextflow de GenoScribe lo utiliza para calcular y compilar el archivo JSON de MultiQC que da vida a las métricas globales de la pestaña "Resumen". Para que todo este engranaje funcione, los archivos deben respetar escrupulosamente el siguiente formato:
  
  * 📄 **Reportes y Datos de FastQC (`.html` y `.zip`) &rArr;** Por cada muestra procesada, FastQC genera un informe visual (`.html`) y un archivo comprimido con los datos brutos (`.zip`). GenoScribe necesita que **ambos** estén presentes.
  * 🏷️ **Nomenclatura Estricta (Cadenas R1/R2) &rArr;** Para diseños *paired-end* (extremos emparejados), el informe espera reconocer el nombre de la muestra seguido del identificador de la cadena y el sufijo exacto de la herramienta. El patrón indispensable a seguir es **`{nombre_muestra}_R1_fastqc.html`** para la lectura *forward* y **`{nombre_muestra}_R2_fastqc.html`** para la lectura *reverse* (haciendo lo homólogo con los `.zip`).
  * 📊 **Visualización en el informe &rArr;** El script de Quarto leerá los nombres de estos archivos, extraerá el `{nombre_muestra}` y construirá dinámicamente una subsección dedicada para cada muestra en el apartado de Control de Calidad, incrustando el HTML interactivo original de FastQC en un visor (*iframe*) para facilitar su escrutinio visual.

> [!NOTE]
> **Nota metodológica y de integridad:** La existencia de este directorio y la exactitud en el nombre de sus archivos (`_R1_fastqc.html`, `_R1_fastqc.zip`, etc.) son **requisitos innegociables**. Si los sufijos se alteran (por ejemplo, escribiendo `_fastQC.html` en mayúsculas o suprimiendo el indicador `_R1_`), los scripts de Quarto no podrán identificar las muestras ni emparejar sus lecturas, lo que provocará un error crítico durante la compilación del informe y dejará vacías tanto la pestaña de "Resumen" como la de "Control de Calidad".



<hr style="border:none; height:1.5px; background-color:#777; width:100%; margin:35px 0 20px 0;">

**Cuantificación de la Expresión Génica (`Analisis/{experiment_name}/Readcount_results/`)**

```plaintext
│   │   ├── Readcount_results
│   │   │   ├── his-ReadCount.tab
│   │   │   └── his-Size.tab
```

Avanzando en el flujo de trabajo, una vez que las lecturas han sido alineadas contra el genoma, se procede a la fase de **cuantificación de la expresión génica**. Este directorio es el núcleo cuantitativo del proyecto, ya que traduce las coordenadas de mapeo genómico en una matriz de conteos matemáticos que refleja la actividad transcripcional real de cada gen en cada muestra. A diferencia de las carpetas de alineamiento u otras etapas intermedias, **este directorio y su contenido son estrictamente obligatorios**.

* 📂 **`Readcount_results/` &rArr; Matrices de Conteos y Longitud (Obligatorio)**
  Para que GenoScribe pueda procesar los datos, generar las tablas interactivas y calcular las métricas exploratorias (total de lecturas, top de genes más expresados, boxplots de distribución logarítmica) en la pestaña de "Cuantificación", los archivos depositados aquí deben mantener de forma inflexible la siguiente nomenclatura:

  * 📄 **`his-ReadCount.tab` &rArr;** Archivo tabular que contiene la matriz de expresión en bruto (no normalizada). Las filas representan los identificadores únicos de los genes y las columnas corresponden a las distintas muestras del experimento. Los valores internos indican el número exacto de lecturas mapeadas inequívocamente a cada gen.
  * 📄 **`his-Size.tab` &rArr;** Archivo tabular que almacena la longitud exacta (en pares de bases) de cada gen anotado. Esta información es absolutamente crítica para que, en las etapas estadísticas posteriores, se pueda aplicar una normalización geométrica correcta (como RPKM o TPM), corrigiendo el sesgo bioinformático que provoca que los genes más largos acumulen artificialmente más lecturas que los cortos.

  * 📊 **Visualización en el informe &rArr;** GenoScribe transforma estos archivos de texto plano en potentes tablas de datos interactivas, permitiendo al investigador buscar genes específicos, ordenar por niveles de expresión y descargar las matrices directamente. Además, los datos crudos de `his-ReadCount.tab` alimentan de forma dinámica un conjunto de gráficos interactivos que resumen visualmente la profundidad de secuenciación y la distribución de la expresión por muestra.

> [!NOTE]
> **Nota metodológica y de integridad:** La exactitud en el nombre de estos dos archivos (`his-ReadCount.tab` y `his-Size.tab`) es un **requisito innegociable**. Los scripts de compilación de Quarto están programados para leer estas rutas exactas. Si falta alguno de los archivos, el directorio se encuentra vacío, o se altera una sola letra en su nomenclatura (por ejemplo, nombrándolo `His-ReadCount.tab` o `readcounts.txt`), el pipeline de renderizado fallará críticamente, deteniendo la generación del informe completo.



<hr style="border:none; height:1.5px; background-color:#777; width:100%; margin:35px 0 20px 0;">

**Lecturas Crudas o Filtradas (`Analisis/reads_down_select_{experiment_name}/`)**

```plaintext
│   ├── reads_down_select_mary
│   │   ├── PX_Cd0_Rep1_R1.fastq.gz
│   │   ├── PX_Cd0_Rep1_R2.fastq.gz
│   │   ├── PX_Cd0_Rep2_R1.fastq.gz
│   │   ├── PX_Cd0_Rep2_R2.fastq.gz
│   │   ├── PX_Cd0_Rep3_R1.fastq.gz
│   │   ├── PX_Cd0_Rep3_R2.fastq.gz
│   │   ├── WT_Cd0_Rep1_R1.fastq.gz
│   │   ├── WT_Cd0_Rep1_R2.fastq.gz
│   │   ├── WT_Cd0_Rep3_R1.fastq.gz
│   │   └── WT_Cd0_Rep3_R2.fastq.gz
```

Saliendo del subdirectorio específico del experimento (`mary/`), pero manteniéndonos dentro de la raíz de la carpeta `Analisis/`, encontramos el directorio destinado a almacenar los archivos de secuencias iniciales. Este directorio contiene las lecturas crudas o pre-filtradas (típicamente generadas tras un paso de <em>trimming</em> o selección) que alimentan todo el flujo de trabajo posterior.

* 📂 **`reads_down_select_{experiment_name}/` &rArr; Archivos de Secuenciación (Opcional pero Recomendado)**
  Esta carpeta actúa como el punto de partida biológico del proyecto. Su inclusión en GenoScribe tiene un propósito puramente de **trazabilidad y contexto**. Para que el informe reconozca e integre estos archivos en la sección "Revisión inicial de muestras y metadatos", se deben seguir las siguientes pautas:

  * 📁 **Nomenclatura del directorio &rArr;** La carpeta debe llamarse **exactamente** `reads_down_select_` seguido del nombre del experimento proporcionado en los parámetros (ej. `reads_down_select_mary`).
  * 📄 **Formatos y nomenclatura de archivos (`.fastq.gz`) &rArr;** El script de Quarto (específicamente en `01-revision-inicial.qmd`) buscará exclusivamente archivos que terminen en `.fastq.gz`. Para mantener la coherencia y facilitar la auditoría, es altamente recomendable que los nombres incluyan el identificador de la cadena, siguiendo el patrón **`{nombre_muestra}_R1.fastq.gz`** y **`{nombre_muestra}_R2.fastq.gz`**.
  * 📊 **Visualización en el informe &rArr;** Debido a que los archivos FASTQ son extremadamente pesados, no se procesan visualmente ni se copian íntegramente al informe final para no colapsar el sistema. En su lugar, GenoScribe lee los nombres de estos archivos y genera un explorador interactivo (*box-files*) que los lista de forma ordenada. Esto permite al investigador cruzar visualmente los archivos físicos disponibles con los nombres registrados en el archivo de metadatos (`targets_{experiment_name}.txt`, en este caso concreto, `targets_mary.txt`), validando la integridad del diseño experimental.

> [!NOTE]
> **Aclaración técnica sobre la pestaña "Resumen":** Es común pensar que las métricas globales mostradas en la pestaña de "Resumen" (como el número total de FASTQs o las estadísticas de calidad) se calculan leyendo directamente esta carpeta. Sin embargo, el pipeline de GenoScribe extrae esos cálculos de los **informes JSON generados por MultiQC/FastQC** ubicados en la carpeta obligatoria `Pre_fastqc_results/`.
> Por lo tanto, **este directorio `reads_down_select_` es verdaderamente opcional**. Si la carpeta está vacía o no se incluyen los archivos `.fastq.gz` (por ejemplo, para ahorrar espacio de almacenamiento), el pipeline no fallará ni la pestaña de Resumen perderá sus datos. Simplemente, la sección de "Revisión inicial" mostrará un aviso metodológico indicando que no se detectaron archivos de lectura en dicha ruta.



<hr style="border:none; height:1.5px; background-color:#777; width:100%; margin:35px 0 20px 0;">

**Documentación Complementaria (`Documentacion/`)**

```plaintext
├── Documentacion
```

Saliendo del bloque de análisis, en la raíz de la carpeta del proyecto encontramos el directorio destinado a la información suplementaria. Este espacio está concebido de forma genérica para mantener organizado cualquier archivo no técnico vinculado al experimento.

* 📂 **`Documentacion/` &rArr; Repositorio Auxiliar (Directorio Obligatorio, Contenido Opcional)**
  Este directorio está diseñado para albergar protocolos de laboratorio, notas metodológicas del equipo, literatura científica de referencia o cualquier otro documento de soporte. 

  * 📊 **Uso en el informe interactivo &rArr;** A diferencia de los resultados bioinformáticos, los archivos depositados en esta carpeta **no son leídos ni procesados por los scripts de Quarto**. Por lo tanto, no aparecerán listados ni renderizados en el informe final de GenoScribe.

> [!NOTE]
> **Nota de integridad estructural:** Como se puede observar en este proyecto de ejemplo, la carpeta se encuentra completamente vacía. Esto es perfectamente válido y no afecta al resultado final. Sin embargo, es vital destacar que **el directorio `Documentacion/` debe existir físicamente** dentro del árbol de carpetas. El *pipeline* automatizado de Nextflow de GenoScribe realiza una validación de la arquitectura base al recibir la ruta de los datos de entrada; si elimina esta carpeta, el sistema interpretará que la estructura proporcionada está incompleta o es errónea, pudiendo detener la ejecución del programa.



<hr style="border:none; height:1.5px; background-color:#777; width:100%; margin:35px 0 20px 0;">

**Resultados del Análisis Estadístico (`Resultados/`)**

```plaintext
└── Resultados
    ├── Exp_mary.Rdata
    ├── mary
    │   ├── AT4G31970_Expression.pdf
    │   ├── DEG_px-ck-C_vs_pex11a-C.xlsx
    │   ├── Enrichment
    │   │   ├── Enrichment_GO_BP_px-ck-C_vs_pex11a-C_FDR_0.05_FC_0.pdf
    │   │   ├── Enrichment_GO_BP_px-ck-C_vs_pex11a-C_FDR_0.05_FC_0.xls
    │   │   ├── Enrichment_GO_CC_px-ck-C_vs_pex11a-C_FDR_0.05_FC_0.pdf
    │   │   ├── Enrichment_GO_CC_px-ck-C_vs_pex11a-C_FDR_0.05_FC_0.xls
    │   │   ├── Enrichment_GO_MF_px-ck-C_vs_pex11a-C_FDR_0.05_FC_0.pdf
    │   │   ├── Enrichment_GO_MF_px-ck-C_vs_pex11a-C_FDR_0.05_FC_0.xls
    │   │   ├── Enrichment_KEGG_px-ck-C_vs_pex11a-C_FDR_0.05_FC_0.pdf
    │   │   └── Enrichment_KEGG_px-ck-C_vs_pex11a-C_FDR_0.05_FC_0.xls
    │   ├── mary_QC.pdf
    │   ├── mary_RPKM.xls
    │   └── Volcano_plot_px-ck-C_vs_pex11a-C.pdf
    ├── Resultados.Rproj
    ├── RNASeq.R
    ├── subsampling_mary.sh
    ├── targets_mary.txt
```

Una vez completado el pre-procesamiento, el alineamiento y la cuantificación, nos adentramos en el directorio principal de `Resultados/`. Esta carpeta centraliza todo el análisis estadístico *downstream*: desde la normalización geométrica de los datos, pasando por los contrastes de expresión diferencial, hasta la interpretación del enriquecimiento funcional. Debido a la gran cantidad de archivos que pueden llegar a generarse en múltiples ejecuciones y experimentos emparejados, GenoScribe aplica filtros estrictos para ignorar la "basura" o archivos de ejecuciones pasadas, centrando su lectura exclusivamente en los patrones esperados para el `{experiment_name}` (en nuestro caso de ejemplo, `mary`).

* 📄 **Archivo de Metadatos Raíz (`targets_{experiment_name}.txt`) &rArr; (Obligatorio)**
  En la raíz del directorio `Resultados/`, el único archivo indispensable es el documento que define el diseño experimental. El sistema ignorará cualquier otro archivo suelto (como `.Rdata`, scripts `.sh`, u otros contrastes residuales). 
  * 🏷️ **Nomenclatura:** Debe nombrarse **exactamente** con el prefijo `targets_` seguido del nombre del experimento (ej. `targets_mary.txt`).
  * ⚙️ **Formato Interno Estricto:** Es un archivo de texto plano separado por tabulaciones que debe contener obligatoriamente tres columnas con los siguientes encabezados exactos: `Filename` (nombre de los archivos crudos de las muestras sin extensiones), `Name` (alias corto o identificador visual) y `Type` (condición biológica a la que pertenecen, ej. WT, KO, Tratado, Control).
    ```text
    Filename      Name      Type
    PX_Cd0_Rep1   PX_0_1    pex11a-C
    WT_Cd0_Rep1   WT_0_1    px-ck-C
    ```
  * 💡 **Uso:** Quarto emplea este archivo de forma transversal en casi todas las pestañas para agrupar, colorear y contrastar las muestras en gráficos como PCAs, Heatmaps y listados de DEGs.

* 📂 **Directorio del Experimento (`Resultados/{experiment_name}/`) &rArr; (Obligatorio)**
  Dentro de la carpeta con el nombre del experimento, el *pipeline* exige que los archivos de análisis sigan patrones de nombres muy específicos para poder construir dinámicamente las pestañas de "Normalización", "Análisis Estadístico" y "Expresión Diferencial":
  
  * 📄 **Evaluación Post-Normalización (`{experiment_name}_QC.pdf`) &rArr;** Archivo estrictamente obligatorio. Contiene visualizaciones fundamentales de la calidad de la normalización como el PCA (Análisis de Componentes Principales), gráficos de correlación de Pearson y Heatmaps de *clustering* jerárquico. GenoScribe extraerá estas imágenes para incrustarlas en la sección de control de calidad post-normalización.
  * 📄 **Matriz Normalizada (`{experiment_name}_RPKM.xls`) &rArr;** Archivo tabular obligatorio que contiene la matriz de expresión corregida y normalizada (típicamente mediante el método RPKM, FPKM o TPM). Se representa en el informe como una tabla interactiva descargable para el investigador.
  * 📄 **Tablas de DEGs (`DEG_*.xlsx`) &rArr;** Para la sección de expresión diferencial, el informe iterará y buscará archivos en formato Excel que sigan estrictamente el patrón **`DEG_{condiciónA}_vs_{condiciónB}.xlsx`** (ej. `DEG_px-ck-C_vs_pex11a-C.xlsx`). **El uso de la subcadena `_vs_` es crítico**, ya que Quarto la utiliza como separador lógico para recortar y extraer el nombre exacto de la comparativa, generando de forma automática los títulos de las subsecciones en el informe. Si se aportan archivos adicionales que no sigan este patrón, el sistema los omitirá de las tablas interactivas.
  * 📄 **Volcano Plots (`Volcano_plot_*.pdf`) &rArr;** Gráficos que representan visualmente la significancia estadística frente al cambio de expresión. Su nomenclatura debe ser homóloga a la tabla, siguiendo el formato **`Volcano_plot_{condiciónA}_vs_{condiciónB}.pdf`**. Mantener esta simetría estricta permite que GenoScribe empareje la tabla dinámica de DEGs con su gráfico Volcano correspondiente.

* 📂 **Análisis Funcional (`Resultados/{experiment_name}/Enrichment/`) &rArr; (Opcional)**
  Este subdirectorio alberga la "traducción funcional" biológica. Utiliza los genes diferencialmente expresados (DEGs) para descubrir rutas y procesos celulares enriquecidos en bases de datos.
  
  * 🏷️ **Flexibilidad y Ausencia:** Esta carpeta es **opcional**. Si se decide no realizar un análisis de enriquecimiento, la carpeta puede estar completamente vacía sin generar errores. GenoScribe simplemente omitirá las gráficas funcionales o indicará que no hay datos disponibles en esta ruta.
  * 📄 **Formatos esperados y parsing (`Enrichment_*.pdf` y `Enrichment_*.xls`) &rArr;** Para que el código clasifique correctamente los resultados, los archivos deben incluir el prefijo, la base de datos/ontología evaluada y, de nuevo, la comparativa empleando el separador `_vs_` (ej. **`Enrichment_GO_BP_{condiciónA}_vs_{condiciónB}_[...].pdf`**). Es obligatorio que el nombre de la base de datos sea reconocible (típicamente `GO_BP`, `GO_CC`, `GO_MF` o `KEGG`). Esta estructura es fundamental para que el informe pueda segmentar dinámicamente las pestañas por cada comparativa y, dentro de cada una, mostrar los *barplots* interactivos y las tablas estadísticas agrupadas por su dominio biológico correspondiente.

> [!NOTE]
> **Nota de integridad del bloque:** El éxito de esta sección radica en la precisión absoluta de los nombres. Un error tipográfico en el nombre del experimento, la ausencia del archivo de metadatos (`targets.txt`) con el formato de tabulaciones exigido, o **la omisión del conector `_vs_` en los contrastes**, desbaratará la capacidad de GenoScribe para aplicar etiquetas biológicas, extraer títulos y generar las secciones de expresión diferencial y funcional, provocando posibles fallos en el renderizado final del documento.




<br>

<img src="assets/03-common/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-7.3">7.3. ✅ Resumen práctico</h3>

Para garantizar que **GenoScribe** genere el informe interactivo de **Bulk RNA-Seq** de manera fluida y sin errores, es fundamental tener en cuenta los siguientes puntos clave:

* ⚙️ **Parámetros de entrada indispensables:**
  1. **Ruta absoluta** al directorio raíz del proyecto que contiene los resultados.
  2. **Nombre del experimento** (`experiment_name`) específico a evaluar dentro del proyecto (por ejemplo, `mary`), lo que permite a la herramienta filtrar iteraciones antiguas o paralelas.
  3. **Versión del informe** (ajustada al nivel de complejidad y detalle requerido por el usuario).

* 📄 **Procedencia y Formatos Estrictos:** Los resultados deben derivar del flujo de trabajo **miARma-seq**. Es crucial respetar las extensiones esperadas por el sistema: lecturas crudas en **`.fastq.gz`**, matrices de conteos en **`.tab`**, tablas estadísticas y de expresión en **`.xls`** o **`.xlsx`**, y reportes gráficos en **`.pdf`**.

* 📂 **Contenido Analítico:** El directorio debe albergar los *outputs* propios de la transcriptómica masiva (informes de FastQC, métricas de alineamiento de HISAT2, normalización de datos, tablas de DEGs emparejadas con sus Volcano plots, y enriquecimiento funcional), prestando especial atención a las convenciones de nomenclatura como el uso obligatorio de **`_vs_`** en los contrastes.

* 🐳 **Configuración en Entorno Docker:** Si ejecuta la interfaz gráfica de **Shiny** a través de un contenedor, recuerde emplear siempre las rutas absolutas que han sido mapeadas internamente en el volumen del contenedor (típicamente `/workspace/data/{nombre_proyecto}`).

> [!IMPORTANT]
> **¡Regla de Oro sobre la Arquitectura de Directorios!**
> Es absolutamente **imprescindible respetar la jerarquía completa de carpetas** detallada a lo largo de esta guía. Aunque su análisis no incluya ciertos pasos opcionales (por ejemplo, si no ha realizado el análisis funcional de enriquecimiento o si decide no incluir los alineamientos `.bam`), **NUNCA elimine las carpetas de la estructura base aunque vayan a quedar vacías**.
> El motor de compilación de Quarto inspecciona sistemáticamente el árbol de directorios asumiendo una topología fija. Si una carpeta física desaparece, el *pipeline* devolverá un error crítico de ruta y abortará la generación del informe. Por el contrario, si la carpeta existe pero está vacía, el sistema lo gestionará de forma robusta y elegante, emitiendo simplemente un aviso informativo en la sección correspondiente.






<br>
<br>

<img src="assets/03-common/decoration/linea_divisoria_1.png" width="100%" style="border-radius: 10px;">

<h2 id="section-8">8. 🔬 Etapas del pipeline de Nextflow</h2>

El pipeline de **Bulk RNA-Seq** implementado en Nextflow dentro de GenoScribe organiza el flujo de trabajo en **fases secuenciales**, cada una con un propósito específico y outputs intermedios que posteriormente alimentan la generación del informe final.  

Estas etapas no reemplazan al análisis primario (realizado con **miARma-seq**), sino que lo **complementan**: GenoScribe toma los resultados ya procesados (alineamientos, conteos, DEG, enriquecimientos, etc.) y los convierte en un **informe reproducible y personalizable** mediante *Quarto*.




<br>

<img src="assets/03-common/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-8.1">8.1. 📂 Copia del proyecto</h3>

**Proceso: `COPIAR_CARPETA_PROYECTO`**  

- **Objetivo**: Copiar las carpetas esenciales del proyecto de **miARma-seq** (`Analisis`, `Documentacion`, `Resultados`) hacia el directorio de trabajo gestionado por **Nextflow**.

- **Motivo**:  
  - Garantizar que se trabaja sobre un **espacio controlado y reproducible**.  
  - Excluir archivos demasiado grandes (>300 MB) que no son necesarios para el informe (e.g. BAM completos), además de archivos sensibles que no desean compartirse.  
  - Disponer de los datos esenciales dentro del directorio de recursos del informe generado para así poder compartir dicho informe sin depender de archivos externos.  

- **Output**:  
  ```
  outdir/1-project-data/
  ├── Analisis/
  ├── Documentacion/
  └── Resultados/
  ```

Esto asegura que los siguientes procesos del pipeline siempre accedan a la **misma estructura estandarizada**.




<br>

<img src="assets/03-common/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-8.2">8.2. 📊 Generación de reporte QC integrado</h3>

**Proceso: `MULTIQC`**  

- **Objetivo**: Unificar los resultados de *FastQC* (que **miARma-seq** guarda en `Pre_fastqc_results/`) en un único informe visual con *MultiQC*.  

- **Motivo**:  
  - Facilitar la interpretación rápida del control de calidad.  
  - Evitar navegar entre múltiples PDFs/HTMLs individuales.  

- **Input esperado**:  
  ```
  Analisis/{experiment_name}/Pre_fastqc_results/
  ```

- **Output**:  
  ```
  outdir/02-fastqc-report/results-multiqc-{experiment_name}/multiqc_report.html
  outdir/2-fastqc-report/results-multiqc-{experiment_name}/multiqc_data/
  ```

El informe `multiqc_report.html` resume métricas clave como **calidad de secuencias, contenido GC, adaptadores** y otros indicadores críticos de QC.




<br>

<img src="assets/03-common/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-8.3">8.3. 📑 Creación de un archivo con los parámetros proporcionados</h3>

**Proceso: `CREAR_PARAMS_YML`**  

- **Objetivo**: Crear un archivo `params.yml` con los parámetros de entrada.

- **Motivo**:  
  - Facilitar la integración de los parámetros en el informe de **Quarto**.
  - Permitir que el informe sea **dinámico y reproducible** según los datos específicos del proyecto.
  - Estandarizar la forma en que los parámetros se pasan al informe, evitando errores manuales.
  - Hacer que el informe sea fácilmente reutilizable para diferentes proyectos simplemente cambiando este archivo de parámetros.

- **Input esperado**:  
  - Parámetros proporcionados mediante la línea de comandos o interfaz gráfica:  
    - `path_project`  
    - `experiment_name`
    - `report_version`

- **Output**:
  ```
  params.yml
  ```

Este archivo `params.yml` se emplea posteriormente en la etapa de renderizado del informe en **Quarto** y es esencial para las siguientes fases del pipeline.




<br>

<img src="assets/03-common/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-8.4">8.4. 📄 Creación de un archivo con la configuración de Quarto</h3>

**Proceso: `CREAR_QUARTO_YML`**  

- **Objetivo**: Crear un archivo `_quarto.yml` con la configuración necesaria para el informe, mediante un archivo `yaml_generator.py` encargado de generar este archivo dinámicamente, según los parámetros proporcionados.

- **Motivo**:  
  - Estandarizar la configuración del informe en **Quarto**.
  - Facilitar la personalización del informe según las necesidades del proyecto.
  - Permitir que el informe sea **dinámico y reproducible** según los datos específicos del proyecto.
  - Obtención de informes diferentes (completo o compacto) según el parámetro `report_version`.

- **Input esperado**:  
  - Parámetros proporcionados mediante la línea de comandos o interfaz gráfica:  
    - `report_version`

- **Output**:
  ```
  quarto.yml
  ```

Este archivo `_quarto.yml` se emplea posteriormente en la etapa de renderizado del informe en **Quarto** y es esencial para la siguiente fase del pipeline.




<br>

<img src="assets/03-common/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-8.5">8.5. 📝 Renderizado de informe en Quarto</h3>

**Proceso: `RENDER_QUARTO`**  

- **Objetivo**: Renderizar el informe final en **Quarto**, integrando todos los resultados y parámetros proporcionados.  

- **Funcionamiento**:  
  - Se crea un informe HTML interactivo que consolida todos los resultados del análisis de **Bulk RNA-Seq**.  
  - El informe se genera en la carpeta `report/` del pipeline, que actúa como un sitio web estático.  
  - Se emplean los archivos `params.yml` y `_quarto.yml` generados en pasos anteriores para personalizar el contenido y la estructura del informe.
  - Se ejecuta:  
    ```bash
    quarto render --execute-params params.yml
    ```  

- **Output**:  
  ```
  /report/resources
  /report/site_libs
  /report/index.html
  ```




<br>

<img src="assets/03-common/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-8.6">8.6. 🔄 Ejemplo de flujo de outputs</h3>

Para ilustrar cómo se organizan los resultados generados por el **pipeline de Bulk RNA-Seq**, tomemos como ejemplo un proyecto con nombre de experimento **`exp_1`**.

Al ejecutar el pipeline, los outputs principales definidos en **`outdir/`** tendrán una estructura similar a la siguiente:

```bash
outdir/
├── 1-project-data/  # Copia del proyecto original de entrada
├── 2-fastqc-report/
│   └── results-multiqc-mary/
│       ├── multiqc_report.html  # Informe de calidad global
│       └── multiqc_data/  # Datos agregados por MultiQC
└── 3-analisis-estadistico/  # Resultados del análisis estadístico (en el caso que fuera necesario implementarlos)
```


<br>

💡 **Nota importante sobre la localización de los outputs**:

* Durante la ejecución, Nextflow genera resultados intermedios en su carpeta de trabajo temporal **`/work`**, dentro del directorio del pipeline de **Bulk-RNA-Seq**:

  ```bash
  GenoScribe/02-pipelines/01-transcriptomics/01-bulk-rna-seq/work
  ```

* Posteriormente, mediante la directiva **`publishDir`**, los resultados generados se copian automáticamente al directorio de salida especificado en el parámetro **`outdir`** (en este caso, **`resources/02-nextflow-results`**).
  De este modo, el pipeline asegura que todos los archivos relevantes queden disponibles y organizados en carpetas temáticas.

  Esta organización tiene un propósito doble:

  1. **Facilitar el acceso y la interpretación** de los resultados desde el informe generado con **Quarto**.
  2. **Permitir la correcta distribución del informe** de forma independiente, incluyendo todos los datos necesarios ya consolidados y listos para su consulta, sin depender de la ubicación de los datos originales o externos.
 
  Así, las siguientes líneas en el script de Nextflow aseguran que los outputs clave se publiquen en el directorio definido por `outdir`:

  ```groovy
  publishDir "${params.outdir}/1-project-data", mode: 'copy'  /* COPIAR_CARPETA_PROYECTO */
  publishDir "${params.outdir}/2-fastqc-report/results-multiqc-${params.experiment_name}", mode: 'copy'  /* MULTIQC */
  publishDir "${workflow.projectDir}", mode: 'copy'  /* CREAR_PARAMS_YML */
  publishDir "${workflow.projectDir}", mode: 'copy'  /* CREAR_QUARTO_YML */
  publishDir "${params.outdir}/report", mode: 'copy'  /* RENDER_QUARTO */
  ```


<br>

📊 **Generación del informe final**  

Una vez finalizado el pipeline de **Nextflow**, como resultado final del último proceso `RENDER_QUARTO` se obtiene el informe interactivo HTML relativo al análisis **Bulk RNA-Seq** y el cuál se encuentra almacenado en el siguiente directorio:

```bash
GenoScribe/02-pipelines/01-transcriptomics/01-bulk-rna-seq/report/
```

Este informe actúa como un **sitio web estático** que integra y organiza todos los resultados producidos por el pipeline (análisis de calidad, tablas de expresión, gráficos, etc.), ofreciendo a los investigadores una **vista unificada, interactiva y fácilmente interpretable** de los datos.

<br>

✨ **En resumen:**

1. Los resultados se generan primero en **`/work`**.
2. Luego, se publican en la carpeta definida por **`outdir`** siguiendo la estructura establecida.
3. Finalmente, se integran en un **informe reproducible en Quarto**, almacenado en la carpeta **`report/`** del pipeline.

De esta manera, todo el flujo de outputs queda **automatizado, organizado y accesible**, facilitando tanto el análisis como la posterior comunicación científica ✅.




<br>

<img src="assets/03-common/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-8.7">8.7. ✅ Resumen conceptual</h3>

En términos generales, el pipeline desarrollado en **Nextflow** sigue una secuencia lógica y automatizada:

1. **Organiza los datos iniciales**, copiando y estructurando la información relevante del proyecto original.
2. **Evalúa la calidad de los datos**, generando un informe global de control de calidad con *MultiQC*.
3. **Guarda los parámetros proporcionados**, generando un archivo destinado a ello.
4. **Define la configuración de Quarto**,  generando un archivo que define la estructura del informe.
5. **Produce un informe final en Quarto**, totalmente automatizado y reproducible, que integra todos los resultados en un único documento coherente.

De esta manera, **GenoScribe** pone el foco en la **fase de integración y comunicación de resultados**, donde convierte análisis complejos y dispersos en un **informe claro, estructurado y fácilmente compartible**, favoreciendo la reproducibilidad y la distribución independiente de los datos originales.






<br>
<br>

<img src="assets/03-common/decoration/linea_divisoria_1.png" width="100%" style="border-radius: 10px;">

<h2 id="section-9">9. 📊 Resultados e informe</h2>

El pipeline de **Bulk RNA-Seq** en GenoScribe genera un **informe interactivo, reproducible y auto-contenido**, estructurado en tres pestañas principales (versión `compact`) o cuatro (versión `full`, con la pestaña técnica adicional de "Metodología") que permiten explorar de manera progresiva y ordenada todos los resultados del experimento.

Mediante el siguiente GIF se puede apreciar de forma visual la estructura y funcionalidad del informe:

<p align="center">
  <img src="assets/02-analyses/01-transcriptomics/01-bulk-rna-seq/transcriptomics_bulk_rna_seq_demo_report.gif" alt="Estructura del informe para Bulk RNA-Seq" width="65%" style="border-radius: 10px;">
</p>




<br>

<img src="assets/03-common/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-9.1">9.1. 🏠 Pestaña “Inicio”</h3>

Esta pestaña, definida por `index.qmd`, ofrece una **introducción general** y al análisis realizado, incluyendo:

* Introducción al análisis Bulk RNA-Seq y al planteamiento de este informe.
* Explicación de la estructura del informe y de la navegación interactiva por este.
* Guía de usuario del Mini Chatbot RAG.
* Información y contacto.

Sirve como punto de partida para comprender el alcance del proyecto y la lógica del pipeline antes de profundizar en los resultados.




<br>

<img src="assets/03-common/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-9.2">9.2. 📑 Pestaña “Metodología”</h3>

Generada a partir de `tab1-metodologia/metodologia.qmd`, esta sección tiene un carácter **eminentemente técnico** y detalla **cómo se ha generado el informe**, **qué herramientas se han utilizado** y **cómo se ha estructurado el flujo de trabajo**.

* **Workflows y herramientas**: describe el uso de **miARma-Seq** como pipeline central para el análisis transcriptómico (mRNA, miRNA y circRNA) y la integración con **Nextflow** para la ejecución automatizada, trazable y reproducible.
* **Estructura y configuración**: explica la organización de carpetas y archivos resultantes, junto con los parámetros principales (`project_path`, `experiment_name`, `report_version`) definidos en `params.yml` y `_quarto.yml`.
* **Generación del informe**: detalla cómo **Nextflow** invoca `quarto render` para producir el informe HTML final en `report/`, integrando todos los resultados de manera coherente y reproducible.
* **Documentación complementaria**: incluye enlaces a manuales, repositorios y recursos adicionales que facilitan la verificación y réplica del análisis.

Esta pestaña asegura la **transparencia, reproducibilidad y trazabilidad** del proceso, permitiendo comprender con precisión cómo se han obtenido los resultados presentados en el informe.




<br>

<img src="assets/03-common/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-9.3">9.3. 📑 Pestaña “Resumen”</h3>

Generada a partir de `tab2-resumen/resumen.qmd`, esta sección proporciona **una visión general integral del experimento de RNA-Seq**, destacando:

* **Diseño experimental y contexto** **&rArr;** descripción de las muestras únicas, condiciones evaluadas, tecnología empleada (Illumina paired-end) y longitud media de las lecturas.
* **Estadísticas globales de calidad** **&rArr;** total de lecturas, porcentaje de GC, lecturas duplicadas, longitud media y porcentaje de lecturas fallidas.
* **Representación visual** **&rArr;** tarjetas resúmen para interpretación rápida y tablas detalladas por muestra, permitiendo identificar variaciones o posibles problemas de calidad.

Esta pestaña establece las bases para evaluar la representatividad y calidad del conjunto de datos antes de abordar análisis más profundos, preparando al usuario para continuar con la exploración en la pestaña **Análisis**.




<br>

<img src="assets/03-common/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-9.4">9.4. 🔬 Pestaña “Análisis”</h3>

Incluye todos los archivos `.qmd` dentro de `tab3-analisis` y tiene como objetivo ofrecer **una visión completa y estructurada del pipeline miARma-Seq**, describiendo cada etapa del análisis y permitiendo al lector acceder de forma modular a los resultados:



<hr style="border:none; height:1.5px; background-color:#777; width:100%; margin:35px 0 20px 0;">

<h4 id="section-9.4.1">9.4.1. 📖 Contenido principal de esta pestaña:</h4>

1. **00-contexto.qmd** **&rArr;** Contextualización del experimento y estructura del informe.
2. **01-revision-inicial.qmd** **&rArr;** Revisión de muestras y metadatos, para verificar consistencia y distribución por condiciones experimentales.
3. **02-evaluacion-calidad.qmd** **&rArr;** Control de calidad de las lecturas:
   * Análisis global mediante MultiQC.
   * Evaluación individual por muestra con FastQC (lecturas forward y backward).

4. **03-alineamiento.qmd** **&rArr;** Alineamiento al genoma de referencia usando HISAT2 y estadísticas de mapeo.
5. **04-cuantificacion.qmd** **&rArr;** Cuantificación de expresión génica con featureCounts:
   * Matrices de conteos y longitud génica.
   * Visualizaciones de distribución de lecturas y genes detectados.

6. **05-analisis-estadistico.qmd** **&rArr;** Análisis de expresión:
   * **05.1-normalizacion.qmd** **&rarr;** Corrección de sesgos técnicos y transformación de datos.
   * **05.2-evaluacion-calidad-normalizacion.qmd** **&rarr;** Validación de normalización mediante PCA y clustering.
   * **05.3-analisis-expresion.qmd** **&rarr;** Identificación de genes diferencialmente expresados usando edgeR y NOISeq, con visualizaciones tipo volcano plots y tablas interactivas.
   * **05.4-analisis-funcional.qmd** **&rarr;** Enriquecimiento funcional de genes DE: GO, KEGG y asociaciones biológicas.

7. **06-conclusiones.qmd** **&rArr;** Síntesis de hallazgos, implicaciones biológicas y perspectivas futuras.

Esta organización **modular** permite que el lector explore el informe de manera flexible, centrarse en análisis específicos o entender el panorama completo según su interés. Cada subsección presenta resultados con **gráficos interactivos, tablas dinámicas y resúmenes interpretativos**, facilitando tanto la comprensión técnica como la biológica.




<br>

<img src="assets/03-common/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-9.5">9.5. 📂 Organización de archivos y recursos</h3>

El informe se genera como un **sitio web auto-contenido** con la siguiente estructura:

```bash
report/
├── index.html  # Página principal del informe
├── resources  # Recursos del informe (imágenes, scripts, estilos, etc.)
└── site_libs  # Librerías necesarias para la interactividad
```

Esta estructura asegura que el informe puede **visualizarse, compartirse y navegarse de forma independiente** sin depender de la ubicación de los datos brutos.

Como ya se había mencionado anteriormente, más en detalle:

- `resources/` contiene todos los recursos utilizados en el informe (imágenes, scripts, estilos, etc.).
- `site_libs/` incluye las bibliotecas necesarias para el correcto funcionamiento del informe.
- `index.html` es el informe final generado por Quarto (abrir esto en el navegador).

Adicionalmente, como se ha mencionado en el `README.md` general del proyecto, cada informe tiene incorporado un **Mini Chatbot RAG (Recuperación Augmentada por IA)** que permite al usuario interactuar y hacer preguntas relativas a la información contenida en el informe generado, además de disponer de información adicional sobre el sistema GenoScribe y temas relacionados con la bioinformática y el análisis de datos de secuenciación masiva.

Para que este Chatbot funcione correctamente, es necesario que el informe HTML se abra en un servidor local (necesario disponer de un entorno Python instalado), y para ello se ha diseñado un script específico llamado `run_report_server.sh` que se encuentra en `resources/01-essential/03-scripts/05-python/`, el cual puede lanzarse simplemente con doble clic o desde la terminal para iniciar un servidor local y abrir el informe en el navegador con todas sus funcionalidades activas (incluido el Chatbot).

El comando para ejecutar este script desde la terminal es:

```bash
cd resources/01-essential/03-scripts/05-python/
./run_report_server.sh
```

Y automáticamente abrirá el informe en el navegador predeterminado del sistema, con todas las funcionalidades activas.




<br>

<img src="assets/03-common/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-9.6">9.6. 🧪 Informe de ejemplo y demostración interactiva</h3>

Como se ha comentado anteriormente, además de disponer de un **ejemplo de informe de Single-Cell RNA-Seq** dentro del directorio [`GenoScribe/05-examples/02-reports/01-transcriptomics/01-bulk-rna-seq`](../05-examples/02-reports/01-transcriptomics/01-bulk-rna-seq), se ha creado un **repositorio específico** para alojar este informe y facilitar su acceso mediante un simple enlace, sin necesidad de descargar nada.

Puede acceder al informe de las siguientes formas:

- **📦 Repositorio del informe de ejemplo:**  
  [https://github.com/adrichez/GenoScribe-Transcriptomics-Bulk-RNA-Seq-Report](https://github.com/adrichez/GenoScribe-Transcriptomics-Bulk-RNA-Seq-Report)

- **🌐 Informe interactivo alojado en GitHub Pages:**  
  [https://adrichez.github.io/GenoScribe-Transcriptomics-Bulk-RNA-Seq-Report/](https://adrichez.github.io/GenoScribe-Transcriptomics-Bulk-RNA-Seq-Report/)

Este informe está diseñado para ser **auto-contenido, interactivo y fácil de explorar**, permitiendo consultar gráficos, tablas y resúmenes de expresión génica de manera progresiva y clara.

Si desea obtener **más información sobre cómo se generó este informe**, incluyendo el uso de un **cluster HPC**, **Apptainer** y la **interfaz gráfica Shiny**, puede consultar el siguiente **video demostrativo en YouTube**:

<p align="center">
  <a href="https://youtu.be/ddT5yJihnVE" target="_blank">
    <img src="https://img.youtube.com/vi/ddT5yJihnVE/maxresdefault.jpg" alt="Video Demostrativo de Generación del Informe" width="65%" style="border-radius: 10px;">
  </a>
</p>

<p align="center">
  👉 <a href="https://youtu.be/ddT5yJihnVE" target="_blank"><strong>Ver video en YouTube</strong></a>
</p>

Este recurso permite visualizar **todo el flujo de trabajo** de GenoScribe, desde la descarga del repositorio hasta la generación final del informe interactivo, ofreciendo una **demostración práctica y reproducible** de la herramienta.






<br>
<br>

<img src="assets/03-common/decoration/linea_divisoria_1.png" width="100%" style="border-radius: 10px;">

<h2 id="section-10">10. 💬 Comentarios finales</h2>

El módulo de **Bulk RNA-Seq** dentro del proyecto **GenoScribe** tiene como propósito principal **facilitar la última fase del análisis bioinformático**, transformando resultados dispersos y datos intermedios en un **informe automatizado, reproducible y fácilmente interpretable**. Su diseño modular permite:

* Centralizar los resultados de control de calidad, alineamiento, cuantificación y análisis estadístico de expresión diferencial.
* Presentar estos resultados de manera organizada y accesible para distintos perfiles de usuario, desde biólogos hasta bioinformáticos.
* Garantizar la **reproducibilidad** mediante la integración con Nextflow y Quarto, lo que asegura que los informes puedan generarse de forma consistente independientemente del entorno de ejecución.




<br>

<img src="assets/03-common/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-10.1">10.1. 🎯 Objetivos alcanzados</h3>

Con este módulo se ha logrado:

1. **Automatización completa del flujo de resultados** **&rArr;** los outputs intermedios y finales se copian y estructuran automáticamente en carpetas temáticas mediante `publishDir`.
2. **Generación de informes reproducibles** **&rArr;** el informe final en Quarto integra todas las fases del análisis, con gráficos interactivos, tablas dinámicas y resúmenes interpretativos.
3. **Modularidad y flexibilidad** **&rArr;** cada etapa del pipeline se documenta en secciones independientes, permitiendo explorar tanto la visión global como los detalles técnicos de cada proceso.
4. **Compatibilidad con múltiples entornos** **&rArr;** el pipeline puede ejecutarse en local, HPC o nube, con contenedores Docker o Apptainer, garantizando portabilidad y consistencia de resultados.




<br>

<img src="assets/03-common/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-10.2">10.2. 🛠️ Limitaciones y futuras mejoras</h3>

A pesar de los avances alcanzados, existen algunas limitaciones y áreas de mejora que se han identificado para próximas versiones:

* **Dependencia de formatos y estructura de datos** **&rArr;** el pipeline requiere que los datos de entrada estén organizados según las convenciones establecidas; cualquier desviación puede generar errores en la ejecución.
* **Recursos computacionales** **&rArr;** análisis de grandes experimentos con cientos de muestras pueden requerir memoria y CPU significativas; la optimización de paralelización y uso de HPC podría ampliarse.
* **Extensión de métricas de calidad y análisis funcional** **&rArr;** actualmente se incluyen métricas estándar de QC y análisis funcional básico; se podrían integrar nuevos indicadores, métricas de batch effect o análisis más avanzados de rutas metabólicas.
* **Automatización de reportes avanzados** **&rArr;** la inclusión de visualizaciones personalizadas adicionales, resúmenes ejecutivos y enlaces directos a resultados crudos podría mejorar la experiencia de usuario.
* **Compatibilidad con otros pipelines de preprocesamiento** **&rArr;** hoy se asume la salida de miARma-Seq; futuras versiones podrían permitir integración directa con otros pipelines de RNA-Seq o metagenómica.
* **Mejora del Mini Chatbot RAG** **&rArr;** se podrían añadir nuevas funcionalidades y optimizar su integración con el informe mediante la incorporación de **modelos LLM más avanzados**, capaces de ofrecer **respuestas más precisas y contextualizadas** según el contenido del proyecto. Asimismo, podría implementarse una **búsqueda semántica más eficiente** y funciones de **resumen automático o exploración interactiva de resultados**, mejorando así la utilidad del chatbot como asistente técnico dentro del entorno del informe.

En conjunto, este módulo representa un **paso fundamental en la consolidación de resultados de Bulk RNA-Seq**, sirviendo como herramienta robusta para la generación de informes finales claros y completos, al tiempo que establece una base sólida para futuras mejoras y ampliaciones funcionales del proyecto.






<br>
<br>

<img src="assets/03-common/decoration/linea_divisoria_1.png" width="100%" style="border-radius: 10px;">

<h2 id="section-11">11. 📬 Contacto</h2>

Para consultas, sugerencias o reportes de errores relacionados con este proyecto, puedes contactarnos a través de:

<ul style="list-style:none; padding:0; margin:0; gap:10px;">
  <li style="display:flex; align-items:center; gap:10px; margin-bottom:8px;">
    <a href="mailto:asanca33@gmail.com" style="text-decoration:none;">
      <span style="background-color:#ff6f61;color:white;padding:4px 10px;border-radius:12px;font-weight:bold;">📧 Email</span>
    </a>
    <span><strong>&rArr; Correo electrónico para consultas:</strong> <a href="mailto:asanca33@gmail.com">asanca33@gmail.com</a></span>
  </li>

  <li style="display:flex; align-items:center; gap:10px; margin-bottom:8px;">
    <a href="https://github.com/adrichez/GenoScribe" style="text-decoration:none;">
      <span style="background-color:#6cc644;color:white;padding:4px 10px;border-radius:12px;font-weight:bold;">🐙 GitHub</span>
    </a>
    <span><strong>&rArr; Repositorio y contribuciones:</strong> <a href="https://github.com/adrichez/GenoScribe">https://github.com/adrichez/GenoScribe</a></span>
  </li>

  <li style="display:flex; align-items:center; gap:10px; margin-bottom:8px;">
    <a href="06-info/" style="text-decoration:none;">
      <span style="background-color:#1da1f2;color:white;padding:4px 10px;border-radius:12px;font-weight:bold;">📚 Docs</span>
    </a>
    <span><strong>&rArr; Documentación adicional:</strong> <a href="06-info/">06-info/</a></span>
  </li>
</ul>

<br>

<hr style="border:none; height:0.3px; background-color:#777; width:65%; margin:20px auto 25px auto;">

<p align="center" style="margin-top:0.5rem; color:#777; font-size:0.95rem;">
  💡 Sus comentarios y contribuciones ayudan a que GenoScribe sea más <strong>robusto, reproducible y accesible</strong> para la comunidad bioinformática.
</p>
