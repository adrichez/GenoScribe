<p align="center">
  <img src="06-info/assets/01-general/main_cover_guide.png" alt="GenoScribe — Banner: Generador de informes bioinformáticos" style="max-width:100%; height:auto; border-radius: 10px;">
</p>

<div align="center">
  <h1 style="color: #39A7BF;">Sistema Inteligente y Reproducible para la Generación de Informes Bioinformáticos</h1>
  <p style="color: #5283e3;"><strong>Generación automatizada de informes interactivos a partir de pipelines ómicos (transcriptómica, metagenómica y metatranscriptómica) mediante contenedores y entornos cloud/HPC</strong></p>

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
    <a href="#section-1">¿Qué es?</a> • 
    <a href="#section-2">Highlights</a> • 
    <a href="#section-3">Estructura</a> • 
    <a href="#section-4">Requisitos</a> • 
    <a href="#section-5">Workflow</a> • 
    <a href="#section-6">Quickstart</a> • 
    <a href="#section-7">Docs</a> • 
    <a href="#section-8">Ejemplos</a> • 
    <a href="#section-9">Tecnologías</a> •
    <a href="#section-10">Objetivos</a> • 
    <a href="#section-11">Contacto</a>
  </p>
</div>






<br>
<br>

<img src="06-info/assets/03-common/decoration/linea_divisoria_1.png" width="100%" style="border-radius: 10px;">

<h2 id="section-1">1. 🚀 Descripción del proyecto</h2>

**GenoScribe** es un **sistema inteligente y reproducible** diseñado para transformar automáticamente los resultados de diversos **pipelines bioinformáticos** en **informes interactivos y estandarizados**. Su arquitectura está estratégicamente **organizada por tipo de análisis**, permitiendo una gestión modular y escalable de diferentes disciplinas ómicas.

El sistema está diseñado para evolucionar y expandirse, clasificando sus capacidades según el estado de implementación de sus módulos:

- ✅ **Módulos Disponibles:** Análisis de *Bulk RNA-Seq*, *Single-Cell RNA-Seq (scRNA-Seq)*, *Transcriptómica Espacial (ST)* y *Metagenómica de Amplicones (16S/18S/ITS)*.
- 📅 **Ampliaciones Previstas:** *Metagenómica Shotgun* y *Metatranscriptómica* (estructuras de directorio ya integradas para futura expansión).

La herramienta central es una **aplicación Shiny** que permite al usuario proporcionar de forma sencilla los **parámetros necesarios para generar el informe**, como el directorio de los datos procesados, el nombre del experimento o la versión del reporte. A partir de esta entrada, el sistema activa el **pipeline correspondiente** ejecutándolo en local o dentro de un **contenedor aislado** (Apptainer/Docker), garantizando la **consistencia**, la **reproducibilidad** y el aislamiento total de las dependencias.

El flujo culmina en la generación de un **informe Quarto en HTML** de alta fidelidad, adaptado específicamente a la naturaleza de cada análisis. Cada informe integra:

- 📊 **Visualizaciones dinámicas** y personalizables según los resultados obtenidos.
- 📈 **Gráficos interactivos** con funcionalidades de zoom, tooltip y filtrado.
- 🧾 **Tablas interactivas** exportables para un manejo ágil de los datos.
- 🧠 **Resúmenes ejecutivos** que sintetizan los principales hallazgos biológicos.
- 🧩 **Trazabilidad técnica:** Registro de metadatos, versiones de herramientas y logs de ejecución.
- 🤖 **Mini Chatbot RAG (beta):** Un asistente inteligente que permite al usuario interactuar con el contenido del informe y consultar conocimientos externos para profundizar en la interpretación de los resultados.

Gracias a su enfoque **flexible y escalable**, GenoScribe puede desplegarse en entornos **locales, HPC o en la nube**. Esta solución optimiza la carga de trabajo manual y estandariza la comunicación científica, acelerando la transición de los datos brutos a la toma de decisiones informada.






<br>
<br>

<img src="06-info/assets/03-common/decoration/linea_divisoria_1.png" width="100%" style="border-radius: 10px;">

<h2 id="section-2">2. ⭐ Características principales</h2>

- 🧬 **Arquitectura modular de pipelines** **&rArr;** El sistema está organizado por disciplinas ómicas, ofreciendo soporte para **Transcriptómica del Huésped** (Bulk y Single-Cell operativos; Espacial en desarrollo) y **Análisis de Comunidades** (Metagenómica de Amplicones disponible; Shotgun y Metatranscriptómica proyectados). Cada flujo de trabajo está diseñado para ingerir datos bioinformáticos previos e integrarlos de forma **reproducible y automatizada**. Esto elimina la necesidad de pasos manuales, minimiza errores y garantiza la **consistencia de los informes** en cada ejecución.  

- 📊 **Informes interactivos** **&rArr;** Los resultados se presentan como **informes HTML dinámicos** construidos con **Quarto** y potenciados con **visualizaciones interactivas (Plotly, D3.js)**. Los usuarios pueden **explorar gráficos**, **filtrar tablas**, navegar entre secciones y descargar figuras de alta resolución, transformando datos brutos en conocimiento claro, accesible y listo para su publicación.  

- 🤖 **Mini Chatbot RAG para recuperación de información** **&rArr;** Implementación de un **sistema de IA y NLP** que utiliza **Transformers y spaCy** para convertir textos, informes técnicos y guías especializadas en **embeddings**. Estos permiten generar **resúmenes automáticos y respuestas contextualizadas** basadas en los resultados del informe. Esta solución es ligera, autónoma y portátil, lo que permite incrustar inteligencia artificial directamente en el informe HTML sin depender de costosos recursos externos, facilitando una interpretación de datos asistida.  

- 🐳 **Reproducibilidad garantizada con contenedores** **&rArr;** Cada pipeline puede ejecutarse dentro de un **contenedor Apptainer o Docker**, lo que asegura un **aislamiento total de dependencias**, **consistencia entre diferentes entornos** de trabajo y la posibilidad de **replicar los análisis** en cualquier sistema sin conflictos de software ni configuraciones ocultas.  

- ☁️ **Despliegue flexible (local / HPC / nube)** **&rArr;** Diseñado para la versatilidad, el sistema puede ejecutarse en **estaciones de trabajo personales**, en **clústeres de computación de alto rendimiento (HPC)** o en la **nube**. Esta flexibilidad permite escalar la capacidad de procesamiento según el volumen de datos, optimizando tiempos de respuesta sin comprometer la seguridad.  

- 📦 **Estandarización y trazabilidad** **&rArr;** Cada informe incluye una sección detallada de **metadatos de ejecución**, versiones de software, parámetros empleados y logs de procesamiento. De este modo, se asegura una **trazabilidad completa**, permitiendo a cualquier investigador **auditar o replicar** los resultados con precisión forense en el futuro.  






<br>
<br>

<img src="06-info/assets/03-common/decoration/linea_divisoria_1.png" width="100%" style="border-radius: 10px;">

<h2 id="section-3">3. 📂 Estructura del proyecto</h2>

El repositorio está organizado de forma modular para separar claramente la **interfaz de usuario**, los **pipelines de análisis**, los **entornos reproducibles** y la **documentación**. Esto facilita la navegación, el mantenimiento y la extensión del sistema.

```plaintext
GenoScribe          # Directorio principal del proyecto
├── 01-app          # App Shiny y recursos web
├── 02-pipelines    # Pipelines de análisis y plantillas Quarto
├── 03-containers   # Definición de entornos reproducibles
├── 04-launch       # Scripts de lanzamiento
├── 05-examples     # Estructuras base e informes de ejemplo
├── 06-info         # Documentación y especificaciones
└── README.md       # Documento con información general del proyecto
```

<br>

A continuación se detalla la función de cada directorio:

- **`01-app/`** **&rArr;** Contiene la aplicación Shiny, que actúa como punto de entrada principal para el usuario. A través de una interfaz intuitiva, permite seleccionar el tipo de análisis **Bulk RNA-Seq**, **scRNA-Seq**, **Transcriptómica Espacial** o **Metagenómica**, introducir los parámetros necesarios y ejecutar el pipeline correspondiente, iniciando la generación del informe interactivo.
- **`02-pipelines/`** **&rArr;** Incluye los pipelines bioinformáticos por tipo de análisis y las plantillas Quarto para generar los informes finales, así como archivos de ejemplo y scripts en R, Python o Snakemake/Nextflow.  
- **`03-containers/`** **&rArr;** Define los entornos reproducibles, incluyendo Dockerfiles o recetas Apptainer, dependencias específicas y versionado de imágenes.  
- **`04-launch/`** **&rArr;** Scripts para ejecutar la app Shiny y desplegar los pipelines en local, contenedores, HPC o cloud, incluyendo utilidades de montaje de volúmenes y registro de logs.  
- **`05-examples/`** **&rArr;** Scripts para facilitar la creación de las estructuras base que deberían de tener los directorios con los resultados proporcionados e informes de ejemplo generados a partir de los pipelines y plantillas para cada tipo de análisis, que ilustran el formato y contenido esperado de los resultados finales.  
- **`06-info/`** **&rArr;** Documentación técnica y especificaciones detalladas para cada tipo de análisis, así como guías de usuario generales.   
- **`README.md`** **&rArr;** Documento principal con descripción general, estructura del proyecto, guía rápida de uso y enlaces a la documentación detallada.  






<br>
<br>

<img src="06-info/assets/03-common/decoration/linea_divisoria_1.png" width="100%" style="border-radius: 10px;">

<h2 id="section-4">4. ⚙️ Requisitos</h2>

Antes de utilizar el sistema, asegúrese de contar con los siguientes elementos para garantizar un funcionamiento correcto y reproducible:

* 📦 **Docker o Apptainer** **&rArr;** imprescindibles para construir y ejecutar los **contenedores** que incluyen la aplicación Shiny, los pipelines y todas las dependencias bioinformáticas.

  * **Docker**: recomendado para entornos de desarrollo, uso local y en la nube.
  * **Apptainer (antes Singularity)**: recomendado en clústeres HPC o entornos donde Docker no está permitido.

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

* 💾 **Recursos mínimos recomendados** **&rArr;** para un uso fluido en análisis típicos de RNA-seq o metagenómica:

  * **RAM**: ≥ ideal ≥ 8 GB.
  * **CPU**: ≥ 4 núcleos.
  * **Almacenamiento**: ≥ 30 GB libres (la imagen del contenedor pesa unos 16 GB para la versión en docker y unos 4 GB para el archivo `.sif` de Apptainer).

> 💡 Con estos requisitos cumplidos, la instalación y ejecución del sistema es directa y garantiza que todos los elementos interactivos de los informes funcionen de manera correcta y reproducible.






<br>
<br>

<img src="06-info/assets/03-common/decoration/linea_divisoria_1.png" width="100%" style="border-radius: 10px;">

<h2 id="section-5">5. 🎯 Flujo de trabajo</h2>

Este apartado describe cómo un usuario interactúa con el sistema para generar **informes bioinformáticos automáticos e interactivos** a partir de sus datos. Se presenta en tres niveles: diagrama general, flujo resumido en ASCII y demostración visual con GIF.




<br>

<img src="06-info/assets/03-common/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-5.1">5.1. 📝 Diagrama general</h3>

El **diagrama de flujo** ilustra de forma esquemática las decisiones y rutas que el usuario puede seguir para ejecutar el sistema **GenoScribe** desde la entrada de datos hasta la generación del informe final:

<p align="center">
  <img src="06-info/assets/03-common/workflows/output/general/general_workflow_gris.png" alt="Diagrama general del flujo de trabajo de GenoScribe" width="65%" style="border-radius: 10px;">
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

> 💡 **Consejo:** Ejecutar siempre dentro de un **contenedor** garantiza **reproducibilidad**, aislamiento de dependencias y facilita la gestión. La ejecución directa (sin contenedor) se recomienda solo para pruebas o debugging.
> En HPC/Cloud pueden requerirse pasos adicionales, como cargar **módulos del sistema** o configurar variables de entorno, para asegurar que todas las dependencias estén disponibles.

Una vez que el usuario decide dónde ejecutar **GenoScribe** y si usar o no un contenedor, este, debe completar un **formulario** con el fin de proporcionar los **parámetros necesarios** para generar el informe. Este formulario puede completarse mediante dos interfaces:

* 🖼️ **Interfaz gráfica (GUI, Shiny)** **&rArr;** Más visual y fácil de usar, aunque algo más lenta.
* ⌨️ **Terminal (CLI, Shell)** **&rArr;** Más rápida y ligera, pero menos intuitiva.

Después, se selecciona la **categoría ómica** y el **pipeline o análisis específico**:

* 🧬 **Transcriptómica del Huésped** &rArr; Centrada en el estudio de la expresión génica del organismo modelo (humano, ratón, etc.).
  * 📊 **Bulk RNA-Seq:** Analiza la expresión promedio de una población completa de células.
  * 🧫 **Single-Cell RNA-Seq:** Estudia la expresión génica a nivel de célula individual para revelar heterogeneidad.
  * 📍 **Spatial RNA-Seq:** (En desarrollo) Mapea la actividad génica en su contexto anatómico original.

* 🦠 **Metagenómica** &rArr; Centrada en el estudio del material genético (ADN) de comunidades microbianas.
  * 🏷️ **Análisis de Amplicones:** Identifica la composición taxonómica mediante genes marcadores (16S/18S/ITS).
  * 🧩 **Análisis Shotgun:** (Posible ampliación) Examina el ADN total para identificar especies y potencial funcional.

* 🔬 **Metatranscriptómica** &rArr; Centrada en el estudio del ARN total de una comunidad microbiana.
  * 🧪 **Análisis Shotgun:** (Posible ampliación) Determina qué genes y rutas metabólicas se están expresando activamente.

Cada análisis requiere configurar parámetros específicos y ejecutar el **pipeline correspondiente**, que culmina con la **generación del informe HTML interactivo**, listo para explorarse, descargarse y compartirse.

<br>

**🧑‍🏫 Resumen conceptual del workflow:**

1. Preparación de **datos de entrada**.
2. Elección del **entorno de ejecución** (PC vs HPC/Cloud).
3. Decisión sobre uso de **contenedores** o **ejecución directa**.
4. Selección de **interfaz de usuario** (CLI o Shiny).
5. Elección del **tipo de análisis**.
6. Configuración de **parámetros específicos** y ejecución del pipeline.
7. Obtención del **informe HTML interactivo**.




<br>

<img src="06-info/assets/03-common/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-5.2">5.2. 📐 Pasos resumidos</h3>

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
<br>
<img src="06-info/assets/03-common/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-5.3">5.3. 🎬 Demostración visual</h3>

El siguiente **GIF** ofrece una visión dinámica del flujo principal: inicio de la app Shiny, completado del formulario, selección del análisis y ejecución del pipeline dentro del contenedor. El proceso finaliza con la **generación automática del informe HTML interactivo** y su exploración en el navegador.

<p align="center">
  <img src="06-info/assets/02-analyses/01-transcriptomics/01-bulk-rna-seq/transcriptomics_bulk_rna_seq_demo_process.gif" alt="Demostración flujo de trabajo GenoScribe" width="65%" style="border-radius: 10px;">
</p>

> 💡 **Nota:** Este GIF es una **guía visual rápida** y no muestra todos los pasos intermedios ni outputs secundarios. Para información completa, incluyendo **entradas, salidas y parámetros específicos**, consulte las [Guías de usuario extendidas](06-info).






<br>
<br>

<img src="06-info/assets/03-common/decoration/linea_divisoria_1.png" width="100%" style="border-radius: 10px;">

<h2 id="section-6">6. 🚀 Guía rápida de uso (Quickstart)</h2>

Esta sección explica cómo poner en marcha **GenoScribe** de forma rápida, reproducible y flexible. Incluye la **descarga del repositorio, preparación del entorno, construcción/obtención de la imagen/contenedor y ejecución de pipelines**, con opciones adaptadas a distintos niveles de usuario y tipos de infraestructura (PC, HPC o nube).

> ⚡ Para información más detallada sobre cada tipo de análisis y flujos específicos, revise las guías completas en `06-info/`.




<br>

<img src="06-info/assets/03-common/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-6.1">6.1. 🐙 Clonar o descargar el repositorio</h3>

Existen varias formas de obtener todo el código, pipelines y archivos necesarios para iniciar **GenoScribe**. Las dos opciones principales son:

* **🧑‍💻 Clonar con Git** **&rArr;** recomendado para usuarios habituales de Git y desarrolladores.
* **⬇️ Descargar ZIP desde GitHub** **&rArr;** opción sencilla para usuarios menos familiarizados con Git.

A continuación se detallan ambos métodos.




<hr style="border:none; height:1.5px; background-color:#777; width:100%; margin:35px 0 20px 0;">

<h4 id="section-6.1.1">6.1.1. 🧑‍💻 Clonar con Git (recomendado)</h4>

La forma más eficiente de obtener **GenoScribe** es clonando el repositorio. Esto te permitirá mantener la herramienta actualizada en el futuro ejecutando simplemente <code>git pull</code>. Se utiliza la opción <code>--depth 1</code> para realizar una descarga rápida y ligera, obteniendo únicamente la versión más reciente del código.

Para la mayoría de los usuarios, la descarga mediante **HTTPS** es la más directa y no requiere configuración previa:

```bash
# Clonar mediante HTTPS
git clone --depth 1 https://github.com/adrichez/GenoScribe.git
cd GenoScribe
```

o bien, si tiene configurada una clave SSH en tu cuenta de GitHub:

```bash
# Clonar mediante SSH
git clone --depth 1 git@github.com:adrichez/GenoScribe.git
cd GenoScribe
```

**Archivos de ejemplo (Git LFS)**

Los datos de prueba ubicados en la carpeta `05-examples/02-reports/` son pesados y están gestionados mediante **Git LFS (Large File Storage)**. Para trabajar con ellos:

1. Es necesario tener instalado [Git LFS](https://git-lfs.github.com/) en tu equipo.
2. Si tiene Git LFS instalado previamente, los archivos grandes **se descargarán automáticamente** al ejecutar el `git clone`.
3. Si la descarga automática falla, o si instala Git LFS *después* de haber clonado el repositorio, puede forzar la descarga de los archivos grandes ejecutando este comando dentro de la carpeta:

```bash
git lfs pull
```

> 💡 **Ventaja:** facilita la instalación de futuras actualizaciones de la herramienta con un solo comando, ideal para usuarios que planean usar el sistema regularmente.



<hr style="border:none; height:1.5px; background-color:#555; width:100%; margin:35px 0 20px 0;">

<h4 id="section-6.1.2">6.1.2. ⬇️ Descargar ZIP desde GitHub</h4>

Para un uso puntual o en sistemas sin Git, se puede descargar el ZIP directamente:

1. Acceda a [https://github.com/adrichez/GenosSribe](https://github.com/adrichez/GenoScribe).
2. Pulse **Code &rArr; Download ZIP**.
3. Descomprime y accede a la carpeta desde la terminal.

> 💡 Nota: esta opción es más limitada para actualizaciones, pero útil para pruebas rápidas o entornos donde Git no está disponible. Además hay que tener en cuenta que mediante esta opción no se obtendrán los archivos grandes almacenados con Git LFS.




<br>

<img src="06-info/assets/03-common/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-6.2">6.2. 🛠️ Modos de uso</h3>

GenoScribe puede ejecutarse de **dos formas principales**:

1. **📦 Dentro de un contenedor** (Docker o Apptainer) **&rArr;** recomendado siempre para garantizar la reproducibilidad.
2. **💻 En local sin contenedor** **&rArr;** para usuarios avanzados o depuración.

Cada enfoque ofrece **dos modos de ejecución**:

* **🖼️ Interfaz gráfica (Shiny, GUI)** **&rArr;** visual e interactiva, ideal para exploración guiada.
* **⌨️ Terminal (CLI)** **&rArr;** ejecución directa, automatizada y más rápida, adecuada para grandes volúmenes o pipelines por lotes.



<hr style="border:none; height:1.5px; background-color:#777; width:100%; margin:35px 0 20px 0;">

<h4 id="section-6.2.1">6.2.1. 📦 Usando Docker o Apptainer</h4>

**⭐️ Ventajas de usar un contenedor:**

* Entorno preconfigurado con todas las dependencias necesarias.
* Ejecución consistente y reproducible en distintos sistemas operativos o servidores.
* Flujo estable, seguro y controlado, ideal para proyectos colaborativos o pipelines complejos.

<br>

**🛠️ Modos de ejecución dentro del contenedor:**

* **🖼️ Interfaz gráfica (Shiny, GUI)**

  * Completa formularios visuales para definir parámetros del experimento.
  * Lanza automáticamente los pipelines y genera informes Quarto interactivos.
  * Ideal para usuarios novatos o exploración de resultados paso a paso, aunque veremos que para el caso de usar esta opción dentro de un contenedor Apptainer en HPC, puede requerir algunos pasos adicionales para poder abrir la interfaz gráfica en nuestro navegador web local, por lo que el proceso puede ser algo más complejo.

* **⌨️ Terminal (CLI)**

  * Ejecuta los pipelines directamente desde la terminal.
  * Permite automatización avanzada y ejecución por lotes de datos.
  * Genera informes HTML de forma reproducible, sin necesidad de interacción visual.

> 🔹 Nota: Emplear la **interfaz gráfica** puede ser más lento que usar la **línea de comandos** con grandes volúmenes de datos. Apptainer, orientado a HPC, suele ejecutarse vía CLI, dado que abrir la interfaz gráfica en un entorno HPC puede requerir pasos adicionales, los cuales se explicarán más adelante, pero aún así, esto es totalmente posible si se desea.



<hr style="border:none; height:1.5px; background-color:#777; width:100%; margin:35px 0 20px 0;">

<h4 id="section-6.2.2">6.2.2. 💻 En local sin contenedor</h4>

**⭐️ Consideraciones para ejecución local:**

* Requiere tener instaladas todas las dependencias de R, Python, librerías bioinformáticas y herramientas (Nextflow, Quarto, Conda).
* Útil para depuración, pruebas rápidas o desarrollo de pipelines.
* Generalmente más rápido que el contenedor, pero menos controlado y con mayor riesgo de conflictos de dependencias.
* Esto está pensado idealmente para la fase de desarrollo o debugging, ya que el uso de contenedores es lo recomendado para garantizar reproducibilidad y evitar problemas de dependencias.

<br>

**🛠️ Modos de ejecución:**

* **🖼️ Interfaz gráfica (Shiny, GUI)** **&rArr;** idéntico al contenedor, permite interacción visual y guiada.
* **⌨️ Terminal (CLI, Shell)** **&rArr;** ejecución directa desde terminal, rápida y automatizable.

> 🔹 Nota: La **interfaz gráfica de Shiny** es una capa visual creada mediante un script de R sobre Nextflow, facilitando la selección de parámetros. Emplear la **línea de comandos** permite una ejecución directa y rápida, tanto en local como en contenedor, aunque más rudimentaria.




<br>

<img src="06-info/assets/03-common/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-6.3">6.3. 🏗️ Construcción del contenedor</h3>

GenoScribe puede ejecutarse en **Docker** o adaptarse a **Apptainer**. La lógica principal está planteada en Docker, pero se proporcionan instrucciones para convertir la imagen a Apptainer, ideal para entornos HPC.

Dicho esto, se comienza explicando cómo construir/obtener la imagen Docker, para luego detallar la conversión/obtención de la imagen Apptainer.



<hr style="border:none; height:1.5px; background-color:#777; width:100%; margin:35px 0 20px 0;">

<h4 id="section-6.3.1">6.3.1. 🐳 Contenedor Docker</h4>

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

> 🔹 Nota: Siempre es recomendable descargar la imagen preconstruida para evitar tiempos de construcción largos y asegurar que se cuenta con la versión más reciente y estable.



<hr style="border:none; height:1.5px; background-color:#777; width:100%; margin:35px 0 20px 0;">

<h4 id="section-6.3.2">6.3.2. 🛡️ Contenedor Apptainer</h4>

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

> 🔹 Nota: Esta opción requiere Docker instalado y en ejecución, pero garantiza que la imagen Apptainer sea idéntica a la Docker.


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

> 🔹 Nota: Se necesita conexión a Internet y permisos de escritura en el directorio donde se generará `genoscribe-lab.sif`.


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

> 🔹 Nota: Este método es especialmente útil en entornos HPC donde no se permite construir imágenes localmente o se carece de permisos de administrador.




<br>

<img src="06-info/assets/03-common/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-6.4">6.4. 🔄 Lanzar la app o ejecutar pipelines</h3>

Una vez descargado el repositorio y construido el contenedor (si se opta por su uso), el siguiente paso es **poner en marcha GenoScribe**.  
Para adaptarse a los diferentes perfiles de usuario y arquitecturas computacionales, existen tres modalidades principales de ejecución:  

* 🖼️ **Interfaz Gráfica Interactiva (GUI, Formulario Shiny):** Ofrece una experiencia visual y guiada en el navegador web.  
* 🖥️ **Interfaz de Terminal Interactiva (CLI, Formulario Shell):** Despliega un menú guiado paso a paso directamente en la consola.
* ⚙️ **Interfaz de Terminal Directa (CLI, Directo):** Recibe todos los parámetros en una sola línea de comandos, ideal para flujos automatizados y gestores de colas en entornos HPC.

A su vez, cada una de estas tres opciones puede ejecutarse de tres formas distintas según el nivel de aislamiento deseado: **en local sin contenedor**, **dentro de un contenedor Docker**, o **dentro de un contenedor Apptainer**.

A continuación se detallan exhaustivamente estas modalidades y sus respectivos métodos de despliegue.



<hr style="border:none; height:1.5px; background-color:#777; width:100%; margin:35px 0 20px 0;">

<h4 id="section-6.4.1">6.4.1. 🖼️ Ejecución mediante interfaz gráfica (GUI, Formulario Shiny)</h4>

La interfaz gráfica de **GenoScribe** está desarrollada en **R Shiny**, lo que permite ejecutar la aplicación en un servidor local o dentro de un contenedor, mostrando una interfaz web interactiva accesible desde el navegador. Esta opción está pensada para usuarios que prefieren una experiencia visual y guiada, ideal para explorar resultados, generar informes o realizar ajustes sin necesidad de usar comandos manuales.


<br>

**💻 Ejecución en local sin contenedor:**

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

> 🔹 **Nota:** asegúrese de tener instaladas todas las dependencias de R indicadas en la sección de instalación, así como permisos de ejecución para el script (`chmod +x` si fuera necesario).



<br>

**🐳 Ejecución dentro de un contenedor Docker:**

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

> 🔹 **Ventaja:** no se requiere disponer de dependencias locales, ya que todo se ejecuta dentro del contenedor.
> 🔹 **Nota:** asegúrese de que el servicio Docker esté activo antes de ejecutar el script.


<br>

**🛡️ Ejecución dentro de un contenedor Apptainer:**

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

> 🔹 **Ventaja:** permite ejecutar GenoScribe en sistemas sin Docker, manteniendo la reproducibilidad y sin requerir permisos de root.
> 🔹 **Recomendación:** use esta opción en clústeres, servidores multiusuario o infraestructuras con control estricto de software.



<hr style="border:none; height:1.5px; background-color:#777; width:100%; margin:35px 0 20px 0;">

<h4 id="section-6.4.2">6.4.2. 💻 Ejecución mediante terminal de forma interactiva (CLI, Formulario Shell)</h4>

Además de la interfaz gráfica, **GenoScribe** puede ejecutarse directamente desde la **terminal (modo CLI o Shell)**.  
Esta modalidad permite lanzar los análisis o pipelines de forma más directa y automatizada, mostrando un formulario básico en texto donde el usuario introduce los parámetros necesarios para la ejecución.

Está especialmente pensada para:

* usuarios que prefieren trabajar en consola o entornos sin entorno gráfico,
* automatizar procesos en scripts o pipelines,
* y entornos **HPC o de servidor remoto** donde emplear una interfaz web puede ser más complejo y requiere realizar pasos adicionales como configurar túneles SSH, ya comentado anteriormente.


<br>

**💻 Ejecución en local sin contenedor:**

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

> 🔹 **Nota:** asegúrese de tener instaladas las dependencias necesarias de R y bash indicadas en la sección de instalación, así como permisos de ejecución para el script (`chmod +x` si fuera necesario).


<br>

**🐳 Ejecución dentro de un contenedor Docker:**

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

> 🔹 **Ventaja:** no requiere tener instaladas dependencias locales, y se ejecuta en un entorno controlado y reproducible.
> 🔹 **Nota:** asegúrese de que el servicio Docker esté activo antes de ejecutar el script.


<br>

**🛡️ Ejecución dentro de un contenedor Apptainer:**

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

> 🔹 **Ventaja:** ejecución 100 % reproducible y segura en entornos sin Docker ni permisos de root.
> 🔹 **Recomendación:** utilice esta opción para automatizar procesos o integrarla en flujos de análisis programados.



<hr style="border:none; height:1.5px; background-color:#777; width:100%; margin:35px 0 20px 0;">

<h4 id="section-6.4.3">6.4.3. ⌨️ Ejecución mediante terminal directa (CLI, Directo / Batch)</h4>

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


<br>

**💻 Ejecución en local sin contenedor:**

En este modo, GenoScribe valida los parámetros pasados por línea de comandos y ejecuta el proceso directamente en el entorno local del sistema. Es ideal para incluir la ejecución dentro de otros scripts de Bash propios del usuario o tareas programadas (cron jobs).

Para lanzarlo:

```bash
cd GenoScribe/04-launch/01-local/
./run_app_shell_direct.sh -oc 1 -at 1 -pp "/ruta/absoluta/al/proyecto" -en "nombre_experimento" -rl 1 -rv 1
```

El script verificará silenciosamente que todas las rutas existan y que no falte ningún argumento obligatorio antes de arrancar el pipeline subyacente de Nextflow.

> 🔹 **Ventaja:** Automatización total sin esperas en la terminal.


<br>

**🐳 Ejecución dentro de un contenedor Docker:**

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

> 🔹 **Ventaja:** Trazabilidad, aislamiento absoluto y nula intervención del usuario.


<br>

**🛡️ Ejecución dentro de un contenedor Apptainer (Recomendado para SLURM / `sbatch`):**

Esta es la forma estándar de trabajo en **HPC y supercomputación**. En un entorno de clúster, el investigador no debe ejecutar tareas pesadas en el nodo principal de conexión (nodo *login*), sino enviarlas a los nodos de cómputo mediante el gestor de colas (ej. **SLURM**).

Al poder pasarle todos los parámetros a Apptainer en una sola línea, GenoScribe se convierte en un comando más dentro de un archivo de trabajo (`.sh`).

**⚠️ Importante:** Para que el sistema resuelva correctamente las rutas internas relativas del repositorio, es **estrictamente necesario** que el script de SLURM haga un `cd` al directorio donde se encuentra el script `run_app_shell_direct.sh` antes de invocarlo.

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
./run_app_shell_direct.sh -oc 1 -at 2 -pp "/ruta/absoluta/al/proyecto" -rl 1 -rv 1
```

Una vez guardado este archivo, simplemente tiene que enviarlo a la cola del clúster desde la terminal mediante:

```bash
mkdir logs
sbatch job_genoscribe.sh
```

El gestor de colas se encargará de asignarle los recursos, ejecutar GenoScribe de forma transparente en el nodo correspondiente, y **enviarle un correo electrónico** cuando su informe esté terminado y listo para ser consultado en su carpeta de proyecto.

> 🔹 **Ventaja:** Permite lanzar y encolar múltiples informes de forma simultánea, gestionando eficientemente los recursos del clúster sin bloquear el terminal del usuario.
> 🔹 **Recomendación:** Guarde plantillas de sus scripts `sbatch` para futuros proyectos, cambiando únicamente la línea de ejecución de parámetros.
> 💡 **Tip avanzado:** Si en algún momento no recuerda qué número correspondía a cada opción, puede ejecutar cualquiera de los scripts directos añadiendo la bandera `--help` (ej. `./run_app_shell_direct.sh --help`) para imprimir por pantalla el glosario completo de opciones y advertencias de sintaxis.




<br>

<img src="06-info/assets/03-common/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-6.5">6.5. 🧹 Scripts útiles</h3>

Además de los scripts principales para lanzar la aplicación y ejecutar los pipelines, **GenoScribe** incluye una serie de **scripts auxiliares** ubicados en cada uno de los directorios correspondientes, según el modo de ejecución **(local, Docker o Apptainer)** que se desee emplear:

* **💻 Local** **&rArr;** `GenoScribe/04-launch/01-local/`
* **🐳 Docker** **&rArr;** `GenoScribe/04-launch/02-docker/`
* **🛡️ Apptainer** **&rArr;** `GenoScribe/04-launch/03-apptainer/`

Estos scripts están diseñados para facilitar tareas comunes de mantenimiento, depuración y gestión del entorno, asegurando que el usuario pueda mantener un control total sobre las ejecuciones y outputs generados. Dichos scripts incluyen:

* **`run_cleaning.sh`** **&rArr;** limpia logs, cachés y directorios temporales (`work`, `_quarto`, etc.) para liberar espacio y evitar conflictos en ejecuciones sucesivas.
* **`access_container.sh`** **&rArr;** abre terminal dentro de contenedor Docker o Apptainer para inspección manual, depuración o ejecución de comandos personalizados.
* **`docker_cleanup.sh`** **&rArr;** sirve para parar y eliminar contenedores Docker antiguos o no utilizados si se desea, al igual que imágenes huérfanas con el fin de liberar espacio en disco.
* **`apptainer_cleanup.sh`** **&rArr;** opción de eliminar imágenes Apptainer `.sif` antiguas o no utilizadas para mantener el entorno limpio.

> 💡 Mantener el entorno limpio y con control total sobre pipelines y outputs garantiza reproducibilidad y facilita la gestión de proyectos bioinformáticos complejos.






<br>
<br>

<img src="06-info/assets/03-common/decoration/linea_divisoria_1.png" width="100%" style="border-radius: 10px;">

<h2 id="section-7">7. 📚 Documentación detallada</h2>

Toda la documentación técnica y guías de uso de **GenoScribe** se encuentran organizadas en la carpeta [`06-info/`](06-info/), diseñada para guiar al usuario paso a paso en la generación de informes, desde la **descarga del proyecto** hasta la obtención del **informe final**, adaptándose a cada tipo de análisis ómico. Esta estructura permite acceder fácilmente a instrucciones generales y específicas según las necesidades del experimento.

Cada guía incluye:

1. **Preparación del entorno &rArr;** Descarga del proyecto (GitHub o ZIP), construcción de contenedores (Docker/Apptainer) y configuración de dependencias.
2. **Selección del tipo de análisis &rArr;** Justificación de la elección de cada *pipeline* según los objetivos biológicos y aplicaciones típicas del estudio.
3. **Parámetros de ejecución &rArr;** Instrucciones detalladas sobre los archivos de entrada requeridos y cómo cumplimentar la configuración mediante la interfaz gráfica (Shiny) o la línea de comandos (CLI).
4. **Ejecución del pipeline &rArr;** Paso a paso del flujo automatizado, incluyendo generación de resultados intermedios, monitorización de *logs* y trazabilidad de procesos.
5. **Generación de informes interactivos &rArr;** Detalles sobre las visualizaciones dinámicas, tablas filtrables, resúmenes ejecutivos y metadatos, además de consejos para personalizar el formato si se deseara.
6. **Interpretación y seguimiento &rArr;** Consejos para explorar los resultados bioinformáticos, identificar hallazgos clave y mantener un registro reproducible de cada análisis.

A continuación, se detalla el índice de manuales específicos divididos por categoría ómica:

🧬 **1. Transcriptómica**
  * [📊 **1.1. Bulk RNA-Seq**](06-info/0101_TRANSCRIPTOMICS_BULK_RNA_SEQ_GUIDE.md) **&rArr;** Describe el flujo completo de expresión diferencial clásica, desde la preparación de archivos hasta el análisis funcional global del tejido.
  * [🧫 **1.2. Single-Cell RNA-Seq (scRNA-Seq)**](06-info/0102_TRANSCRIPTOMICS_SC_RNA_SEQ_GUIDE.md) **&rArr;** Guía paso a paso para el análisis de células individuales, detallando el estricto QC celular, reducción de dimensionalidad, *clustering* y anotación de linajes.
  * [📍 **1.3. Spatial Transcriptomics (ST-RNA-Seq)**](06-info/0103_TRANSCRIPTOMICS_ST_RNA_SEQ_GUIDE.md) **&rArr;** Detalla la integración de matrices de expresión con la arquitectura tisular, mapeando firmas moleculares directamente sobre imágenes histológicas.

🦠 **2. Metagenómica**
  * [🧩 **2.1. Shotgun Metagenomics**](06-info/0201_METAGENOMICS_SHOTGUN_GUIDE.md) **&rArr;** Documentación para el perfilado completo del ADN ambiental o clínico, analizando tanto la taxonomía global como el potencial funcional de la comunidad.
  * [🏷️ **2.2. Amplicones (16S/18S/ITS)**](06-info/0202_METAGENOMICS_AMPLICON_GUIDE.md) **&rArr;** Instrucciones para el censo taxonómico dirigido, abarcando el preprocesamiento de secuencias, índices de diversidad (alfa/beta) y abundancias relativas.

🔬 **3. Metatranscriptómica**
  * [🧪 **3.1. Shotgun Metatranscriptomics**](06-info/0301_METATRANSCRIPTOMICS_SHOTGUN_GUIDE.md) **&rArr;** Guía para el análisis de la expresión génica activa en ecosistemas microbianos, integrando "quién está ahí" con "qué rutas metabólicas están activas".

> 💡 **Nota:** Esta estructura jerárquica permite al usuario **consultar rápidamente la guía adecuada** según su disciplina experimental, comprender el flujo completo y profundizar en los detalles técnicos sin perder la visión global de la suite. Cada manual está pensado para acompañar al investigador desde la **configuración inicial** hasta la **exploration del reporte interactivo**, asegurando reproducibilidad absoluta en todos los análisis.






<br>
<br>

<img src="06-info/assets/03-common/decoration/linea_divisoria_1.png" width="100%" style="border-radius: 10px;">

<h2 id="section-8">8. 🧪 Informes y estructuras de ejemplo</h2>

Además de la documentación técnica, **GenoScribe** proporciona múltiples **informes de ejemplo** que permiten explorar de forma práctica el resultado final generado por el sistema para cada tipo de análisis ómico. Estos ejemplos están pensados como **material demostrativo**, tanto para usuarios nuevos como para investigadores que deseen evaluar el formato, la interactividad y el nivel de detalle de los informes.

Existen **dos formas complementarias** de acceder a estos informes de ejemplo:




<br>

<img src="06-info/assets/03-common/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-8.1">8.1. 📁 Informes de ejemplo incluidos en el repositorio</h3>

En la carpeta [`05-examples/02-reports/`](05-examples/02-reports/) se encuentran disponibles **informes de ejemplo interactivos**, organizados siguiendo la arquitectura modular del sistema (Categoría > Pipeline). Estos archivos, gestionados mediante **Git LFS**, permiten explorar el potencial de **GenoScribe** y visualizar la calidad de los reportes finales de forma inmediata y en local.

Estructura de la carpeta:

```plaintext
05-examples/02-reports/
├── 01-transcriptomics
│   ├── 01-bulk-rna-seq
│   ├── 02-sc-rna-seq
│   └── 03-st-rna-seq
├── 02-metagenomics
│   ├── 01-shotgun
│   └── 02-amplicon
└── 03-metatranscriptomics
    └── 01-shotgun
```

Cada subdirectorio contiene un informe representativo de su disciplina correspondiente. Esta organización permite inspeccionar la interactividad de los gráficos, el diseño de las tablas y la estructura de los resultados específicos de cada ómica, sirviendo como referencia visual del estándar de calidad que ofrece la plataforma para cada tipo de análisis.




<br>

<img src="06-info/assets/03-common/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-8.2">8.2. 🌐 Repositorios de demostración con informes publicados en GitHub Pages</h3>

Para facilitar una evaluación inmediata del sistema, cada disciplina cuenta con **repositorios de demostración independientes**. En ellos se documenta el proceso de generación, se incluye un **vídeo explicativo en YouTube** con el *walkthrough* completo y se proporciona un enlace directo al **informe interactivo publicado en GitHub Pages**.



<hr style="border:none; height:1.5px; background-color:#777; width:100%; margin:35px 0 20px 0;">

<h4 id="section-8.2.1">8.2.1. 🧬 Transcriptómica del Huésped</h4>

* **📊 Bulk RNA-Seq**
  * 📦 **Repositorio:** [GenoScribe-Transcriptomics-Bulk-RNA-Seq-Report](https://github.com/adrichez/GenoScribe-Transcriptomics-Bulk-RNA-Seq-Report)
  * 🌍 **Demo Interactiva:** [Ver Informe en GitHub Pages](https://adrichez.github.io/GenoScribe-Transcriptomics-Bulk-RNA-Seq-Report/)

* **🧫 Single-Cell RNA-Seq**
  * 📦 **Repositorio:** [GenoScribe-Transcriptomics-Single-Cell-RNA-Seq-Report](https://github.com/adrichez/GenoScribe-Transcriptomics-Single-Cell-RNA-Seq-Report)
  * 🌍 **Demo Interactiva:** [Ver Informe en GitHub Pages](https://adrichez.github.io/GenoScribe-Transcriptomics-Single-Cell-RNA-Seq-Report/)

* **📍 Spatial RNA-Seq** *(En desarrollo)*
  * 📦 **Repositorio:** [GenoScribe-Transcriptomics-Spatial-RNA-Seq-Report](https://github.com/adrichez/GenoScribe-Transcriptomics-RNA-Seq-Report)
  * 🌍 **Demo Interactiva:** [Ver Informe en GitHub Pages](https://adrichez.github.io/GenoScribe-Transcriptomics-Spatial-RNA-Seq-Report/)



<hr style="border:none; height:1.5px; background-color:#777; width:100%; margin:35px 0 20px 0;">

<h4 id="section-8.2.2">8.2.2. 🦠 Metagenómica</h4>

* **🧩 Análisis Shotgun** *(Posible extensión)*
  * Repositorios de demostración previstos para futuras actualizaciones del sistema.

* **🏷️ Análisis de Amplicones (16S/18S/ITS)**
  * 📦 **Repositorio:** [GenoScribe-Metagenomics-Amplicon-Report](https://github.com/adrichez/GenoScribe-Metagenomics-Amplicon-Report)
  * 🌍 **Demo Interactiva:** [Ver Informe en GitHub Pages](https://adrichez.github.io/GenoScribe-Metagenomics-Amplicon-Report/)



<hr style="border:none; height:1.5px; background-color:#777; width:100%; margin:35px 0 20px 0;">

<h4 id="section-8.2.3">8.2.3. 🔬 Metatranscriptómica</h4>

* **🧪 Análisis Shotgun** *(Posible extensión)*
  * Repositorios de demostración previstos para futuras actualizaciones del sistema.

<br>

> 💡 **Nota:** Estos repositorios son la forma más rápida de evaluar la **interactividad, claridad visual y trazabilidad** de los reportes generados por **GenoScribe**. Permiten comprender el flujo de trabajo real y los resultados finales sin necesidad de realizar ninguna instalación o configuración local.




<br>

<img src="06-info/assets/03-common/decoration/linea_divisoria_2.png" width="100%" style="border-radius: 10px;">

<h3 id="section-8.3">8.3. 🏗️ Ejemplos de estructuras de directorios sugeridas</h3>

Adicionalmente, en el subdirectorio [`05-examples/01-structures/`](05-examples/01-structures/), se proporcionan los siguientes scripts de inicialización (*scaffolding*):

```plaintext
05-examples/01-structures/
├── 0101_run_scaffold_transcriptomics_bulk_rna_seq.sh
├── 0102_run_scaffold_transcriptomics_sc_rna_seq.sh
├── 0103_run_scaffold_transcriptomics_st_rna_seq.sh
├── 0201_run_scaffold_metagenomics_shotgun.sh
├── 0202_run_scaffold_metagenomics_amplicon.sh
└── 0301_run_scaffold_metatranscriptomics_shotgun.sh
```

Estos scripts permiten **generar automáticamente una estructura de directorios estandarizada** que GenoScribe requiere para cada tipo de análisis ómico, creando un entorno con directorios específicos para la correcta organización del proyecto. Al utilizar estos esquemas como base para su análisis bioinformático, se garantiza que la herramienta pueda localizar, analizar e integrar correctamente todos los resultados previos para construir el informe interactivo final sin errores de rutas.

Para crear de forma sencilla y rápida dicha estructura, basta con ejecutar el script correspondiente a la tecnología de interés desde la terminal:

```bash
./0101_run_scaffold_transcriptomics_bulk_rna_seq.sh
```

Tras la ejecución, el script generará el árbol de directorios completo, incluyendo carpetas críticas empleadas en la redacción del informe. Una vez creada, la carpeta estará disponible para incorporar en ella los resultados del análisis bioinformático previo.

Es importante destacar que, si bien los flujos de trabajo empleados actualmente en el IPBLN para análisis como *Bulk RNA-Seq* o *Metagenómica de Amplicones* suelen generar salidas estructuradas de forma reproducible mediante sus herramientas nativas, estos scripts funcionan como una **plantilla de referencia técnica**. Su propósito es asegurar que la organización final se ajuste estrictamente a los requisitos de **GenoScribe**, mitigando posibles discrepancias en proyectos de alta complejidad —como el *Single-Cell RNA-Seq*— donde la gran densidad de datos y la variedad de herramientas empleadas suelen dificultar la convergencia en una estructura de archivos clara y predecible. Adicionalmente, este proceso también puede automatizar la creación de documentos esenciales, como plantillas de metadatos, garantizando que la información del proyecto esté normalizada desde el inicio y lista para ser integrada en el informe interactivo.






<br>
<br>

<img src="06-info/assets/03-common/decoration/linea_divisoria_1.png" width="100%" style="border-radius: 10px;">

<h2 id="section-9">9. 🛠 Tecnologías principales</h2>

El proyecto combina un conjunto de herramientas y librerías modernas que permiten un flujo de trabajo **inteligente, reproducible e interactivo**. Se integran lenguajes de programación, sistemas de contenedores, plataformas de computación en la nube y librerías de visualización y procesamiento de lenguaje natural, asegurando que tanto el análisis como la generación de informes sean robustos y escalables.  

| Categoría         | Herramientas / Librerías                                       |
|-------------------|----------------------------------------------------------------|
| Lenguajes         | R, Python, JavaScript, Groovy, HTML, CSS, Bash, Markdown       |
| Pipelines         | Nextflow, Conda                                                 |
| Informes          | Quarto, R Markdown, Jupyter                                    |
| Contenedores      | Apptainer / Docker                                             |
| Visualización     | D3.js, ggplot2, plotly                                         |
| IA / NLP          | spaCy, HuggingFace Transformers                                |
| Cloud / HPC       | Picasso, Finisterrae III, almacenamiento S3, Halowan, Mega     |

El uso de **R y Python** permite ejecutar análisis bioinformáticos complejos y manipular grandes volúmenes de datos, mientras que **JavaScript** y **D3.js** potencian la interactividad en los informes. La combinación de **Quarto, R Markdown y Jupyter** garantiza una documentación reproducible y flexible. Los **contenedores Apptainer/Docker** aseguran que los pipelines se ejecuten de manera consistente en distintos entornos, y la integración con **cloud/HPC** permite escalar el procesamiento según la complejidad de los experimentos. Además, las librerías de **IA y NLP** como spaCy y HuggingFace Transformers facilitan el análisis de texto y la generación de informes automatizados.






<br>
<br>

<img src="06-info/assets/03-common/decoration/linea_divisoria_1.png" width="100%" style="border-radius: 10px;">

<h2 id="section-10">10. 🎯 Objetivos y casos de uso</h2>

El proyecto tiene como objetivo principal ofrecer un **sistema inteligente, reproducible y modular**, organizado por tipos de análisis, para generar **informes bioinformáticos automáticos e interactivos**. Esto permite a los investigadores y analistas de datos **ahorrar tiempo**, eliminar cuellos de botella manuales y estandarizar la comunicación de resultados ómicos complejos bajo un marco de trabajo coherente.

Entre los **casos de uso** más comunes se incluyen:

* 🧬 **Investigadores de Transcriptómica (Bulk, Single-Cell o Espacial):** Profesionales que necesitan transformar matrices de expresión en informes detallados de heterogeneidad celular o mapeo tisular sin programar cada visualización desde cero.
* 🦠 **Expertos en Metagenómica:** Equipos que buscan caracterizar la composición taxonómica de comunidades microbianas (16S/18S/ITS) o explorar el potencial genético total (Shotgun) de forma ágil y visual.
* 🔬 **Analistas de Metatranscriptómica:** Especialistas enfocados en determinar la actividad metabólica real y la expresión génica activa de microbiomas complejos.
* 🏢 **Laboratorios y centros de bioinformática:** Entidades que priorizan la **reproducibilidad**, asegurando que los análisis sean auditables y ejecutables en cualquier infraestructura (local, HPC o cloud) sin variaciones técnicas.

Las principales **ventajas** del sistema son:

* ⚡ **Ecosistema modular y automatizado** que gestiona el flujo de datos desde el resultado bioinformático hasta el informe final según la categoría ómica seleccionada.
* 📈 **Interactividad avanzada** mediante Quarto y visualizaciones dinámicas, que permiten al usuario final "bucear" en los datos de forma autónoma.
* 🔒 **Reproducibilidad garantizada** mediante el uso de contenedores (Apptainer/Docker) que encapsulan todas las dependencias y versiones de software.
* 🌐 **Escalabilidad y flexibilidad**, permitiendo adaptar el volumen de procesamiento y el nivel de detalle de los informes a las necesidades específicas de cada proyecto de investigación.

En resumen, este sistema está dirigido a **investigadores, bioinformáticos y equipos de análisis de datos ómicos** que buscan una solución integral, escalable y visualmente atractiva para la generación de informes bioinformáticos de alta calidad.






<br>
<br>

<img src="06-info/assets/03-common/decoration/linea_divisoria_1.png" width="100%" style="border-radius: 10px;">

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
