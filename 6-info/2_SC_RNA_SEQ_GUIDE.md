<p align="center">
  <img src="assets/2-sc-rna-seq/sc_rna_seq_cover_2.png" alt="Banner Single-Cell RNA-Seq" style="max-width:100%;height:auto;">
</p>

<div align="center">
  <h1>Sistema Inteligente y Reproducible de Generación de Informes Bioinformáticos</h1>
  <h2>Guía de Usuario para Análisis Single-Cell RNA-Seq</h2>

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
    <a href="#section-7">Pipeline</a> • 
    <a href="#section-8">Informe</a> • 
    <a href="#section-9">Comentarios</a> • 
    <a href="#section-10">Contacto</a>
  </p>
</div>






<br>
<br>

<img src="assets/4-other/decoration/linea_divisoria_1.png" width="100%" style="border-radius: 10px;">

<h2 id="section-1">1. 📖 Introducción y contexto</h2>

El presente documento constituye la **guía de usuario** para el análisis de datos de **Bulk RNA-Seq** dentro del sistema **GenoScribe**.  
En él se explican los pasos, parámetros y consideraciones necesarias para ejecutar este tipo de análisis, desde la **descarga del proyecto** y la **construcción del contenedor**, hasta la **ejecución del pipeline** y la **generación del informe bioinformático final**.  

A diferencia de otras guías técnicas, el objetivo aquí no es solo indicar qué comandos ejecutar, sino también **ofrecer un marco conceptual y práctico** que permita comprender el valor del análisis y de los informes generados.  




<br>

<img src="assets/4-other/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-1-1">1.1. 🧬 ¿Qué es Bulk RNA-Seq?</h3>  

El **Bulk RNA-Seq** es una técnica de secuenciación masiva de ARN que permite medir la **expresión génica global** en una muestra biológica.  
En lugar de analizar célula por célula (como ocurre en *single-cell RNA-Seq*), este método obtiene un **perfil promedio** de todas las células presentes en la muestra.  

🔹 **Aplicaciones principales del Bulk RNA-Seq:**  
- 📊 Comparación de expresión génica entre condiciones (ej. tratado vs. control).  
- 🔍 Identificación de **genes diferencialmente expresados (DEGs)**.  
- 🌱 Descubrimiento de **rutas biológicas activadas o reprimidas**.  
- 🧪 Estudio de perfiles transcriptómicos en **tejidos, órganos o líneas celulares**.  




<br>

<img src="assets/4-other/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-1-2">1.2. ❓ Ejemplo de pregunta biológica</h3>  

Un investigador puede plantear cuestiones como:  

👉 *“¿Qué genes cambian su expresión en plantas de **Arabidopsis thaliana** cuando se someten a estrés por sequía en comparación con plantas en condiciones normales?”*  

Con Bulk RNA-Seq es posible obtener la respuesta mediante:  
- La **cuantificación de lecturas** alineadas a genes o transcritos.  
- La identificación de **genes sobrerrepresentados o infrarepresentados**.  
- El análisis del impacto en **procesos biológicos y rutas metabólicas**.  




<br>

<img src="assets/4-other/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-1-3">1.3. 🎯 Objetivo de esta guía</h3>  

El propósito de esta guía no es únicamente mostrar cómo ejecutar el pipeline, sino sobre todo:  

1. 📂 **Centralizar** los datos obtenidos o generados por herramientas bioinformáticas.  
2. 📝 **Transformar** esos resultados en un **informe automatizado, claro y reproducible**.  
3. 👩‍🔬 **Facilitar la comprensión** de los resultados para investigadores sin necesidad de explorar manualmente cada archivo de salida.  
4. 🌐 **Mejorar la comunicación científica**, generando informes listos para ser **compartidos en equipos de investigación, colaboraciones o incluso publicaciones**.  




<br>

<img src="assets/4-other/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-1-4">1.4. ✨ Valor añadido de GenoScribe</h3>  

Uno de los principales retos de los análisis bioinformáticos es que los resultados suelen presentarse en **archivos dispersos, de difícil lectura** o poco intuitivos para investigadores no especializados en programación.  

⚡️ Aquí es donde **GenoScribe marca la diferencia**:  
- Genera **informes interactivos** con gráficos, tablas y resúmenes claros.  
- Permite **reproducibilidad**: cualquier investigador puede volver a ejecutar el análisis con los mismos parámetros y obtener el mismo informe.  
- Hace que la **bioinformática sea más accesible**, transformando datos complejos en **conocimiento visual y compartible**.  

> 💡 **En resumen:** GenoScribe no solo ejecuta análisis, sino que **traduce la complejidad en información útil y comunicable**.






<br>
<br>

<img src="assets/4-other/decoration/linea_divisoria_1.png" width="100%" style="border-radius: 10px;">

<h2 id="section-2">2. 📂 Proyecto en GitHub y requisitos</h2>

El proyecto **GenoScribe** está publicado en GitHub y se organiza de forma modular para separar:  
- la **interfaz de usuario** (app Shiny),  
- los **pipelines de análisis** (Nextflow + Quarto),  
- los **entornos reproducibles** (Docker / Apptainer),  
- la **documentación**,  
- y los **informes de ejemplo**.  

Esta organización permite que cada tipo de análisis (Bulk RNA-Seq, scRNA-Seq, Metagenómica) disponga de su propia carpeta con todo lo necesario para ser ejecutado, mantenido y extendido de manera independiente.




<br>

<img src="assets/4-other/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-2-1">2.1. 🏗️ Estructura global del repositorio</h3>

```plaintext
GenoScribe         # Directorio principal del proyecto
├── 1-app          # App Shiny e interfaz web
├── 2-pipelines    # Pipelines bioinformáticos (Bulk, scRNA, Metagenómica)
├── 3-containers   # Definición de entornos reproducibles (Docker / Apptainer)
├── 4-launch       # Scripts de ejecución (local, contenedor, HPC/cloud)
├── 5-examples     # Informes generados como referencia
├── 6-info         # Documentación técnica y especificaciones
└── README.md      # Guía general del proyecto
```

Cada directorio tiene un rol específico y está descrito con mayor detalle en el README general.




<br>

<img src="assets/4-other/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-2-2">2.2. 🧬 Carpeta específica de Bulk RNA-Seq</h3>

El pipeline para este tipo de análisis se encuentra en [GenoScribe/2-pipelines/1-bulk-rna-seq](../2-pipelines/1-bulk-rna-seq).

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

📌 En paralelo, los resultados generados y un ejemplo completo pueden encontrarse en [GenoScribe/5-examples/1-bulk-rna-seq](../5-examples/1-bulk-rna-seq).

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




<br>

<img src="assets/4-other/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-2-3">2.3. ⚙️ Requisitos básicos</h3>

Antes de utilizar el sistema y ejecutar el pipeline de **Bulk RNA-Seq** asegúrese de contar con los siguientes elementos para garantizar un funcionamiento correcto y reproducible:

* 🐳 **Docker o Apptainer** → imprescindibles para construir y ejecutar los **contenedores** que incluyen la aplicación Shiny, los pipelines y todas las dependencias bioinformáticas.

  * Docker: recomendado para entornos de desarrollo, uso local y en la nube.
  * Apptainer (antes Singularity): recomendado en clústeres HPC o entornos donde Docker no está permitido.

* 💻 **Terminal / Línea de comandos** → utilizada para lanzar los scripts y gestionar la ejecución de los contenedores.

  * Compatible con **macOS, Linux y Windows**.
  * En Windows se recomienda **WSL2 (Windows Subsystem for Linux)**, **Git Bash** o **PowerShell** con soporte adecuado para contenedores.

* 🌐 **Navegador web moderno** → necesario para explorar los **informes HTML interactivos**.

  * Se recomienda **Google Chrome** o **Firefox**.
  * Safari y Edge son compatibles pero pueden presentar limitaciones con algunos gráficos **D3.js** o en la visualización de algunos archivos incrustados.

* 📶 **Conexión a internet** → (opcional) necesaria si:

  * deseas descargar datos de referencia o bases externas durante la ejecución de un pipeline,
  * o si quieres actualizar imágenes de contenedores.
  * El sistema también puede ejecutarse **100% offline** si ya cuenta con los recursos necesarios preinstalados.

* 💾 **Recursos mínimos recomendados** → para un uso fluido en análisis típicos de RNA-seq o metagenómica:

  * **RAM**: ≥ ideal ≥ 8 GB.
  * **CPU**: ≥ 4 núcleos.
  * **Almacenamiento**: ≥ 30 GB libres (la imagen del contenedor pesa unos 15 GB).

> 💡 Con estos requisitos cumplidos, la instalación y ejecución del sistema es directa y garantiza que todos los elementos interactivos de los informes funcionen de manera correcta y reproducible.






<br>
<br>

<img src="assets/4-other/decoration/linea_divisoria_1.png" width="100%" style="border-radius: 10px;">

<h2 id="section-3">3. 🔄 Workflow del análisis</h2>

El **workflow de GenoScribe** describe el recorrido completo desde la preparación de los datos hasta la obtención del informe interactivo final. Incluye decisiones clave como el **entorno de ejecución**, el uso de **contenedores** y la elección de la **interfaz de usuario**.

---

<h3 id="section-3.1">3.1. 📝 Diagrama general</h3>

El siguiente **diagrama de flujo esquemático** representa las rutas disponibles para ejecutar GenoScribe (centrándonos en el **pipeline de Bulk RNA-Seq**):

<p align="center">
  <img src="assets/4-other/workflow/bulk_rna_seq_workflow.png" alt="Diagrama del flujo de trabajo de Bulk RNA-Seq" width="65%">
</p>

**Rutas principales del workflow:**

* 💻 **Ejecución Local**

  * Directamente en el **ordenador** o, preferiblemente, dentro de un **contenedor**.
  * Contenedores disponibles en **Docker** y **Apptainer**.
  * Interacción mediante **terminal (CLI)** o **interfaz Shiny**.

* 🖥️ **Ejecución en HPC / Nube**

  * Directamente en el **cluster** o en un **contenedor Apptainer** (Docker no suele estar permitido).
  * Interacción mediante **CLI** exclusivamente.

> 💡 **Consejo práctico:** siempre que sea posible, usa **contenedores** para asegurar **reproducibilidad**, independencia de librerías y mayor facilidad de despliegue.
> En entornos HPC/Nube, puede ser necesario cargar **módulos del sistema** o definir variables de entorno adicionales antes de la ejecución.

Tras definir la ruta de ejecución, el usuario completa un **formulario de parámetros**:

* 📄 **GUI (Shiny)** → disponible solo en local.
* 📄 **CLI (shell)** → disponible tanto en local como en HPC/Nube.

Luego selecciona el **tipo de análisis**:

* 🧬 **Bulk RNA-Seq**
* 🧫 **scRNA-Seq**
* 🌱 **Metagenómica**

Cada análisis activa su **pipeline específico**, que culmina en la generación de un **informe HTML interactivo** con resultados listos para explorar, descargar y compartir.




<br>

<img src="assets/4-other/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-3.2">3.2. 📐 Pasos resumidos</h3>

El siguiente esquema muestra de manera simplificada la **ejecución típica** usando contenedores y la **interfaz Shiny**:

```ascii
→ Descargar proyecto desde GitHub
   → Construir la imagen genoscribe:1.0
   → Crear contenedor genoscribe_container
   → Iniciar contenedor
   → Lanzar app Shiny en puerto 3838
   → Seleccionar tipo de análisis en el formulario
   → Completar parámetros del experimento
   → Ejecutar pipeline mediante Nextflow
   → Generar outputs y el informe HTML interactivo
   → Acceder y explorar informe HTML
```

✅ Este esquema permite visualizar **rápidamente** el recorrido completo: desde la preparación y ejecución hasta la **obtención del informe final**.




<br>

<img src="assets/4-other/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-3.3">3.3. 🎬 Demostración visual</h3>

El siguiente **GIF** ofrece una visión dinámica del flujo principal: inicio de la app Shiny, completado del formulario, selección del análisis y ejecución del pipeline dentro del contenedor. El proceso finaliza con la **generación automática del informe HTML interactivo**:

<p align="center">
  <img src="assets/1-bulk-rna-seq/bulk_rna_seq_demo.gif" alt="Demostración flujo de trabajo GenoScribe" width="65%">
</p>

> 💡 **Nota:** Este GIF es una **guía visual rápida** y no muestra todos los pasos intermedios ni outputs secundarios. Para información completa, incluyendo **entradas, salidas y parámetros específicos**, consulta las [Guías de usuario extendidas](6-info).




<br>
<br>

<img src="assets/4-other/decoration/linea_divisoria_1.png" width="100%" style="border-radius: 10px;">

<h2 id="section-4">4. ⬇️ Descarga y preparación del entorno</h2>

Antes de ejecutar cualquier análisis con **GenoScribe**, es necesario obtener el proyecto completo y asegurarse de que todas las dependencias estén disponibles. Esta sección describe cómo **clonar o descargar el repositorio**, así como los pasos iniciales de preparación del entorno, tanto para usuarios que trabajen **en local** como aquellos que utilicen **HPC o la nube**.

El objetivo es que cualquier usuario pueda iniciar GenoScribe de manera rápida y reproducible, con un flujo de trabajo consistente y control sobre versiones y actualizaciones. Además, se facilita la construcción de contenedores (Docker o Apptainer), que aseguran un entorno aislado y preconfigurado, evitando conflictos de dependencias y problemas de compatibilidad.




<br>

<img src="assets/4-other/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-4.1">4.1. 🌐 Clonar o descargar el proyecto</h3>

Para obtener todos los **códigos, pipelines, scripts y archivos necesarios** existen dos opciones principales: **clonar el repositorio mediante Git** o **descargar un ZIP desde GitHub**.

**Opción recomendada: clonar con Git**

```bash
git clone https://github.com/adrichez/GenoScribe.git
cd GenoScribe
```

Clonar el repositorio permite mantener el proyecto **actualizado fácilmente** mediante `git pull`, y ofrece la máxima flexibilidad para usuarios que planeen ejecutar pipelines de forma continua o modificar scripts según sus necesidades. Además, permite gestionar versiones y mantener un historial de cambios controlado.

> 💡 Ventaja: ideal para usuarios que planean trabajar regularmente con GenoScribe o integrar nuevas funcionalidades en el futuro.

**Alternativa: descargar ZIP desde GitHub**

1. Accede a [https://github.com/adrichez/GenoScribe](https://github.com/adrichez/GenoScribe).
2. Pulsa **Code → Download ZIP**.
3. Descomprime el archivo y accede a la carpeta del proyecto desde la terminal.

> ⚡ Esta opción es útil para pruebas rápidas o para sistemas donde **Git no está disponible**, aunque no permite actualizar fácilmente el repositorio ni gestionar versiones.




<br>

<img src="assets/4-other/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-4.2">4.2. 🛠️ Instalación de dependencias</h3>

GenoScribe requiere diversas herramientas y librerías para ejecutar correctamente los pipelines y generar los informes interactivos. La instalación depende del **modo de ejecución** elegido: dentro de un contenedor (Docker o Apptainer) o directamente en el sistema local sin contenedor.



<hr style="border:none; height:1.5px; background-color:#777; width:100%; margin:35px 0 20px 0;">

<h4 id="section-4.2.1">4.2.1. 📦 Dentro de contenedor (Docker / Apptainer)</h4>

Si se ejecuta GenoScribe dentro de un contenedor, **todas las dependencias ya están preinstaladas**. Esto incluye:

* Nextflow para la ejecución de pipelines.
* R con paquetes necesarios para análisis y generación de informes (shiny, tidyverse, ggplot2, DT, plotly, entre otros).
* Python y librerías bioinformáticas como `pandas`, `numpy`, `scipy`, `scanpy`, `biopython`.
* Quarto CLI para renderizar informes HTML interactivos.
* MultiQC para resumen de calidad de secuencias.
* Miniconda/Mamba y entornos específicos para análisis (por ejemplo, bulk RNA-seq).

> ✅ **Ventaja:** el contenedor garantiza un entorno reproducible y controlado, sin conflictos de dependencias. Esta es la opción **recomendada** para la ejecución de pipelines, tanto en local como en HPC o nube.



<hr style="border:none; height:1.5px; background-color:#777; width:100%; margin:35px 0 20px 0;">

<h4 id="section-4.2.2">4.2.2. 💻 Sin contenedor (local)</h4>

Ejecutar GenoScribe directamente en el sistema local requiere instalar manualmente todas las herramientas y librerías. Esto se puede deducir del **Dockerfile**, que lista los paquetes y dependencias necesarias:

* **Nextflow**: se instala con `curl -s https://get.nextflow.io | bash`.
* **R y RStudio**: incluyendo paquetes clave como `shiny`, `tidyverse`, `ggplot2`, `plotly`, `DT`, `dplyr`, `readxl`, `stringr`, `purrr`, `quarto`, `rmarkdown`, entre otros.
* **Python 3** y librerías bioinformáticas: `pandas`, `numpy`, `scipy`, `scanpy`, `biopython`.
* **Quarto CLI**: se descarga e instala desde [quarto.org](https://quarto.org).
* **Conda / Mamba**: para gestión de entornos y creación de entornos específicos (por ejemplo, `env_bulk_rna_seq.yml`).
* **Paquetes del sistema**: herramientas de compilación (`libssl-dev`, `libcurl4-openssl-dev`, `libxml2-dev`, `pkg-config`), Java (`openjdk-17-jre-headless`), utilidades (`curl`, `git`, `unzip`, `nano`, `less`).

> ⚠️ **Nota:** esta opción es más propensa a errores de instalación y conflictos de dependencias, y se recomienda principalmente **para depuración, desarrollo o pruebas rápidas**. Para análisis reproducibles y robustos, el uso de contenedores es siempre preferible.



<hr style="border:none; height:1.5px; background-color:#777; width:100%; margin:35px 0 20px 0;">

<h4 id="section-4.2.3">4.2.3. 📝 Resumen y recomendaciones</h4>

1. **Contenedor** → opción recomendada, ideal para producción, local/HPC/nube o ejecución repetida: reproducible, seguro y listo para usar.
2. **Local sin contenedor** → solo para pruebas, desarrollo o depuración: requiere instalación manual de todas las dependencias y configuración cuidadosa del entorno.

> 💡 **Consejo práctico:** aunque se ofrece la opción de ejecución local sin contenedor, **la instalación y mantenimiento de dependencias puede ser compleja**. Construir y ejecutar el contenedor simplifica enormemente este proceso y asegura resultados consistentes.




Perfecto, Adrián. Aquí tienes la subsección de **construcción del contenedor** desarrollada y más detallada, con subsubsecciones y explicaciones claras, además de la mención al GIF en la sección del workflow:




<br>

<img src="assets/4-other/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-4.3">4.3. 📦 Construcción del contenedor</h3>

GenoScribe puede ejecutarse dentro de **Docker** o adaptarse a **Apptainer**. Construir el contenedor localmente garantiza que todas las dependencias estén presentes, permite personalizar librerías y versiones, y asegura reproducibilidad total del análisis, tanto en entornos locales como en HPC o nube.

> ⚠️ **Importante:** todos los comandos de construcción de contenedores deben ejecutarse desde la **raíz del proyecto `GenoScribe`**.



<hr style="border:none; height:1.5px; background-color:#777; width:100%; margin:35px 0 20px 0;">

<h4 id="section-4.3.1">4.3.1. 🐳 Construcción de Docker</h4>

Para sistemas donde Docker está disponible (local, servidores con soporte Docker), se recomienda construir la imagen desde el Dockerfile incluido en el proyecto:

```bash
# Desde la raíz del proyecto GenoScribe
docker build -f 3-containers/1-docker/Dockerfile -t genoscribe:1.0 .

# Reconstrucción completa sin usar cache
docker build --no-cache -f 3-containers/1-docker/Dockerfile -t genoscribe:1.0 .
```

**Explicación de pasos importantes del Dockerfile:**

1. Imagen base `rocker/shiny:4.4.1` (R + Shiny Server).
2. Paquetes de sistema: librerías esenciales para R, Python, Java, compilación y utilidades (`libssl-dev`, `git`, `python3`, etc.).
3. Nextflow: ejecución de pipelines.
4. Quarto CLI: generación de informes interactivos.
5. Paquetes de R: `tidyverse`, `ggplot2`, `plotly`, `DT`, `readxl`, etc.
6. Python y librerías bioinformáticas: `pandas`, `numpy`, `scanpy`, `biopython`, entre otras.
7. Miniconda + Mamba: creación de entornos específicos como `env_bulk_rna_seq.yml`.
8. Copiado de carpetas del proyecto.
9. Permisos y enlaces simbólicos para Shiny y generación de reportes.
10. Exposición del puerto 3838.

> 💡 Construir la imagen localmente permite personalizar versiones de librerías, modificar entornos Conda y garantizar que funcione en distintos entornos sin problemas.



<hr style="border:none; height:1.5px; background-color:#777; width:100%; margin:35px 0 20px 0;">

<h4 id="section-4.3.2">4.3.2. 🧪 Construcción de Apptainer</h4>

En entornos HPC o donde Docker no está disponible, existen varias formas de generar un contenedor Apptainer:

**a) A partir de la imagen Docker construida localmente:**

```bash
# Desde la raíz del proyecto GenoScribe
apptainer build genoscribe.sif docker-daemon://genoscribe:1.0
```

**b) Descargando imagen preconstruida desde Docker Hub:**

```bash
# Desde la raíz del proyecto GenoScribe
apptainer build genoscribe.sif docker://adrichez/genoscribe:1.0
```

**c) (Experimental) Creación desde archivo `.def`:**

Se encuentra en [GenoScribe/3-containers/2-apptainer/genoscribe.def](../3-containers/2-apptainer/genoscribe.def). Esta opción permite construir directamente un contenedor Apptainer sin pasar por Docker, aunque todavía está en fase de pruebas:

```bash
# Desde la raíz del proyecto GenoScribe
apptainer build genoscribe.sif 3-containers/2-apptainer/genoscribe.def
```

**Notas importantes:**

* La opción `.def` es útil para usuarios avanzados que quieren construir un contenedor puramente Apptainer.
* Suele usarse **solo vía CLI**, ya que Shiny no siempre es compatible en HPC.
* Garantiza reproducibilidad y aislamiento de dependencias, similar a Docker.



<hr style="border:none; height:1.5px; background-color:#777; width:100%; margin:35px 0 20px 0;">

<h4 id="section-4.3.3">4.3.3. 🚀 Uso de imágenes preconstruidas (opción rápida)</h4>

```bash
# Docker
docker pull adrichez/genoscribe:1.0

# Apptainer
apptainer build genoscribe.sif docker://adrichez/genoscribe:1.0
```

* ✅ Inicio inmediato sin compilar.
* ⚠️ Menor flexibilidad para modificar dependencias.



<hr style="border:none; height:1.5px; background-color:#777; width:100%; margin:35px 0 20px 0;">

<h4 id="section-4.3.4">4.3.4. 🎬 Visualización del proceso (GIF)</h4>

El flujo completo, desde la **construcción de la imagen hasta la generación del informe con Shiny**, se puede visualizar en el **GIF de ejemplo** mostrado en el apartado anterior **<a href="#section-3.3">Demostración visual</a>**.

> 📌 Ilustra todo el proceso de preparación del entorno, permitiendo comprender de manera visual la secuencia de pasos recomendada.








<br>
<br>

<img src="assets/4-other/decoration/linea_divisoria_1.png" width="100%" style="border-radius: 10px;">

<h2 id="section-5">5. 🚀 Métodos de uso</h2>

GenoScribe ofrece distintos modos de ejecución según el perfil del usuario y el entorno disponible.  

Esta sección describe de manera detallada **cómo iniciar la app, ejecutar pipelines desde la terminal y adaptarse a distintos entornos (local, HPC o nube)**, permitiendo al usuario elegir el flujo de trabajo más adecuado para sus necesidades.  

Se incluyen recomendaciones, diferencias entre GUI y CLI, y consideraciones de reproducibilidad y escalabilidad.




<br>

<img src="assets/4-other/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-5.1">5.1. 🖼️ Ejecución de la app (modo interactivo)</h3>

**Descripción:**  

El modo interactivo permite iniciar GenoScribe con una **interfaz visual Shiny**, guiando al usuario paso a paso desde la selección del tipo de análisis hasta la obtención de informes finales.

**Comandos según entorno:**

* 🐳 **Dentro de contenedor Docker:**

  ```bash
  ./4-launch/2-docker/run_app_shiny.sh
  ```

* 💻 **Local sin contenedor:**

  ```bash
  ./4-launch/1-local/run_app_shiny.sh
  ```

**Ventajas del modo interactivo:**

* Abre la interfaz **Shiny** en el navegador, facilitando la exploración visual.
* Permite seleccionar el **tipo de análisis** (Bulk RNA-Seq, scRNA-Seq o Metagenómica).
* Completa los **parámetros del experimento** mediante formularios interactivos.
* Lanza automáticamente los pipelines y genera informes **HTML interactivos**, que incluyen tablas, gráficos y resultados resumidos.
* Ideal para usuarios novatos, para validación rápida de parámetros y para aprendizaje del flujo de trabajo.

> 🌟 **Tip:** aunque el modo GUI es más intuitivo, puede ser más lento en grandes volúmenes de datos. Para análisis masivos, considera el modo CLI.




<br>

<img src="assets/4-other/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-5.2">5.2. ⌨️ Ejecución desde la terminal (CLI)</h3>

**Descripción:**  

La ejecución por línea de comandos permite un **control total sobre los pipelines**, es más rápida y escalable, y es la opción recomendada para HPC, procesamiento por lotes o automatización.

**Comandos según entorno:**

* 🐳 **Docker:**

  ```bash
  ./4-launch/2-docker/run_app_shell.sh
  ```

* 🧪 **Apptainer / HPC:**

  ```bash
  ./4-launch/3-apptainer-hpc/run_app_shell.sh
  ```

* 💻 **Local sin contenedor:**

  ```bash
  ./4-launch/1-local/run_app_shell.sh
  ```

**Ventajas del modo CLI:**

* Ejecuta pipelines directamente desde la terminal, sin interacción visual.
* Genera informes reproducibles automáticamente, compatibles con Quarto y HTML.
* Adecuado para **automatización**, ejecución por lotes y grandes volúmenes de datos.
* Permite integración con scripts externos y gestión avanzada de parámetros.

> 💡 **Recomendación:** el modo CLI es ideal para usuarios avanzados, automatización de flujos y ejecución en HPC o nube.




<br>

<img src="assets/4-other/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-5.3">5.3. 🧹 Scripts auxiliares de limpieza y depuración</h3>

El proyecto incluye **scripts automáticos de limpieza** diseñados para **mantener el entorno ordenado** y garantizar la **reproducibilidad** de los análisis.  
Son especialmente útiles tras ejecutar varios pipelines o al realizar pruebas repetidas, ya que evitan que queden restos de ejecuciones previas.



<hr style="border:none; height:1.5px; background-color:#777; width:100%; margin:35px 0 20px 0;">

<h4 id="section-5.3.1">5.3.1. 🚿 ¿Qué limpian estos scripts?</h4>

Los scripts eliminan de forma **segura y controlada** ficheros y directorios generados automáticamente por los pipelines. Entre los elementos eliminados están:

- Directorios temporales: `work/`, `.nextflow/`, `.quarto/`, `*_cache`, `*_freeze`  
- Archivos de logs y trazas: `*.log*`, `.nextflow.log*`, `.RData`, `.Rhistory`  
- Artefactos auxiliares del sistema: `*.DS_Store`, `*.rds`  
- Resultados de informes o análisis previos dentro de `resources/2-nextflow-results/`  

Además, en lugar de borrar completamente ciertas carpetas, **las vacía sin eliminarlas**, preservando su estructura y el archivo `.gitkeep` cuando existe. Ejemplos:  
- `report/`  
- `resources/2-nextflow-results/*`  
- `1-app/www/reports/<pipeline>`  



<hr style="border:none; height:1.5px; background-color:#777; width:100%; margin:35px 0 20px 0;">

<h4 id="section-5.3.2">5.3.2. 📂 Estructura de los scripts</h4>

1. **`run_cleaning.sh` (global)**  
    
    Presenta un **menú interactivo** donde el usuario elige qué limpiar:  
    
    ```plaintext
    1) Bulk RNA-Seq  
    2) Single-cell RNA-Seq  
    3) Metagenómica  
    4) Todos los anteriores  
    ```  
    
    Internamente, este script lanza los correspondientes `run_cleaning_dir.sh` dentro de cada pipeline.  

2. **`run_cleaning_dir.sh` (por pipeline)**  
    
    Contiene las reglas específicas de limpieza para cada pipeline, aplicando patrones de eliminación y vaciado de carpetas.



<hr style="border:none; height:1.5px; background-color:#777; width:100%; margin:35px 0 20px 0;">

<h4 id="section-5.3.3">5.3.3. ▶️ Ejecución de los scripts</h4>

Todos los comandos deben ejecutarse **desde la raíz del proyecto (`GenoScribe/`)**:

- **💻 En local:**  

  ```bash
  ./4-launch/1-local/run_cleaning.sh
  ```

* **🐳 Dentro de contenedor Docker:**  

  ```bash
  ./4-launch/2-docker/run_cleaning.sh
  ```

* **🧪 Dentro de contenedor Apptainer (fase de desarrollo):**. 

  ```bash
  ./4-launch/3-apptainer-hpc/run_cleaning.sh
  ```



<hr style="border:none; height:1.5px; background-color:#777; width:100%; margin:35px 0 20px 0;">

<h4 id="section-5.3.4">5.3.4. ⌨️ Acceso interactivo al contenedor</h4>

Otro script auxiliar es `access_container.sh`, que abre una **terminal dentro del contenedor** (Docker o Apptainer).
Esto es útil para inspeccionar manualmente outputs, depurar fallos o lanzar comandos personalizados.

**Ejemplo de ejecución en Docker:**  

  ```bash
  ./4-launch/2-docker/access_container.sh
  ```  

<br>

> 💡 **Recomendación:** ejecutar `run_cleaning.sh` antes de un nuevo análisis garantiza un entorno libre de residuos y evita errores inesperados.
> Para depuración avanzada, `access_container.sh` ofrece control directo sobre el contenedor sin modificar los pipelines principales.




<br>

<img src="assets/4-other/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-5.4">5.4. 🌍 Ejecución en Local vs HPC/Nube</h3>

GenoScribe se puede ejecutar en distintos entornos, y la elección depende de **recursos disponibles, interfaz deseada y volumen de datos**.

| Entorno    | Contenedor         | Interfaz    | Consideraciones                                                                               |
| ---------- | ------------------ | ----------- | --------------------------------------------------------------------------------------------- |
| Local      | Docker / Apptainer | Shiny / CLI | Máxima flexibilidad, GUI disponible, fácil depuración                                          |
| Local      | Ninguno            | Shiny / CLI | Requiere instalación manual de dependencias, útil para pruebas y desarrollo                   |
| HPC / Nube | Apptainer          | CLI         | GUI no disponible, puede requerir módulos del sistema y configuración de variables de entorno  |

> 🔹 **Consejo:** siempre que sea posible, ejecutar dentro de un **contenedor** para garantizar **reproducibilidad, aislamiento de dependencias y consistencia de resultados**.




<br>

<img src="assets/4-other/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-5.5">5.5. 🎬 Flujo de ejecución resumido (GIF)</h3>

Para visualizar el **proceso completo de ejecución**, desde la construcción de la imagen del contenedor hasta la obtención del informe final, se puede consultar, al igual que en apartado anterior, el **GIF de ejemplo** en la sección **<a href="#section-3.3">Demostración visual</a>**.

> 📌 **Nota:** este GIF sirve como guía visual para entender el flujo recomendado, aunque los comandos pueden ejecutarse directamente en terminal para usuarios avanzados.






<br>
<br>

<img src="assets/4-other/decoration/linea_divisoria_1.png" width="100%" style="border-radius: 10px;">

<h2 id="section-6">6. ⚙️ Parámetros específicos</h2>

Para ejecutar correctamente los análisis en **GenoScribe**, es necesario proporcionar unos **parámetros de entrada** bien definidos. Estos parámetros permiten localizar los datos generados previamente por herramientas bioinformáticas (como **miARma-seq**) y adaptarlos al flujo de generación de informes reproducibles.

Existen dos formas de introducir estos parámetros:  

- **Desde la terminal (CLI)** al ejecutar `run_app_shell.sh`.  
- **Desde la interfaz gráfica Shiny** al ejecutar `run_app_shiny.sh`.  




<br>

<img src="assets/4-other/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-6.1">6.1. 📑 Parámetros requeridos</h3>

En el caso concreto de **Bulk RNA-Seq**, se necesitan **dos parámetros obligatorios**:

1. **Ruta absoluta del proyecto (`ruta_proyecto`)**  

    - Corresponde a la carpeta principal donde se encuentran los resultados generados por la herramienta bioinformática empleada.  
    - Ejemplo en un ordenador local:  

      ```bash
      /Users/adrian/Documents/4 Workspace/Prototipo-resultados/01-EXT-25-Bulk-RNA-Seq
      ```

2. **Nombre del experimento (`nombre_experimento`)**  

    - Es el nombre del subdirectorio dentro de `Analisis/` y `Resultados/` que agrupa todos los outputs de un mismo experimento.  
    - Ejemplo:  

      ```bash
      exp1
      ```

Ejemplo de parámetros combinados:

```yaml
ruta_proyecto: "/Users/adrian/Documents/4 Workspace/Prototipo-resultados/01-EXT-25-Bulk-RNA-Seq"
nombre_experimento: "exp1"
```

⚠️ **Importante**:  

Si la ejecución se hace desde **Shiny dentro del contenedor**, la ruta local se monta como volumen. En ese caso, en el formulario Shiny se debe indicar una ruta relativa del tipo:

```bash
data/01-EXT-25-Bulk-RNA-Seq
```

En lugar de la ruta completa de tu sistema.

Además, si se usan contenedores, se debe proporcionar también una **ruta local de salida** para que el informe generado dentro del contenedor quede accesible en tu dispositivo. Ejemplo:

```bash
/Users/adrian/Documents/4 Workspace/Reports
```




<br>

<img src="assets/4-other/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-6.2">6.2. 🌟 Procedencia de los datos: miARma-seq</h3>

Los resultados que se deben proporcionar a GenoScribe provienen de la herramienta **[miARma-seq](https://github.com/eandresleon/miARma-seq)**, desarrollada por Eduardo Andrés León.

**miARma-seq** es un pipeline modular para análisis de datos **RNA-Seq (bulk y small RNA)**. Sus características principales son:

* **Control de calidad** de lecturas con *FastQC*.
* **Alineamiento** contra genomas de referencia usando *HISAT2*, *Bowtie2* u otros algoritmos.
* **Cuantificación de expresión** (matrices crudas y normalizadas).
* **Análisis de expresión diferencial** (con *DESeq2*, *edgeR*).
* **Enriquecimiento funcional** de genes diferencialmente expresados (GO, KEGG, etc.).
* **Reproducibilidad**: genera siempre la misma estructura de carpetas y ficheros, lo que facilita su integración con GenoScribe.

En el caso de Bulk RNA-Seq, según el protocolo definido, se deben aportar los siguientes resultados:

* **Pre\_fastqc\_results/** → Informes *FastQC* previos al alineamiento.
* **hisat2\_results/** → Archivos `.bam`, `.sam` y métricas del alineamiento.
* **Readcount\_results/** → Matriz cruda de conteos (no normalizada).
* **Resultados/**

  * `targets_exp1.txt`: archivo con la definición de muestras y condiciones.
  * `exp1_QC.pdf`: informe de control de calidad global.
  * `exp1_RPKM.xls`: matriz de expresión normalizada (RPKM).
  * `*_DEG*.xlsx`: resultados de expresión diferencial.
  * `*Volcano*.pdf`: volcanoplots de genes diferencialmente expresados.
  * `Enrichment/`: resultados de análisis de enriquecimiento (PDF y XLS por comparativa).




<br>

<img src="assets/4-other/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-6.3">6.3. 🌳 Ejemplo de estructura de proyecto</h3>

La siguiente estructura ejemplifica cómo deben organizarse los resultados de un análisis típico de **miARma-seq** para ser utilizados en GenoScribe.

```plaintext
01-EXT-25-Bulk-RNA-Seq
├── Analisis
│   ├── exp1
│   │   ├── hisat2_index/              # Índices de referencia HISAT2
│   │   ├── hisat2_results/            # BAM/SAM + métricas del alineamiento
│   │   ├── Pre_fastqc_results/        # Informes FastQC individuales
│   │   └── Readcount_results/         # Matriz cruda de conteos
│   └── reads_down_select_exp1/        # FASTQ procesados
└── Resultados
    ├── exp1
    │   ├── exp1_QC.pdf                # Informe global de QC
    │   ├── exp1_RPKM.xls              # Matriz de expresión normalizada
    │   ├── DEG_*_vs_*.xlsx            # Resultados de expresión diferencial
    │   ├── Volcano_plot_*.pdf         # Volcanoplots de DEG
    │   └── Enrichment/                # Enriquecimientos por comparativa
    │       ├── Enrichment_GO_BP*.pdf
    │       ├── Enrichment_GO_BP*.xls
    │       └── Enrichment_KEGG*.pdf
    ├── subsampling_exp1.sh            # Script auxiliar de subsampling
    └── targets_exp1.txt               # Definición experimental
```
<br>

> 💡 **Recomendación**: Antes de ejecutar GenoScribe, comprobar que la carpeta del proyecto contiene al menos:
>
> * `Pre_fastqc_results/`
> * `hisat2_results/`
> * `Readcount_results/`
> * `Resultados/exp1/` con sus informes PDF/XLSX
> * El archivo `targets_exp1.txt`




<br>

<img src="assets/4-other/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-6.4">6.4. ✅ Resumen práctico</h3>

* Los **parámetros de entrada** son:  

  1. Ruta absoluta del proyecto con resultados.  
  2. Nombre del experimento.  

* Los resultados deben provenir de **miARma-seq**, que garantiza una estructura reproducible.  
* La carpeta del proyecto debe contener todos los outputs necesarios (FastQC, BAM, conteos, normalizaciones, DEG, enriquecimientos).  
* Si se ejecuta desde contenedor, usar rutas relativas (`data/01-EXT-25-Bulk-RNA-Seq`) en la interfaz Shiny y definir un volumen local para almacenar los informes generados.  






<br>
<br>

<img src="assets/4-other/decoration/linea_divisoria_1.png" width="100%" style="border-radius: 10px;">

<h2 id="section-7">7. 🔬 Etapas del pipeline</h2>

El pipeline de **Bulk RNA-Seq** implementado en Nextflow dentro de GenoScribe organiza el flujo de trabajo en **fases secuenciales**, cada una con un propósito específico y outputs intermedios que posteriormente alimentan la generación del informe final.  

Estas etapas no reemplazan al análisis primario (realizado con **miARma-seq**), sino que lo **complementan**: GenoScribe toma los resultados ya procesados (alineamientos, conteos, DEG, enriquecimientos, etc.) y los convierte en un **informe reproducible y personalizable** mediante *Quarto*.  




<br>

<img src="assets/4-other/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-7.1">7.1. 📂 Copia del proyecto</h3>

**Proceso: `COPIAR_CARPETA_PROYECTO`**  

- **Objetivo**: Copiar las carpetas esenciales del proyecto de miARma-seq (`Analisis`, `Documentacion`, `Resultados`) hacia el directorio de trabajo gestionado por Nextflow.  

- **Motivo**:  
  - Garantizar que se trabaja sobre un **espacio controlado y reproducible**.  
  - Excluir archivos demasiado grandes (>300 MB) que no son necesarios para el informe (e.g. BAM completos).  
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

<img src="assets/4-other/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-7.2">7.2. 📊 Generación de reporte QC integrado</h3>

**Proceso: `MULTIQC`**  

- **Objetivo**: Unificar los resultados de *FastQC* (que miARma-seq guarda en `Pre_fastqc_results/`) en un único informe visual con *MultiQC*.  

- **Motivo**:  
  - Facilitar la interpretación rápida del control de calidad.  
  - Evitar navegar entre múltiples PDFs/HTMLs individuales.  

- **Input esperado**:  
  ```
  Analisis/<experimento>/Pre\_fastqc\_results/
  ```

- **Output**:  
  ```
  outdir/2-fastqc-report/results-multiqc/multiqc\_report.html
  outdir/2-fastqc-report/results-multiqc/multiqc\_data/
  ```

El informe `multiqc_report.html` resume métricas clave como **calidad de secuencias, contenido GC, adaptadores** y otros indicadores críticos de QC.




<br>

<img src="assets/4-other/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-7.3">7.3. 📑 Procesamiento de matrices de expresión</h3>

**Proceso: `PROCESAR_RPKM`**  

- **Objetivo**: Transformar y preparar el archivo de expresión normalizada (`*_RPKM.xls`) generado por miARma-seq en un formato de texto tabular (`.txt`) listo para ser usado por Quarto.  

- **Motivo**:  
  - Estandarizar nombres de columnas.  
  - Facilitar análisis estadísticos posteriores (DEG, enriquecimiento).  

- **Input esperado**:  
  ```
  Resultados/<experimento>/<experimento>\_RPKM.xls
  ```
  
- **Output**:  
  ```
  outdir/3-analisis-estadistico/<experimento>\_RPKM.txt
  ```

Este archivo intermedio es crucial: funciona como **punto de entrada estadístico** para la generación automática de gráficos y tablas en el informe.




<br>

<img src="assets/4-other/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-7.4">7.4. 📝 Renderizado de informe en Quarto</h3>

**Proceso: `RENDER_QUARTO`**  

- **Objetivo**: Ejecutar la plantilla de **Quarto** (`index.qmd`) y generar el **informe final reproducible**.  

- **Funcionamiento**:  
  - Se crea dinámicamente un archivo `params.yml` con los parámetros proporcionados (`ruta_proyecto`, `nombre_experimento`).  
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

El informe integra:
- Resultados de QC (MultiQC).  
- Gráficos y tablas de expresión (matriz RPKM procesada).  
- Resultados de DEG y enriquecimiento (aportados por miARma-seq).  
- Resúmenes automáticos listos para publicación o revisión.




<br>

<img src="assets/4-other/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-7.5">7.5. 🔄 Ejemplo de flujo de outputs</h3>

Para ilustrar cómo se organizan los resultados generados por el pipeline de Bulk RNA-Seq, tomemos como ejemplo un proyecto con nombre de experimento **`exp_1`**.

Al ejecutar el pipeline, los outputs principales definidos en **`outdir/`** tendrán una estructura similar a la siguiente:

```bash
outdir/
├── 1-project-data/              # Copia del proyecto original de entrada
├── 2-fastqc-report/
│   └── results-multiqc/
│       ├── multiqc_report.html  # Informe de calidad global
│       └── multiqc_data/        # Datos agregados por MultiQC
├── 3-analisis-estadistico/
└── └── exp_1_RPKM.txt           # Matriz de expresión normalizada (ejemplo)
```

<br>

💡 **Nota importante sobre la localización de los outputs**:

* Durante la ejecución, Nextflow genera resultados intermedios en su carpeta de trabajo temporal **`/work`**, dentro del directorio del pipeline de Bulk-RNA-Seq:

  ```bash
  GenoScribe/2-pipelines/1-bulk-rna-seq/work
  ```

* Posteriormente, mediante la directiva **`publishDir`**, los resultados generados se copian automáticamente al directorio de salida especificado en el parámetro **`outdir`** (en este caso, **`resources/2-nextflow-results`**).
  De este modo, el pipeline asegura que todos los archivos relevantes queden disponibles y organizados en carpetas temáticas.

  Esta organización tiene un propósito doble:

  1. **Facilitar el acceso y la interpretación** de los resultados desde el informe generado con **Quarto**.
  2. **Permitir la correcta distribución del informe** de forma independiente, incluyendo todos los datos necesarios ya consolidados y listos para su consulta, sin depender de la ubicación de los datos originales o externos.

  ```groovy
  publishDir "${params.outdir}/1-project-data", mode: 'copy'
  publishDir "${params.outdir}/2-fastqc-report/results-multiqc", mode: 'copy'
  publishDir "${params.outdir}/3-analisis-estadistico", mode: 'copy'
  ```

📊 **Generación del informe final**  

Una vez organizados los outputs en el directorio definido por `outdir`, se procede a la construcción del informe bioinformático.
Este informe se genera mediante **Quarto**, y su carpeta de salida está configurada en el archivo **`_quarto.yml`** del pipeline:

```yml
project:
  type: website
  output-dir: report
```

De este modo, la carpeta **`report/`**, ubicada en:

```bash
GenoScribe/2-pipelines/1-bulk-rna-seq/report/
```

actúa como un **sitio web estático** que integra y organiza todos los resultados producidos por el pipeline (análisis de calidad, tablas de expresión, gráficos, etc.), ofreciendo a los investigadores una **vista unificada, interactiva y fácilmente interpretable** de los datos.

✨ **En resumen:**

1. Los resultados se generan primero en **`/work`**.
2. Luego, se publican en la carpeta definida por **`outdir`** siguiendo la estructura establecida.
3. Finalmente, se integran en un **informe reproducible en Quarto**, almacenado en la carpeta **`report/`** del pipeline.

De esta manera, todo el flujo de outputs queda **automatizado, organizado y accesible**, facilitando tanto el análisis como la posterior comunicación científica ✅.




<br>

<img src="assets/4-other/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-7.6">7.6. ✅ Resumen conceptual</h3>

En términos generales, el pipeline desarrollado en **Nextflow** sigue una secuencia lógica y automatizada:

1. **Organiza los datos iniciales**, copiando y estructurando la información relevante del proyecto original.
2. **Evalúa la calidad de los datos**, generando un informe global de control de calidad con *MultiQC*.
3. **Prepara y transforma la matriz de expresión**, dejándola lista para su análisis estadístico y biológico.
4. **Produce un informe final en Quarto**, totalmente automatizado y reproducible, que integra todos los resultados en un único documento coherente.

De esta manera, **GenoScribe** pone el foco en la **fase de integración y comunicación de resultados**, donde convierte análisis complejos y dispersos en un **informe claro, estructurado y fácilmente compartible**, favoreciendo la reproducibilidad y la distribución independiente de los datos originales.






<br>
<br>

<img src="assets/4-other/decoration/linea_divisoria_1.png" width="100%" style="border-radius: 10px;">

<h2 id="section-8">8. 📊 Resultados e informe</h2>

El pipeline de **Bulk RNA-Seq** en GenoScribe genera un **informe interactivo, reproducible y auto-contenido**, estructurado en tres pestañas principales que permiten explorar de manera progresiva y ordenada todos los resultados del experimento.

Mediante el siguiente GIF se puede apreciar de forma visual la estructura y funcionalidad del informe:

<p align="center">
  <img src="assets/1-bulk-rna-seq/bulk_rna_seq_report.gif" alt="Estructura del informe para Bulk RNA-Seq" width="65%">
</p>




<br>

<img src="assets/4-other/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-8.1">8.1. 🏠 Pestaña “Inicio”</h3>

Esta pestaña, definida por `index.qmd`, ofrece una **introducción general** al proyecto y al análisis realizado, incluyendo:

* Contexto y objetivos del experimento.
* Descripción de la herramienta utilizada: **miARma-Seq**.
* Flujo general del pipeline empleado.
* Imágenes representativas del workflow y la estructura de análisis.

Sirve como punto de partida para comprender el alcance del proyecto y la lógica del pipeline antes de profundizar en los resultados.




<br>

<img src="assets/4-other/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-8.2">8.2. 📑 Pestaña “Resumen”</h3>


Generada a partir de `Tab2-Resumen/resumen.qmd`, esta sección proporciona **una visión general integral del experimento de RNA-Seq**, destacando:

* **Diseño experimental y contexto**: descripción de las muestras únicas, condiciones evaluadas, tecnología empleada (Illumina paired-end) y longitud media de las lecturas.
* **Estadísticas globales de calidad**: total de lecturas, porcentaje de GC, lecturas duplicadas, longitud media y porcentaje de lecturas fallidas.
* **Representación visual**: tarjetas resúmen para interpretación rápida y tablas detalladas por muestra, permitiendo identificar variaciones o posibles problemas de calidad.

Esta pestaña establece las bases para evaluar la representatividad y calidad del conjunto de datos antes de abordar análisis más profundos, preparando al usuario para continuar con la exploración en la pestaña **Análisis**.




<br>

<img src="assets/4-other/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-8.3">8.3. 🔬 Pestaña “Análisis”</h3>

Incluye todos los archivos `.qmd` dentro de `Tab3-Analisis` y tiene como objetivo ofrecer **una visión completa y estructurada del pipeline miARma-Seq**, describiendo cada etapa del análisis y permitiendo al lector acceder de forma modular a los resultados:



<hr style="border:none; height:1.5px; background-color:#777; width:100%; margin:35px 0 20px 0;">

<h4 id="section-8.3.1">8.3.1. 📖 Contenido principal de esta pestaña:</h4>

1. **0-contexto.qmd** – Contextualización del experimento y estructura del informe.
2. **1-revision-inicial.qmd** – Revisión de muestras y metadatos, para verificar consistencia y distribución por condiciones experimentales.
3. **2-evaluacion-calidad.qmd** – Control de calidad de las lecturas:

   * Análisis global mediante MultiQC.
   * Evaluación individual por muestra con FastQC (lecturas forward y backward).
4. **3-alineamiento.qmd** – Alineamiento al genoma de referencia usando HISAT2 y estadísticas de mapeo.
5. **4-cuantificacion.qmd** – Cuantificación de expresión génica con featureCounts:

   * Matrices de conteos y longitud génica.
   * Visualizaciones de distribución de lecturas y genes detectados.
6. **5-analisis-estadistico.qmd** – Análisis de expresión:

   * **5.1-normalizacion.qmd** – Corrección de sesgos técnicos y transformación de datos.
   * **5.2-evaluacion-calidad-normalizacion.qmd** – Validación de normalización mediante PCA y clustering.
   * **5.3-analisis-expresion.qmd** – Identificación de genes diferencialmente expresados usando edgeR y NOISeq, con visualizaciones tipo volcano plots y tablas interactivas.
   * **5.4-analisis-funcional.qmd** – Enriquecimiento funcional de genes DE: GO, KEGG y asociaciones biológicas.
7. **6-conclusiones.qmd** – Síntesis de hallazgos, implicaciones biológicas y perspectivas futuras.

Esta organización **modular** permite que el lector explore el informe de manera flexible, centrarse en análisis específicos o entender el panorama completo según su interés. Cada subsección presenta resultados con **gráficos interactivos, tablas dinámicas y resúmenes interpretativos**, facilitando tanto la comprensión técnica como la biológica.




<br>

<img src="assets/4-other/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-8.4">8.4. 📂 Organización de archivos y recursos</h3>

El informe se genera como un **sitio web auto-contenido** con la siguiente estructura:

```bash
report/
├── index.html                  # Página principal del informe
├── resources/                  # Recursos del informe (imágenes, scripts, estilos)
│   ├── 1-essential/            # Imágenes y scripts de Quarto
│   └── 2-nextflow-results/     # Resultados de Nextflow (MultiQC, RPKM, etc.)
└── site_libs/                  # Librerías necesarias para la interactividad
```

Esta estructura asegura que el informe puede **visualizarse, compartirse y navegarse de forma independiente** sin depender de la ubicación de los datos brutos.






<br>
<br>

<img src="assets/4-other/decoration/linea_divisoria_1.png" width="100%" style="border-radius: 10px;">

<h2 id="section-9">9. 💬 Comentarios finales</h2>

El módulo de **Bulk RNA-Seq** dentro del proyecto **GenoScribe** tiene como propósito principal **facilitar la última fase del análisis bioinformático**, transformando resultados dispersos y datos intermedios en un **informe automatizado, reproducible y fácilmente interpretable**. Su diseño modular permite:

* Centralizar los resultados de control de calidad, alineamiento, cuantificación y análisis estadístico de expresión diferencial.
* Presentar estos resultados de manera organizada y accesible para distintos perfiles de usuario, desde biólogos hasta bioinformáticos.
* Garantizar la **reproducibilidad** mediante la integración con Nextflow y Quarto, lo que asegura que los informes puedan generarse de forma consistente independientemente del entorno de ejecución.




<br>

<img src="assets/4-other/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-9.1">9.1. 🎯 Objetivos alcanzados</h3>

Con este módulo se ha logrado:

1. **Automatización completa del flujo de resultados:** los outputs intermedios y finales se copian y estructuran automáticamente en carpetas temáticas mediante `publishDir`.
2. **Generación de informes reproducibles:** el informe final en Quarto integra todas las fases del análisis, con gráficos interactivos, tablas dinámicas y resúmenes interpretativos.
3. **Modularidad y flexibilidad:** cada etapa del pipeline se documenta en secciones independientes, permitiendo explorar tanto la visión global como los detalles técnicos de cada proceso.
4. **Compatibilidad con múltiples entornos:** el pipeline puede ejecutarse en local, HPC o nube, con contenedores Docker o Apptainer, garantizando portabilidad y consistencia de resultados.




<br>

<img src="assets/4-other/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-9.2">9.2. 🛠️ Limitaciones y futuras mejoras</h3>

A pesar de los avances alcanzados, existen algunas limitaciones y áreas de mejora que se han identificado para próximas versiones:

* **Dependencia de formatos y estructura de datos:** el pipeline requiere que los datos de entrada estén organizados según las convenciones establecidas; cualquier desviación puede generar errores en la ejecución.
* **Recursos computacionales:** análisis de grandes experimentos con cientos de muestras pueden requerir memoria y CPU significativas; la optimización de paralelización y uso de HPC podría ampliarse.
* **Extensión de métricas de calidad y análisis funcional:** actualmente se incluyen métricas estándar de QC y análisis funcional básico; se podrían integrar nuevos indicadores, métricas de batch effect o análisis más avanzados de rutas metabólicas.
* **Automatización de reportes avanzados:** la inclusión de visualizaciones personalizadas adicionales, resúmenes ejecutivos y enlaces directos a resultados crudos podría mejorar la experiencia de usuario.
* **Compatibilidad con otros pipelines de preprocesamiento:** hoy se asume la salida de miARma-Seq; futuras versiones podrían permitir integración directa con otros pipelines de RNA-Seq o metagenómica.

En conjunto, este módulo representa un **paso fundamental en la consolidación de resultados de RNA-Seq**, sirviendo como herramienta robusta para la generación de informes finales claros y completos, al tiempo que establece una base sólida para futuras mejoras y ampliaciones funcionales del proyecto.






<br>
<br>

<img src="assets/4-other/decoration/linea_divisoria_1.png" width="100%" style="border-radius: 10px;">

<h2 id="section-10">10. 📬 Contacto</h2>

Para consultas, sugerencias o reportes de errores relacionados con este proyecto, puedes contactarnos a través de:

<ul style="list-style:none; padding:0; margin:0; gap:10px;">
  <li style="display:flex; align-items:center; gap:10px; margin-bottom:8px;">
    <a href="mailto:asanca33@gmail.com" style="text-decoration:none;">
      <span style="background-color:#ff6f61;color:white;padding:4px 10px;border-radius:12px;font-weight:bold;">📧 Email</span>
    </a>
    <span>Correo electrónico para consultas: <a href="mailto:asanca33@gmail.com">asanca33@gmail.com</a></span>
  </li>

  <li style="display:flex; align-items:center; gap:10px; margin-bottom:8px;">
    <a href="https://github.com/adrichez/GenoScribe" style="text-decoration:none;">
      <span style="background-color:#6cc644;color:white;padding:4px 10px;border-radius:12px;font-weight:bold;">🐙 GitHub</span>
    </a>
    <span>Repositorio y contribuciones: <a href="https://github.com/adrichez/GenoScribe">https://github.com/adrichez/GenoScribe</a></span>
  </li>

  <li style="display:flex; align-items:center; gap:10px; margin-bottom:8px;">
    <a href="6-info/" style="text-decoration:none;">
      <span style="background-color:#1da1f2;color:white;padding:4px 10px;border-radius:12px;font-weight:bold;">📚 Docs</span>
    </a>
    <span>Documentación adicional: <a href="6-info/">6-info/</a></span>
  </li>
</ul>

<br>

<hr style="border:none; height:0.3px; background-color:#777; width:65%; margin:20px auto 25px auto;">

<p align="center" style="margin-top:0.5rem; color:#777; font-size:0.95rem;">
💡 Sus comentarios y contribuciones ayudan a que GenoScribe sea más <strong>robusto, reproducible y accesible</strong> para la comunidad bioinformática.
</p>
