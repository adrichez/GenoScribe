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

Este proyecto presenta un **sistema inteligente y reproducible** diseñado para convertir los resultados generados por **pipelines ómicos** en **informes automáticos e interactivos**, facilitando la interpretación de datos complejos y la comunicación de hallazgos clave. La herramienta central es una **aplicación Shiny** que permite al usuario introducir de manera sencilla los **parámetros del experimento** y la **ruta a la carpeta de resultados**, que puede incluir desde archivos `.fastq` hasta hojas de cálculo `.xlsx` o reportes de **MultiQC**. Según el **tipo de análisis** seleccionado —ya sea *Bulk RNA-Seq, scRNA-Seq o Metagenómica*—, el sistema ejecuta automáticamente el **pipeline correspondiente** dentro de un **contenedor aislado** (Apptainer/Docker), garantizando **consistencia**, **reproducibilidad** y aislamiento total de dependencias.

El flujo de trabajo culmina con la generación de un **informe HTML interactivo en Quarto**, completamente adaptado al contenido procesado y a los parámetros introducidos por el usuario. Cada informe integra **visualizaciones dinámicas**, **tablas filtrables**, **resúmenes ejecutivos** y **metadatos de ejecución** como versiones de software, parámetros utilizados y registros de procesamiento, asegurando una completa **trazabilidad** y **replicabilidad** de los resultados. Este enfoque permite explorar los datos de forma intuitiva, compartirlos fácilmente y descargarlos para su documentación o análisis posterior.

Diseñado para ser flexible y escalable, el sistema funciona tanto en **entornos locales** como en **clústeres HPC o plataformas en la nube**, reduciendo de manera significativa la carga manual asociada con la generación de informes, estandarizando la presentación de resultados y ofreciendo una **solución robusta** y **reproducible** que agiliza la interpretación y el intercambio de información bioinformática. Con este enfoque, los investigadores pueden centrarse en el análisis y la toma de decisiones, dejando en manos del sistema la integración, visualización y documentación de sus resultados.






<br>
<br>

---

## ⭐ Características principales

- **Pipelines soportados**: Compatible con múltiples flujos de trabajo ómicos, incluyendo **Bulk RNA-Seq, scRNA-Seq y análisis metagenómicos**. Cada pipeline está preconfigurado para procesar datos crudos y generar resultados listos para análisis, reduciendo la necesidad de intervención manual y asegurando resultados consistentes.  

- **Informes interactivos (Quarto + D3.js)**: Los resultados se presentan en **informes HTML dinámicos**, creados con **Quarto** y enriquecidos con **visualizaciones interactivas D3.js**. Los usuarios pueden explorar gráficos, filtrar tablas y navegar entre secciones de manera intuitiva, transformando datos complejos en información accesible y visualmente atractiva.  

- **IA/NLP para resúmenes**: Integración de **algoritmos de inteligencia artificial y procesamiento de lenguaje natural (NLP)** que generan **resúmenes automáticos de los resultados**, destacando hallazgos clave, patrones relevantes y posibles interpretaciones biológicas, ayudando al usuario a comprender rápidamente los puntos más importantes.  

- **Reproducibilidad (contenedores)**: Cada pipeline se ejecuta dentro de **contenedores Apptainer/Docker**, garantizando **aislamiento de dependencias**, **consistencia en la ejecución** y **replicabilidad absoluta** de los resultados en cualquier entorno, sin conflictos de software o diferencias en configuraciones.  

- **Despliegue flexible (local / HPC / cloud)**: El sistema puede ejecutarse **localmente**, en **clústeres HPC** o en **plataformas de nube**, adaptándose a distintos tamaños de proyecto y necesidades computacionales. Esto permite a los usuarios aprovechar la infraestructura disponible sin comprometer velocidad, seguridad o reproducibilidad.  






<br>
<br>

---

## 📂 Estructura del proyecto

El repositorio está organizado de forma modular para separar claramente la **interfaz de usuario**, los **pipelines de análisis**, los **entornos reproducibles** y la **documentación**. Esto facilita la navegación, el mantenimiento y la extensión del sistema.

```plaintext
project
├── 1-app         # App Shiny y recursos web
├── 2-pipelines   # Pipelines de análisis y plantillas Quarto
├── 3-containers  # Entornos reproducibles
├── 4-launch      # Scripts de lanzamiento
├── 5-examples    # Informes de ejemplo
├── 6-info        # Documentación y especificaciones
├── Dockerfile    # Imagen base del sistema
└── README.md     # Descripción general
```

<br>

A continuación se detalla la función de cada directorio:

- **`1-app/`:** Contiene la aplicación Shiny, formularios para introducir parámetros, selección del tipo de experimento y paneles interactivos con R, JS y D3.js, junto con los recursos front-end.  
- **`2-pipelines/`:** Incluye los pipelines bioinformáticos por tipo de análisis y las plantillas Quarto para generar los informes finales, así como archivos de ejemplo y scripts en R, Python o Snakemake/Nextflow.  
- **`3-docker/`:** Define los entornos reproducibles, incluyendo Dockerfiles o recetas Apptainer, dependencias específicas y versionado de imágenes.  
- **`4-launch/`:** Scripts para ejecutar la app Shiny y desplegar los pipelines en local, HPC o cloud, incluyendo utilidades de montaje de volúmenes y registro de logs.  
- **`5-examples/`:** Informes de ejemplo generados a partir de los pipelines y plantillas para cada tipo de análisis, que ilustran el formato y contenido esperado de los resultados finales.  
- **`6-info/`:** Documentación técnica y especificaciones detalladas para cada tipo de análisis, así como guías de usuario generales.  
- **`Dockerfile`:** Imagen base que integra la app, dependencias comunes y entorno mínimo para pipelines e informes.  
- **`README.md`:** Documento principal con descripción general, estructura del proyecto, guía rápida de uso y enlaces a la documentación detallada.  






<br>
<br>

---

## ⚙️ Requisitos

Antes de utilizar el sistema, se recomienda asegurarse de contar con los siguientes elementos mínimos para garantizar un funcionamiento óptimo:

- 🐳 **Docker o Apptainer**: necesario para construir y ejecutar los contenedores que incluyen la app Shiny, los pipelines y todas las dependencias de los informes interactivos.  
- 💻 **Terminal / Línea de comandos**: para ejecutar los scripts de lanzamiento y administrar los contenedores. Funciona en sistemas macOS, Linux y Windows (con terminal compatible como PowerShell o Git Bash).  
- 🌐 **Navegador web moderno**: se recomienda **Google Chrome** para explorar los informes HTML interactivos, ya que algunos componentes dinámicos (gráficos D3.js, paneles interactivos) pueden no cargarse correctamente en Safari u otros navegadores.  
- 📶 **Conexión a internet** (opcional, según caso): necesaria para acceder a recursos externos o actualizaciones de dependencias si se utilizan pipelines que descargan datos adicionales.

> 💡 **Nota:** con estos requisitos, la instalación y ejecución del sistema es sencilla y garantiza que todos los elementos interactivos de los informes funcionen de manera correcta y reproducible.






<br>
<br>

---

## 🚀 Guía rápida de uso (Quickstart)

Antes de comenzar a usar GenoScribe, es necesario obtener los archivos del proyecto y preparar el entorno. Esta sección proporciona un **resumen introductorio**; para más detalles sobre cada tipo de análisis y flujos específicos, consulta las guías completas en `6-info/`.  




<br>

### 📦 Descarga del proyecto

Para disponer de todo el código, pipelines y Dockerfile, existen varias formas:

#### 1. Clonar el repositorio con Git

Esta sería la opción recomendada si deseas mantener el proyecto actualizado fácilmente.

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

Una vez descargado el proyecto, existen dos formas principales de generar los informes bioinformáticos: **dentro de un contenedor** o **en local sin contenedor**.  
Cada una permite dos modos de ejecución: mediante la **interfaz Shiny** (más visual) o directamente con **Nextflow** (automatización avanzada).

#### 1. Usando Docker/Apptainer

Esta sería la opción recomendada si deseas mantener el proyecto actualizado fácilmente.

- Permite tener un entorno consistente y preconfigurado con todas las dependencias ✅
- Garantiza que los pipelines funcionen igual en distintos sistemas y servidores 🌐
- Ideal para usuarios que buscan un flujo estable y reproducible 🔒

Opciones de ejecución dentro del contenedor:

- **💻 Interfaz Shiny (visual)**  
  - Lanza el servidor Shiny dentro del contenedor  
  - Rellena el formulario de manera guiada para generar informes  
  - Recomendado para usuarios que prefieren un flujo interactivo  

- **⚡ Nextflow (manual/automatizado)**  
  - Ejecuta directamente los pipelines desde sus respectivos directorios  
  - Genera los informes Quarto automáticamente  
  - Ideal para automatización avanzada y ejecución por lotes


#### 2. Ejecución en local sin contenedor

- Ejecuta directamente la app Shiny o los pipelines Nextflow/R desde el código descargado 🖥️
- Requiere instalar manualmente todas las dependencias de R, Python y librerías bioinformáticas 📦
- Útil para depuración, desarrollo o pruebas rápidas 🧪

Opciones de ejecución en local:

- **💻 Interfaz Shiny (visual)**  
  - Lanza el servidor Shiny en tu máquina local  
  - Completa el formulario guiado para generar informes  

- **⚡ Nextflow (manual/automatizado)**  
  - Ejecuta directamente los pipelines desde sus respectivos directorios  
  - Genera los informes Quarto automáticamente  

> 💡 **Nota:** Shiny es ideal para usuarios que prefieren un flujo guiado y visual, mientras que Nextflow permite automatización avanzada y ejecución por lotes, ya sea en contenedor o en local.




<br>

### 🐳 Construcción del contenedor

Si decides usar Docker o Apptainer, existen dos estrategias principales para trabajar con el contenedor:

#### 1. Construir la imagen localmente desde el Dockerfile (recomendado)

Esta opción permite que crees la imagen directamente en tu máquina, lo que te da **flexibilidad** para personalizarla según tu sistema y recursos disponibles.

**Pasos:**
  1. Asegúrate de tener Docker instalado en tu sistema.
  2. Navega al directorio donde se encuentra el `Dockerfile`.
  3. Ejecuta el siguiente comando para construir la imagen:

```bash
docker build --no-cache -t genoscribe:1.0 .
```

**Ventajas:**
  - Total control sobre la configuración y dependencias de la imagen ✅
  - Evita descargar imágenes pesadas desde repositorios externos 💾
  - Recomendado para la mayoría de usuarios que quieran reproducibilidad y personalización 🔒

#### 2. Descargar la imagen preconstruida desde un repositorio Docker (opción avanzada)

Si prefieres no construir la imagen, puedes descargarla directamente desde un repositorio público como Docker Hub.

**Pasos:**
  1. Asegúrate de tener Docker instalado en tu sistema.
  2. Ejecuta el comando de descarga (reemplaza usuario/repositorio por la ruta correcta):

```bash
docker pull adrichez/genoscribe:1.0
```

**Ventajas:**
  - Inicio más rápido: no necesitas construir la imagen ⚡
  - Reproducibilidad inmediata con la versión exacta de la imagen 📦

**Consideraciones:**
  - La imagen puede ser pesada 💾
  - Menor flexibilidad para personalización de dependencias ⚙️

> 🔹 **Recomendación:** Construir la imagen localmente desde el Dockerfile es la opción más flexible y reproducible. Descargar la imagen preconstruida puede ser útil para usuarios avanzados que busquen rapidez y conveniencia.




<br>

### 🔄 Flujo mínimo para usar la app

Sigue estos pasos para generar informes bioinformáticos de forma reproducible y flexible:

**1. Descargar el repositorio**  
  Puedes clonar con Git o descargar el ZIP del proyecto.

**2. Construir la imagen Docker localmente** *(si decides usar contenedor)*  
  Esto garantiza un entorno consistente con todas las dependencias.

**3. Lanzar la app Shiny desde el script correspondiente**  
  Este proceso es el mismo tanto si se hace de forma local desde la terminal como si se hace dentro del contenedor.

  - **Unix/macOS:**  
    ```bash
    # Conceder permisos de ejecución a los scripts
    chmod +x ./4-launch/unix/run_app_persist.sh
    chmod +x ./4-launch/unix/run_app_temp.sh

    # Crear o iniciar contenedor y lanzar el servidor Shiny
    ./4-launch/unix/run_app_persist.sh 'ruta/carpeta/datos/proyecto' 'ruta/carpeta/enlazar/reportes'  # contenedor persistente
    ./4-launch/unix/run_app_temp.sh 'ruta/carpeta/datos/proyecto' 'ruta/carpeta/enlazar/reportes'  # contenedor temporal
    ```
  
  - **Windows:**  
    ```bash
    # Conceder permisos de ejecución a los scripts
    chmod +x ./4-launch/windows/run_app_persist.bat
    chmod +x ./4-launch/windows/run_app_temp.bat

    # Crear o iniciar contenedor y lanzar el servidor Shiny
    ./4-launch/windows/run_app_persist.bat 'ruta\carpeta\datos\proyecto' 'ruta\carpeta\enlazar\reportes'  # contenedor persistente
    ./4-launch/windows/run_app_temp.bat 'ruta\carpeta\datos\proyecto' 'ruta\carpeta\enlazar\reportes'  # contenedor temporal
    ```

**4. Alternativamente:** ejecutar los pipelines Nextflow directamente desde la terminal.  
  Esto permite generar los informes sin usar Shiny, ideal para usuarios avanzados o automatización por lotes.

  - **Ejecución local**  
    Ejecutar un comando similar a este en la terminal, encontrándose en el directorio específico de cada pipeline, dependiendo del tipo de análisis que se desee realizar. Por ejemplo, para un análisis de RNA-Seq:

    ```bash
    nextflow run main.nf -resume \
    --ruta_proyecto "ruta\carpeta\datos\proyecto" \
    --nombre_experimento "nombre_experimento"
    ```

  - **En un contenedor Docker**  
    Emplear el siguiente comando para iniciar un contenedor ya creado anteriormente y entrar en su terminal:  

    - **Unix/macOS:**  
      ```bash
      # Conceder permisos de ejecución
      chmod +x ./4-launch/unix/access_container_shell.sh

      # Iniciar contenedor creado previamente y acceder a la terminal
      ./4-launch/unix/access_container_shell.sh
      ```

    - **Windows:**  
      ```bash
      # Conceder permisos de ejecución
      chmod +x ./4-launch/windows/access_container_shell.bat

      # Iniciar contenedor creado previamente y acceder a la terminal
      ./4-launch/windows/access_container_shell.bat
      ```

    Y ahora, una vez hecho esto, se puede ejecutar el pipeline deseado desde la terminal del contenedor de forma similar con el siguiente comando Nextflow:

    ```bash
    nextflow run main.nf -resume \
    --ruta_proyecto "/data/carpeta/datos/proyecto" \
    --nombre_experimento "nombre_experimento"
    ```

    Donde aquí el parámetro `"ruta_proyecto"` se refiere a la ruta del proyecto dentro del contenedor, la cuál viene dada por la ruta `/data/carpeta/datos/proyecto`, ya que esta carpeta se pasa como volumen de la carpeta local donde se encuentran los datos del proyecto y se guarda en el contenedor dentro del directorio `/data`.

> 💡 Este flujo asegura **flexibilidad máxima**, cubriendo tanto usuarios novatos como avanzados, y proporciona un **entorno reproducible y consistente** para generar informes bioinformáticos.






<br>
<br>

---

## 🎯 Flujo de trabajo (visual)

A continuación, a modo de resumen, se muestra el **flujo principal** del sistema de generación automática de informes bioinformáticos, mediante el uso de contenedores y la interfaz visual de Shiny.

```ascii
→ Descarga del proyecto desde GitHub.
   → Construcción de la imagen GenoScribe.
   → Creación de un contenedor genoscribe_container.
   → Inicio del contenedor genoscribe_container.
   → Se inicia la app Shiny en el puerto 3838.
   → Seleccionar un tipo de análisis en el Shiny form.
   → Completar el formulario con los parámetros solicitados.
   → Se lanza un pipeline con Nextflow.
   → Se generan los outputs y el informe interactivo HTML.
   → Acceder al informe interactivo (HTML).
```

<br>

El GIF incluido a continuación ofrece una **representación visual rápida** del flujo principal del sistema, permitiendo al usuario comprender de manera inmediata cómo interactuar con la aplicación. En él se puede observar cómo se **inicia la app Shiny**, se completa el **formulario con los parámetros del experimento**, se selecciona el **tipo de análisis** (Bulk RNA-Seq, scRNA-Seq o Metagenómica) y finalmente se ejecuta el pipeline correspondiente dentro del contenedor. El proceso culmina con la **generación automática del informe HTML interactivo**, que puede ser explorado, descargado y compartido de manera sencilla. En este caso, a modo de ejemplo, se muestra el flujo para un análisis de Bulk RNA-Seq.  

<p align="center">
  <img src="6-info/assets/bulk_rna_seq_demo.gif" alt="Demostración del proceso para crear un informe de Bulk RNA-Seq con la app de Shiny en un contenedor Docker" width="65%">
</p>

Así, este GIF sirve como **guía visual rápida**, ideal para tener una idea general del flujo antes de profundizar en los detalles técnicos. Cabe destacar que **no incluye todos los pasos intermedios**, configuraciones específicas ni outputs secundarios, los cuales están documentados en la guía de usuario completa para cada tipo de análisis.

> 💡 **Nota:** este GIF es solo ilustrativo. Para una descripción completa del flujo, incluyendo **entradas, outputs y pasos detallados**, consulte las [Guías de usuario extendidas](6-info).







<br>
<br>

---

## 📚 Documentación detallada

Toda la documentación técnica y guías de uso se encuentran organizadas en la carpeta [`6-info/`](6-info/), diseñada para que el usuario pueda acceder fácilmente a instrucciones generales y específicas según el tipo de análisis.  

- [Guía general de usuario](6-info/0_GENERAL_USER_GUIDE.md) → Explica el flujo completo del sistema, la instalación, la configuración de contenedores y cómo interactuar con la app Shiny.  
- [Bulk RNA-Seq](6-info/1_BULK_RNA_SEQ_SPECS.md) → Detalla las especificaciones técnicas, entradas requeridas, outputs esperados y ejemplos de informes para análisis de RNA convencional.  
- [scRNA-Seq](6-info/2_SC_RNA_SEQ_SPECS.md) → Contiene las instrucciones específicas para análisis de células individuales, incluyendo parámetros de filtrado, normalización y visualización interactiva.  
- [Metagenómica](6-info/3_METAGENOMIC_SPECS.md) → Proporciona la documentación necesaria para análisis metagenómicos, desde el preprocesamiento de secuencias hasta la interpretación de resultados y generación de informes.  

> 💡 Esta estructura permite consultar rápidamente la guía adecuada según el tipo de experimento y profundizar en los detalles técnicos sin perder la visión global del proyecto.






<br>
<br>

---

## 🛠 Tecnologías principales

El proyecto combina un conjunto de herramientas y librerías modernas que permiten un flujo de trabajo **inteligente, reproducible e interactivo**. Se integran lenguajes de programación, sistemas de contenedores, plataformas de computación en la nube y librerías de visualización y procesamiento de lenguaje natural, asegurando que tanto el análisis como la generación de informes sean robustos y escalables.  

| Categoría         | Herramientas / Librerías                     |
|-------------------|----------------------------------------------|
| Lenguajes         | R, Python, JavaScript                        |
| Informes          | Quarto, R Markdown, Jupyter                  |
| Contenedores      | Apptainer / Docker                           |
| Visualización     | D3.js, ggplot2                               |
| IA / NLP          | spaCy, HuggingFace Transformers              |
| Cloud / HPC       | Picasso, Finisterrae III, almacenamiento S3  |

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

* 📧 **Correo electrónico:** [asanca33@gmail.com](mailto:asanca33@gmail.com)  
* 🐙 **Repositorio GitHub:** [https://github.com/adrichez/genoscribe](https://github.com/adrichez/genoscribe) → issues, pull requests, contribuciones bienvenidas. 🚀  
* 📚 **Documentación adicional:** revisa la carpeta [6-info/](6-info/) para guías, especificaciones y ejemplos de uso. 📝

Estamos abiertos a colaboraciones y mejoras, y agradecemos cualquier retroalimentación que ayude a que el sistema sea más **útil, reproducible y accesible** para la comunidad bioinformática.
