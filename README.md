<p align="center">
  <img src="6-info/assets/main_cover.png" alt="Banner Bioinformatics Reports" width="100%">
</p>

<div align="center">
  <h1>Sistema Inteligente y Reproducible de Generación de Informes Bioinformáticos</h1>
  <p>Desarrollo de un sistema inteligente y reproducible para la generación automatizada e interactiva de informes bioinformáticos integrados en entornos basados en contenedores y computación en la nube.</p>
</div>

<br>

<div align="center">

[![R](https://img.shields.io/badge/R-276DC3?style=flat&logo=r&logoColor=white)](https://www.r-project.org/) [![Python](https://img.shields.io/badge/Python-3776AB?style=flat&logo=python&logoColor=white)](https://www.python.org/) [![Quarto](https://img.shields.io/badge/Quarto-1DA1F2?style=flat&logo=quarto&logoColor=white)](https://quarto.org/) [![Docker](https://img.shields.io/badge/Docker-2496ED?style=flat&logo=docker&logoColor=white)](https://www.docker.com/) [![Shiny](https://img.shields.io/badge/Shiny-FF4088?style=flat&logo=r&logoColor=white)](https://shiny.rstudio.com/) [![Apptainer](https://img.shields.io/badge/Apptainer-429999?style=flat&logo=apptainer&logoColor=white)](https://apptainer.org/) [![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=flat&logo=html5&logoColor=white)](https://developer.mozilla.org/en-US/docs/Web/HTML) [![CSS3](https://img.shields.io/badge/CSS3-1572B6?style=flat)](https://developer.mozilla.org/en-US/docs/Web/CSS) [![D3.js](https://img.shields.io/badge/D3.js-F9A03C?style=flat)](https://d3js.org/) [![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?style=flat&logo=javascript&logoColor=black)](https://developer.mozilla.org/en-US/docs/Web/JavaScript) [![Nextflow](https://img.shields.io/badge/Nextflow-1DA1F2?style=flat&logo=nextflow&logoColor=white)](https://www.nextflow.io/) [![Conda](https://img.shields.io/badge/Conda-342B02?style=flat&logo=anaconda&logoColor=white)](https://docs.conda.io/en/latest/) [![R Markdown](https://img.shields.io/badge/R_Markdown-536A89?style=flat&logo=r&logoColor=white)](https://rmarkdown.rstudio.com/) [![Jupyter](https://img.shields.io/badge/Jupyter-F37626?style=flat&logo=jupyter&logoColor=white)](https://jupyter.org/) [![Git](https://img.shields.io/badge/Git-F05032?style=flat&logo=git&logoColor=white)](https://git-scm.com/) [![GitHub](https://img.shields.io/badge/GitHub-181717?style=flat&logo=github&logoColor=white)](https://github.com/) [![spaCy](https://img.shields.io/badge/spaCy-09A3D6?style=flat&logo=spacy&logoColor=white)](https://spacy.io/) [![Markdown](https://img.shields.io/badge/Markdown-000000?style=flat&logo=markdown&logoColor=white)](https://www.markdownguide.org/) [![LaTeX](https://img.shields.io/badge/LaTeX-47A141?style=flat&logo=latex&logoColor=white)](https://www.latex-project.org/)

</div>






<br>
<br>

---

## 🚀 Descripción breve del proyecto

Este proyecto presenta un **sistema inteligente y reproducible** diseñado para convertir los resultados generados por **pipelines ómicos** en **informes automáticos e interactivos**, facilitando la interpretación de datos complejos y la comunicación de hallazgos clave. La herramienta central es una **aplicación Shiny** que permite al usuario introducir de manera sencilla los **parámetros del experimento** tal y como podría ser la **ruta a la carpeta de resultados de dichos pipelines**, que puede incluir desde archivos `.fastq` hasta hojas de cálculo `.xlsx` o reportes de **MultiQC**. Según el **tipo de análisis** seleccionado —ya sea *Bulk RNA-Seq, scRNA-Seq o Metagenómica*—, el sistema ejecuta automáticamente el **pipeline correspondiente** dentro de un **contenedor aislado** (Apptainer/Docker), garantizando **consistencia**, **reproducibilidad** y aislamiento total de dependencias.

El flujo de trabajo culmina con la generación de un **informe HTML interactivo** generado a través de **Quarto**, completamente adaptado al contenido procesado y a los parámetros introducidos por el usuario. Cada informe integra **visualizaciones dinámicas**, **tablas filtrables**, **resúmenes ejecutivos** y **metadatos de ejecución** como versiones de software, parámetros utilizados y registros de procesamiento, asegurando una completa **trazabilidad** y **replicabilidad** de los resultados. Este enfoque permite explorar los datos de forma intuitiva, compartirlos fácilmente y descargarlos para su documentación o análisis posterior.

Diseñado para ser flexible y escalable, el sistema funciona tanto en **entornos locales**, de forma aislada en **contenedores**, como en **clústeres HPC o plataformas en la nube**, reduciendo de manera significativa la carga manual asociada con la generación de informes, estandarizando la presentación de resultados y ofreciendo una **solución robusta** y **reproducible** que agiliza la interpretación y el intercambio de información bioinformática. Con este enfoque, los investigadores pueden centrarse en el análisis y la toma de decisiones, dejando en manos del sistema la integración, visualización y documentación de sus resultados.






<br>
<br>

---

## ⭐ Características principales

- **Pipelines soportados**: Compatible con múltiples flujos de trabajo ómicos, incluyendo **Bulk RNA-Seq, scRNA-Seq y análisis metagenómicos**. Cada pipeline está preconfigurado para procesar datos crudos y generar resultados listos para análisis, reduciendo la necesidad de intervención manual y asegurando resultados consistentes.  

- **Informes interactivos (Quarto + D3.js)**: Los resultados se presentan en **informes HTML dinámicos**, creados con **Quarto** y enriquecidos con **visualizaciones interactivas D3.js**. Los usuarios pueden explorar gráficos, filtrar tablas y navegar entre secciones de manera intuitiva, transformando datos complejos en información accesible y visualmente atractiva.  

- **IA/NLP para resúmenes**: Integración de **algoritmos de inteligencia artificial y procesamiento de lenguaje natural (NLP)** que generan **resúmenes automáticos de los resultados**, destacando hallazgos clave, patrones relevantes y posibles interpretaciones biológicas, ayudando al usuario a comprender rápidamente los puntos más importantes.  

- **Reproducibilidad (contenedores)**: Cada pipeline se ejecuta dentro de **contenedores Apptainer/Docker**, garantizando **aislamiento de dependencias**, **consistencia en la ejecución** y **replicabilidad absoluta** de los resultados en cualquier entorno, sin conflictos de software o diferencias en configuraciones.  

- **Despliegue flexible (local / contenedores / HPC / cloud)**: El sistema puede ejecutarse **localmente**, en **contenedores**, en **clústeres HPC** o en **plataformas de nube**, adaptándose a distintos tamaños de proyecto y necesidades computacionales. Esto permite a los usuarios aprovechar la infraestructura disponible sin comprometer velocidad, seguridad o reproducibilidad.  






<br>
<br>

---

## 📂 Estructura del proyecto

El repositorio está organizado de forma modular para separar claramente la **interfaz de usuario**, los **pipelines de análisis**, los **entornos reproducibles** y la **documentación**. Esto facilita la navegación, el mantenimiento y la extensión del sistema.

```plaintext
genoscribe         # Directorio principal del proyecto
├── 1-app          # App Shiny y recursos web
├── 2-pipelines    # Pipelines de análisis y plantillas Quarto
├── 3-containers   # Definición de entornos reproducibles
├── 4-launch       # Scripts de lanzamiento
├── 5-examples     # Informes de ejemplo
├── 6-info         # Documentación y especificaciones
└── README.md      # Documento con información general del proyecto
```

<br>

A continuación se detalla la función de cada directorio:

- **`1-app/`:** Contiene la aplicación Shiny, formularios para introducir parámetros, selección del tipo de experimento y paneles interactivos con R, JS y D3.js, junto con los recursos front-end.  
- **`2-pipelines/`:** Incluye los pipelines bioinformáticos por tipo de análisis y las plantillas Quarto para generar los informes finales, así como archivos de ejemplo y scripts en R, Python o Snakemake/Nextflow.  
- **`3-containers/`:** Define los entornos reproducibles, incluyendo Dockerfiles o recetas Apptainer, dependencias específicas y versionado de imágenes.  
- **`4-launch/`:** Scripts para ejecutar la app Shiny y desplegar los pipelines en local, contenedores, HPC o cloud, incluyendo utilidades de montaje de volúmenes y registro de logs.  
- **`5-examples/`:** Informes de ejemplo generados a partir de los pipelines y plantillas para cada tipo de análisis, que ilustran el formato y contenido esperado de los resultados finales.  
- **`6-info/`:** Documentación técnica y especificaciones detalladas para cada tipo de análisis, así como guías de usuario generales.   
- **`README.md`:** Documento principal con descripción general, estructura del proyecto, guía rápida de uso y enlaces a la documentación detallada.  






<br>
<br>

---

## ⚙️ Requisitos

Antes de utilizar el sistema, se recomienda asegurarse de contar con los siguientes elementos mínimos para garantizar un funcionamiento óptimo:

- 🐳 **Docker o Apptainer**: necesario para construir y ejecutar los contenedores que incluyen la app Shiny, los pipelines y todas las dependencias de los informes interactivos.  
- 💻 **Terminal / Línea de comandos**: para ejecutar los scripts de lanzamiento y administrar los contenedores. Compatible con macOS, Linux y Windows. En Windows se recomienda usar una terminal compatible con Linux, como WSL, Git Bash o PowerShell con compatibilidad adecuada.  
- 🌐 **Navegador web moderno**: se recomienda **Google Chrome** para explorar los informes HTML interactivos, ya que algunos componentes dinámicos (gráficos D3.js, paneles interactivos) pueden no cargarse correctamente en Safari u otros navegadores.  
- 📶 **Conexión a internet** (opcional, según caso): necesaria para acceder a recursos externos o actualizaciones de dependencias si se utilizan pipelines que descargan datos adicionales.

> 💡 **Nota:** con estos requisitos, la instalación y ejecución del sistema es sencilla y garantiza que todos los elementos interactivos de los informes funcionen de manera correcta y reproducible.






<br>
<br>

---

## 🎯 Flujo de trabajo

A continuación, se muestra el diagrama de flujo del sistema (workflow) donde se representa de forma esquemática todas las decisiones y caminos que un **usuario** puede seguir para generar un informe bioinformático a partir de sus **datos de entrada**:

<p align="center">
  <img src="6-info/assets/workflow/general_workflow.png" alt="Diagrama del sistema de informes bioinformáticos" width="65%">
</p>

Así, el recorrido comienza con una primera decisión: **¿dónde ejecutar el análisis?**. 

* 💻 **En Local**:  

  * Puede ejecutarlo **directamente en su ordenador** o dentro de un **contenedor (recomendado)**.  
  * Si opta por un contenedor, puede elegir entre **Docker** o **Apptainer**.  
  * A continuación, decide **cómo interactuar** con el sistema: mediante **terminal (CLI)** o a través de la **interfaz gráfica Shiny**.  

* 🖥️ **En HPC/Cloud (cluster)**:  

  * Puede ejecutarlo **directamente en el cluster** o en un **contenedor con Apptainer** (Docker no suele estar permitido en HPC).  
  * En estos entornos no se dispone de interfaces gráficas, por lo que la interacción se realiza siempre mediante **CLI**.  

> 💡 **Nota:** Siempre será recomendable ejecutar el análisis en un contenedor para garantizar la reproducibilidad y facilitar la gestión de dependencias. La ejecución directamente en el ordenador (o en el cluster) está más bien pensada para la realización de pruebas o debugging, cuando se dispone de todas las herramientas necesarias ya disponibles en el propio entorno.
>
> Además, en entornos HPC/Cloud, es posible que se requieran configuraciones adicionales, como la carga de módulos o la configuración de variables de entorno, para garantizar que todas las dependencias estén disponibles.

Una vez seleccionado el entorno, el usuario completa un **formulario** para definir los parámetros del análisis:  

* 📄 **Formulario visual (GUI)** si está usando Shiny en Local.  
* 📄 **Formulario en shell (CLI)** si ejecuta el análisis en terminal, tanto en Local como en HPC.  

Luego, el usuario selecciona el **tipo de análisis** a realizar:  

* 🧬 **Bulk RNA-Seq**.
* 🧫 **Single-cell RNA-Seq (scRNA-Seq)**.
* 🌱 **Metagenómica**.

Cada tipo de análisis requiere configurar **parámetros específicos**, tras lo cual se lanza el **pipeline correspondiente**.  

Finalmente, el sistema genera un **informe interactivo en HTML** con los resultados del análisis seleccionado, listo para explorarse, descargarse y compartirse.  

En resumen, este workflow ilustra cómo:

1. El usuario parte de sus **datos de entrada**.  
2. Decide el **entorno de ejecución** (Local vs HPC/Cloud). 
3. Determina si utilizar un **contenedor** o no. 
4. Selecciona la **forma de interacción** (CLI o Shiny).  
5. Define el **tipo de análisis** a realizar.  
6. Configura los **parámetros específicos** y ejecuta el pipeline.  
7. Obtiene un **informe interactivo en HTML** como producto final.  




<br>

### 📐 Flujo principal paso a paso

De manera resumida, el flujo de uso del sistema puede describirse así:

```ascii
→ Descarga del proyecto desde GitHub
   → Construcción de la imagen GenoScribe
   → Creación de un contenedor genoscribe_container
   → Inicio del contenedor genoscribe_container
   → Se inicia la app Shiny en el puerto 3838
   → Selección del tipo de análisis en el formulario
   → Completar el formulario con los parámetros solicitados
   → Ejecución del pipeline mediante Nextflow
   → Generación de outputs y del informe interactivo HTML
   → Acceso al informe interactivo (HTML)
```




<br>

### 🎬 Demostración visual

El siguiente GIF ofrece una **representación rápida** del flujo principal del sistema, mostrando cómo se inicia la **app Shiny**, se completa el **formulario con los parámetros del experimento**, se selecciona el **tipo de análisis** y finalmente se ejecuta el pipeline correspondiente dentro del contenedor. El proceso culmina con la **generación automática del informe HTML interactivo**, listo para explorarse, descargarse y compartirse:

<p align="center">
  <img src="6-info/assets/bulk_rna_seq_demo.gif" alt="Demostración del proceso para crear un informe de Bulk RNA-Seq con la app de Shiny en un contenedor Docker" width="65%">
</p>

Este GIF funciona como **guía visual rápida**, ideal para obtener una visión global antes de entrar en detalles técnicos.
Cabe destacar que **no incluye todos los pasos intermedios ni outputs secundarios**, los cuales están documentados en la guía de usuario completa para cada tipo de análisis.

> 💡 **Nota:** para una descripción más detallada del flujo, incluyendo **entradas, salidas y parámetros específicos**, consulta las [Guías de usuario extendidas](6-info).






<br>
<br>

---

## 🚀 Guía rápida de uso (Quickstart)

Antes de comenzar a usar GenoScribe, es necesario obtener los archivos del proyecto y preparar el entorno. Esta sección proporciona un **resumen introductorio**; para más detalles sobre cada tipo de análisis y flujos específicos, consulta las guías completas en la carpeta `6-info/`.  




<br>

### 📦 Descarga del proyecto

Para disponer de todo el código, pipelines y Dockerfile, existen varias formas:


#### 1. Clonar el repositorio con Git

Esta sería la opción recomendada si desea mantener el proyecto actualizado fácilmente.

```bash
git clone https://github.com/adrichez/genoscribe.git
cd genoscribe
```


#### 2. Descargar directamente el ZIP desde GitHub

 - Accede a [https://github.com/adrichez/genoscribe](https://github.com/adrichez/genoscribe).
 - Pulsa "Code → Download ZIP"
 - Descomprime en una carpeta de tu elección y accede a ella desde la terminal.

> 💡 **Nota:** Clonar con Git permite actualizar fácilmente el proyecto, mientras que el ZIP sirve para un uso puntual o en sistemas sin Git.




<br>

### 🛠️ Modos de uso

Una vez descargado el proyecto, hay dos formas principales de generar los informes bioinformáticos: **dentro de un contenedor** o **en local sin contenedor**.
Cada enfoque permite dos modos de ejecución: mediante la **interfaz Shiny** (visual e interactiva) o directamente con **Nextflow** (automatización avanzada).


#### 1. Usando Docker o Apptainer

Esta es la opción recomendada para mantener el proyecto actualizado y garantizar un entorno consistente.

**Ventajas:**

* Entorno preconfigurado con todas las dependencias ✅
* Funcionamiento idéntico en distintos sistemas y servidores 🌐
* Flujo estable y reproducible 🔒

**Modos de ejecución dentro del contenedor:**

* **💻 Interfaz Shiny (visual)**

  * Inicia el servidor Shiny dentro del contenedor.
  * Permite completar formularios de manera guiada para generar informes.
  * Recomendado para usuarios que prefieren un flujo interactivo.

* **⚡ Nextflow (automatizado/manual)**

  * Ejecuta los pipelines directamente desde los directorios correspondientes.
  * Genera los informes Quarto automáticamente.
  * Ideal para automatización avanzada y ejecución por lotes.

> 💡 **Nota:** La interfaz Shiny puede ser más lenta que la ejecución directa con Nextflow, especialmente con grandes volúmenes de datos. Shiny está diseñada para usarse tanto en local como en contenedores Docker. Por otro lado, Apptainer, al estar orientado a entornos HPC, se centra principalmente en la ejecución de Nextflow desde la terminal, ya que generalmente no admite interfaz gráfica.


#### 2. Ejecución en local sin contenedor

Este enfoque permite ejecutar la app Shiny o los pipelines Nextflow/R directamente desde el código descargado 🖥️.

**Consideraciones:**

* Requiere tener instaladas todas las dependencias de R, Python y librerías bioinformáticas 📦
* Recomendado para usuarios que ya disponen de todas las herramientas necesarias en su ordenador personal: R, Quarto, Nextflow, Conda y la carpeta del proyecto descargada desde GitHub (Genoscribe) con todas las plantillas, código y archivos.
* Útil para depuración, desarrollo o pruebas rápidas 🧪
* Más rápido que el contenedor, aunque es un entorno menos controlado y más propenso a fallos.

**Modos de ejecución en local:**

* **💻 Interfaz Shiny (visual)**

  * Inicia el servidor Shiny en tu máquina local.
  * Permite completar formularios de manera guiada para generar informes.

* **⚡ Nextflow (automatizado/manual)**

  * Ejecuta los pipelines directamente desde los directorios correspondientes.
  * Genera los informes Quarto automáticamente.

> 💡 **Nota:** La interfaz Shiny actúa como una capa visual sobre Nextflow, facilitando la selección de parámetros y la generación de informes de manera guiada. Aunque es más lenta que ejecutar Nextflow directamente, resulta útil para quienes prefieren un flujo interactivo y amigable. Nextflow, por su parte, permite automatización avanzada y ejecución por lotes de forma más rápida, ya sea en contenedor o en local.  




<br>

### 🐳 Construcción del contenedor

El proyecto **Genoscribe** está diseñado principalmente para ejecutarse en Docker, lo que asegura entornos reproducibles y consistentes en distintas plataformas. Para entornos HPC, se puede adaptar fácilmente a **Apptainer** (anteriormente Singularity) usando el mismo Dockerfile como base.

Existen dos estrategias principales para trabajar con contenedores:


#### 1. Construir la imagen localmente desde el Dockerfile (recomendado)

Construir la imagen en tu máquina ofrece **máxima flexibilidad**, permitiéndote personalizar dependencias y optimizar el contenedor según tu sistema y recursos. Esta estrategia es especialmente útil si planeas adaptar la imagen a entornos HPC con Apptainer.

> ⚠️ **Importante:** Todos los comandos de construcción se deben ejecutar desde el **directorio raíz del proyecto (`genoscribe`)**, ya que el Dockerfile hace referencia a rutas relativas para copiar archivos dentro del contenedor. El Dockerfile está guardado en `3-containers/1-docker` solo para mantener el proyecto organizado.

**Comandos de ejemplo:**

```bash
# Construcción normal usando cache (más rápida)
docker build -f 3-containers/1-docker/Dockerfile -t genoscribe:1.0 .

# Construcción sin usar cache (recomendado si cambias dependencias o quieres reconstruir todo desde cero)
docker build --no-cache -f 3-containers/1-docker/Dockerfile -t genoscribe:1.0 .
```

**Cuándo usar `--no-cache` o cache:**  

* **Con cache (por defecto):** más rápido, reutiliza capas previamente construidas. Ideal si solo cambias archivos que no afectan a todas las dependencias.
* **Sin cache (`--no-cache`):** fuerza la reconstrucción completa de todas las capas. Recomendado si actualizas dependencias, modificas archivos base del contenedor o quieres asegurarte de que todo se construya desde cero.

**Ventajas:**  

* Control total sobre configuración y dependencias ✅
* Evita descargar imágenes pesadas desde repositorios externos 💾
* Recomendado para la mayoría de usuarios que busquen reproducibilidad y personalización 🔒

**Adaptación a Apptainer / HPC:**  

Se puede generar una imagen de Apptainer directamente a partir del Dockerfile utilizando `apptainer build` desde el directorio raíz del proyecto:

```bash
apptainer build genoscribe.sif docker-daemon://genoscribe:1.0
```

Esto permite llevar la misma imagen de Docker al entorno HPC sin cambios en la configuración, asegurando consistencia con tu entorno local o de desarrollo.


#### 2. Descargar la imagen preconstruida desde un repositorio Docker (opción alternativa)

Si no deseas construir la imagen localmente, puedes descargarla directamente desde Docker Hub u otro registro público.

**Comando:**  

```bash
docker pull adrichez/genoscribe:1.0
```

**Ventajas:**  

* Inicio inmediato, sin necesidad de construir la imagen. ⚡
* Reproducibilidad garantizada usando la versión exacta de la imagen. 📦

**Consideraciones:**  

* La imagen puede ser pesada. 💾
* Menor flexibilidad para personalizar dependencias. ⚙️

**Adaptación a Apptainer / HPC:**  

Incluso usando una imagen preconstruida, puedes generar un contenedor Apptainer desde Docker:

```bash
apptainer build genoscribe.sif docker://adrichez/genoscribe:1.0
```

Esto permite ejecutar la misma imagen en entornos HPC, conservando las dependencias y la configuración de Docker, sin necesidad de reconstruir la imagen desde cero.

> 🔹 **Recomendación:** Construir la imagen localmente desde el Dockerfile es la opción más flexible y reproducible. Descargar la imagen preconstruida es conveniente para quienes buscan rapidez y simplicidad. Para entornos HPC, lo más eficiente es construir primero la imagen Docker y luego convertirla a Apptainer, asegurando compatibilidad y manteniendo el flujo reproducible entre diferentes sistemas.




<br>

### 🔄 Flujo mínimo para usar la app

Sigua estos pasos para generar informes bioinformáticos de forma reproducible, flexible y adaptada a distintos entornos:


#### 1. Descargar el repositorio  

Clona el proyecto con Git o descarga el ZIP del repositorio:

```bash
git clone https://github.com/usuario/genoscribe.git
cd genoscribe
```


#### 2. Construir la imagen Docker localmente *(opcional, recomendado si usa contenedor)*  

Construir la imagen garantiza un entorno consistente con todas las dependencias.

> ⚠️ Recuerde ejecutar el comando desde el **directorio raíz del proyecto** (`genoscribe`), ya que el Dockerfile hace referencia a rutas relativas para copiar archivos dentro del contenedor.

```bash
# Construir la imagen usando cache
docker build -f 3-containers/1-docker/Dockerfile -t genoscribe:1.0 .

# O, si quiere reconstruir desde cero sin usar cache
docker build --no-cache -f 3-containers/1-docker/Dockerfile -t genoscribe:1.0 .
```

**Adaptación a HPC / Apptainer:**  

Se puede generar un contenedor Apptainer a partir de la imagen Docker:

```bash
apptainer build genoscribe.sif docker-daemon://genoscribe:1.0
```

Esto permite ejecutar la misma imagen reproducible en entornos HPC.


#### 3. Lanzar la app Shiny o ejecutar Nextflow desde scripts

Todos los scripts deben ejecutarse desde el **directorio raíz del proyecto (`genoscribe`)**, ya que las rutas relativas del proyecto son importantes para que los scripts funcionen correctamente.

Dependiendo de si deseas usar contenedores Docker, Apptainer/HPC, o trabajar en local, los scripts se encuentran en:

* **Dentro del contenedor Docker:** `./4-launch/2-docker/`
* **Ejecución en local sin contenedor:** `./4-launch/1-local/` *(requiere tener instaladas todas las dependencias: R, Quarto, Nextflow, Conda, etc.)*
* **Ejecución en HPC con Apptainer:** `./4-launch/3-apptainer-hpc/` *(requiere generar previamente la imagen `.sif` a partir de Docker o del `genoscribe.def`)*

Los scripts principales son:

```bash
# Conceder permisos de ejecución
chmod +x ./4-launch/2-docker/run_app_shiny.sh
chmod +x ./4-launch/2-docker/run_app_shell.sh
```

**💻 Interfaz Shiny (visual)**

```bash
./4-launch/2-docker/run_app_shiny.sh
```

* Abre automáticamente un navegador con la **interfaz gráfica Shiny**.
* Permite elegir entre los tres tipos de análisis disponibles (Bulk RNA-Seq, Single-cell RNA-Seq y Metagenomic).
* Muestra un formulario guiado donde se introducen los parámetros necesarios.
* Al pulsar **“Ejecutar pipeline”**, Shiny lanza internamente **Nextflow** con los parámetros proporcionados.
* Como resultado final se genera un **informe HTML** reproducible.

> 🔹 Este enfoque es más visual y amigable para usuarios novatos, pero puede ser más lento que ejecutar Nextflow directamente desde la terminal, especialmente con grandes volúmenes de datos.

**⚡ Nextflow desde la terminal (sin interfaz gráfica)**

```bash
./4-launch/2-docker/run_app_shell.sh
```

* Ejecuta los pipelines **directamente desde la terminal**, sin Shiny.
* Los parámetros se proporcionan mediante la terminal o archivos de configuración YAML.
* Genera los informes HTML de la misma manera que con Shiny.
* Más rápido que usar Shiny, ideal para usuarios avanzados, automatización por lotes o grandes volúmenes de datos.

> 🔹 La misma lógica se aplica para **Apptainer/HPC**: una vez generada la imagen `.sif`, se puede ejecutar:

```bash
apptainer exec genoscribe.sif ./4-launch/3-apptainer-hpc/run_app_shell.sh
```

o, si se desea la interfaz Shiny dentro del HPC:

```bash
apptainer exec genoscribe.sif ./4-launch/3-apptainer-hpc/run_app_shiny.sh
```

**🖥️ Ejecución en local sin contenedor**

Si deseas trabajar sin contenedores y ya tienes instaladas todas las dependencias, los scripts equivalentes se encuentran en:

```bash
./4-launch/1-local/run_app_shiny.sh
./4-launch/1-local/run_app_shell.sh
```

* Funcionalidad idéntica a la de Docker o Apptainer, pero ejecutándose directamente en tu máquina local.
* Útil para depuración, desarrollo o pruebas rápidas.

**🧹 Otros scripts disponibles**

* **run\_cleaning.sh**: limpia directorios generados por Quarto y Nextflow, incluyendo logs, cachés y la carpeta `work`, que pueden ocupar mucho espacio tras múltiples ejecuciones. Disponible en `1-local`, `2-docker` y `3-apptainer-hpc`.
* **access\_container.sh**: permite acceder a la terminal de un contenedor Docker o Apptainer ya creado, explorar archivos y ejecutar comandos manualmente.

> 💡 Con estos scripts, se puede mantener el entorno limpio y tener un control completo de los pipelines, tanto en local como dentro de contenedores Docker o HPC/Apptainer.






<br>
<br>

---

## 📚 Documentación detallada

Toda la documentación técnica y guías de uso se encuentran organizadas en la carpeta [`6-info/`](6-info/), diseñada para que el usuario pueda acceder fácilmente a instrucciones generales y específicas según el tipo de análisis.  
 
- [Bulk RNA-Seq](6-info/1_BULK_RNA_SEQ_SPECS.md) → Detalla las especificaciones técnicas, entradas requeridas, outputs esperados y ejemplos de informes para análisis de RNA convencional.  
- [scRNA-Seq](6-info/2_SC_RNA_SEQ_SPECS.md) → Contiene las instrucciones específicas para análisis de células individuales, incluyendo parámetros de filtrado, normalización y visualización interactiva.  
- [Metagenómica](6-info/3_METAGENOMIC_SPECS.md) → Proporciona la documentación necesaria para análisis metagenómicos, desde el preprocesamiento de secuencias hasta la interpretación de resultados y generación de informes.  

> 💡 Esta estructura permite consultar rápidamente la guía adecuada según el tipo de experimento y profundizar en los detalles técnicos sin perder la visión global del proyecto.






<br>
<br>

---

## 🛠 Tecnologías principales

El proyecto combina un conjunto de herramientas y librerías modernas que permiten un flujo de trabajo **inteligente, reproducible e interactivo**. Se integran lenguajes de programación, sistemas de contenedores, plataformas de computación en la nube y librerías de visualización y procesamiento de lenguaje natural, asegurando que tanto el análisis como la generación de informes sean robustos y escalables.  

| Categoría         | Herramientas / Librerías                           |
|-------------------|----------------------------------------------------|
| Lenguajes         | R, Python, JavaScript, HTML, CSS, bash, Markdown   |
| Pipelines         | Nextflow, Conda                                     |
| Informes          | Quarto, R Markdown, Jupyter                        |
| Contenedores      | Apptainer / Docker                                 |
| Visualización     | D3.js, ggplot2, plotly                             |
| IA / NLP          | spaCy, HuggingFace Transformers                    |
| Cloud / HPC       | Picasso, Finisterrae III, almacenamiento S3        |

El uso de **R y Python** permite ejecutar análisis bioinformáticos complejos y manipular grandes volúmenes de datos, mientras que **JavaScript** y **D3.js** potencian la interactividad en los informes. La combinación de **Quarto, R Markdown y Jupyter** garantiza una documentación reproducible y flexible. Los **contenedores Apptainer/Docker** aseguran que los pipelines se ejecuten de manera consistente en distintos entornos, y la integración con **cloud/HPC** permite escalar el procesamiento según la complejidad de los experimentos. Además, las librerías de **IA y NLP** como spaCy y HuggingFace Transformers facilitan el análisis de texto y la generación de informes automatizados.






<br>
<br>

---

## 🎯 Objetivos y casos de uso

El proyecto tiene como objetivo principal ofrecer un **sistema inteligente, reproducible y fácil de usar** para generar **informes bioinformáticos automáticos e interactivos** a partir de los resultados de pipelines ómicos. Esto permite a los investigadores y analistas de datos **ahorrar tiempo**, reducir errores manuales y estandarizar la presentación de resultados complejos.

Entre los **casos de uso** más comunes se incluyen:

* 🧬 Investigadores de **RNA-Seq (bulk o single-cell)** que necesitan generar informes detallados de expresión génica sin tener que programar cada análisis manualmente.  
* 🔬 Equipos de **metagenómica** que desean explorar rápidamente la composición de comunidades microbianas y generar visualizaciones interactivas.  
* 🏢 Laboratorios y centros de bioinformática que buscan **reproducibilidad**, asegurando que los mismos análisis se puedan ejecutar en distintos entornos (local, HPC o cloud) sin inconsistencias.  

Las principales **ventajas** del sistema son:

* ⚡ **Automatización completa** del flujo de análisis desde los datos crudos hasta el informe interactivo.  
* 📈 **Interactividad y visualización avanzada** mediante Quarto y D3.js, que facilita la exploración de resultados.  
* 🔒 **Reproducibilidad total** gracias al uso de contenedores (Apptainer/Docker) y entornos versionados.  
* 🌐 **Flexibilidad y escalabilidad**, permitiendo ejecutar pipelines en distintas infraestructuras y adaptar los informes según el tipo de experimento y las necesidades del usuario.  

En resumen, este sistema está dirigido a **investigadores, bioinformáticos y equipos de análisis de datos ómicos** que buscan una solución integral, reproducible y visualmente atractiva para la generación de informes bioinformáticos de alta calidad.






<br>
<br>

---

## 📬 Contacto

Para consultas, sugerencias o reportes de errores relacionados con este proyecto, puedes contactarnos a través de:

* 📧 **Correo electrónico:** [asanca33@gmail.com](mailto:asanca33@gmail.com).  
* 🐙 **Repositorio GitHub:** [https://github.com/adrichez/genoscribe](https://github.com/adrichez/genoscribe) → issues, pull requests, contribuciones bienvenidas. 🚀  
* 📚 **Documentación adicional:** revisa la carpeta [6-info/](6-info/) para guías, especificaciones y ejemplos de uso. 📝

Estamos abiertos a colaboraciones y mejoras, y agradecemos cualquier retroalimentación que ayude a que el sistema sea más **útil, reproducible y accesible** para la comunidad bioinformática.
