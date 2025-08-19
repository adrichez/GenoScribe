<p align="center">
  <img src="assets/bulk_rna_seq_cover.jpg" alt="Banner Bioinformatics Reports (Bulk RNA-Seq)" width="100%">
</p>

<div align="center">
  <h1>Sistema Inteligente y Reproducible de Generación de Informes Bioinformáticos</h1>
  <p>Desarrollo de un sistema inteligente y reproducible para la generación automatizada e interactiva de informes bioinformáticos integrados en entornos basados en contenedores y computación en la nube.</h3>
</div>

</div>

<br>

<div align="center">

[![R](https://img.shields.io/badge/R-276DC3?style=flat&logo=r&logoColor=white)](https://www.r-project.org/) [![Python](https://img.shields.io/badge/Python-3776AB?style=flat&logo=python&logoColor=white)](https://www.python.org/) [![Quarto](https://img.shields.io/badge/Quarto-1DA1F2?style=flat&logo=quarto&logoColor=white)](https://quarto.org/) [![Docker](https://img.shields.io/badge/Docker-2496ED?style=flat&logo=docker&logoColor=white)](https://www.docker.com/) [![Shiny](https://img.shields.io/badge/Shiny-FF4088?style=flat&logo=r&logoColor=white)](https://shiny.rstudio.com/) [![Apptainer](https://img.shields.io/badge/Apptainer-429999?style=flat&logo=apptainer&logoColor=white)](https://apptainer.org/) [![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=flat&logo=html5&logoColor=white)](https://developer.mozilla.org/en-US/docs/Web/HTML) [![CSS3](https://img.shields.io/badge/CSS3-1572B6?style=flat)](https://developer.mozilla.org/en-US/docs/Web/CSS) [![D3.js](https://img.shields.io/badge/D3.js-F9A03C?style=flat)](https://d3js.org/) [![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?style=flat&logo=javascript&logoColor=black)](https://developer.mozilla.org/en-US/docs/Web/JavaScript) [![Nextflow](https://img.shields.io/badge/Nextflow-1DA1F2?style=flat&logo=nextflow&logoColor=white)](https://www.nextflow.io/) [![Conda](https://img.shields.io/badge/Conda-342B02?style=flat&logo=anaconda&logoColor=white)](https://docs.conda.io/en/latest/) [![R Markdown](https://img.shields.io/badge/R_Markdown-536A89?style=flat&logo=r&logoColor=white)](https://rmarkdown.rstudio.com/) [![Jupyter](https://img.shields.io/badge/Jupyter-F37626?style=flat&logo=jupyter&logoColor=white)](https://jupyter.org/) [![Git](https://img.shields.io/badge/Git-F05032?style=flat&logo=git&logoColor=white)](https://git-scm.com/) [![GitHub](https://img.shields.io/badge/GitHub-181717?style=flat&logo=github&logoColor=white)](https://github.com/) [![spaCy](https://img.shields.io/badge/spaCy-09A3D6?style=flat&logo=spacy&logoColor=white)](https://spacy.io/) [![Markdown](https://img.shields.io/badge/Markdown-000000?style=flat&logo=markdown&logoColor=white)](https://www.markdownguide.org/) [![LaTeX](https://img.shields.io/badge/LaTeX-47A141?style=flat&logo=latex&logoColor=white)](https://www.latex-project.org/)

</div>






<br>
<br>

---

## 🚀 Descripción breve del proyecto


# RNA-Seq Analysis Pipeline

Este proyecto implementa un pipeline reproducible para el análisis de datos de RNA-Seq utilizando **Nextflow**, **MultiQC** y **Quarto** para la generación de informes dinámicos y personalizables.

El pipeline está diseñado para ejecutarse de forma modular, permitiendo personalizar rutas de entrada, nombres de experimentos y otros parámetros sin modificar el código fuente.

---




## 📌 Características principales

- Procesamiento de datos RNA-Seq paso a paso.
- Generación de métricas de calidad con **MultiQC**.
- Cálculo y procesamiento de valores RPKM.
- Generación de reportes HTML interactivos con **Quarto**.
- Ejecución reproducible y paralelizada con **Nextflow**.
- Configuración flexible vía `nextflow.config` o parámetros por consola.

---




## 📂 Estructura del proyecto

```bash
rnaseq-pipeline/
├── main.nf # Pipeline principal en Nextflow
├── nextflow.config # Configuración de parámetros
├── index.qmd # Documento Quarto principal
├── resources/ # Archivos y recursos del pipeline
│   └── 2-nextflow-results/ # Resultados generados
├── params.yml # Parámetros de Quarto (generado en tiempo de ejecución)
└── README.md # Este archivo
```

---




## 🖥 Requisitos

Antes de ejecutar el pipeline, asegúrate de tener instalado:

- [Nextflow](https://www.nextflow.io/) ≥ 25.04
- [Quarto](https://quarto.org/) ≥ 1.5
- [MultiQC](https://multiqc.info/)
- R ≥ 4.2 (con los paquetes necesarios para el análisis)
- Acceso a los datos RNA-Seq que deseas procesar

---




## ⚙️ Instalación

Clonar el repositorio:

```bash
git clone https://github.com/usuario/rnaseq-pipeline.git
cd rnaseq-pipeline
```

---




## 🚀 Uso

1. Ejecutar con parámetros por defecto (definidos en nextflow.config):

```bash
nextflow run main.nf -resume
```

2. Ejecutar sobrescribiendo parámetros desde consola:

```bash
nextflow run main.nf -resume \
    --ruta_proyecto "/ruta/a/mi/proyecto" \
    --nombre_experimento "mary"

nextflow run main.nf -resume \
    --ruta_proyecto "/Users/adrian/Documents/4 Workspace/Prototipo_resultados/EXT_RNA_Seq" \
    --nombre_experimento "mary"

nextflow run main.nf -resume \
    --ruta_proyecto "/data/EXT_RNA_Seq" \
    --nombre_experimento "mary"
```

3. Parámetros disponibles:

| Parámetro            | Descripción                                            | Valor por defecto             |
|----------------------|--------------------------------------------------------|-------------------------------|
| `ruta_proyecto`      | Ruta al directorio del proyecto RNA-Seq                | `/ruta/por/defecto`           |
| `nombre_experimento` | Nombre del experimento para identificar resultados      | `experimento1`                |
| `outdir`             | Carpeta donde se guardarán los resultados del pipeline | `resources/2-nextflow-results` |

---




## 📊 Salida esperada

Al finalizar, el pipeline generará:

- Resultados procesados en la carpeta definida en outdir.
- Reporte HTML de análisis en index.html (generado con Quarto).
- Reporte MultiQC con métricas de calidad.

Ejemplo de salida:

```bash
resources/2-nextflow-results/
├── multiqc_report.html
├── RPKM_processed.csv
└── report/
    └── index.html
```

---



## 📖 Ejemplo de flujo de ejecución

- Copia de la carpeta del proyecto.
- Ejecución de análisis y métricas con MultiQC.
- Procesamiento de datos RPKM.
- Renderizado final del informe Quarto.

---




## 👤 Autor

Adrián Sánchez Carrión.
Máster en Ciencia de Datos e Ingeniería de Computadores, Universidad de Granada.
Instituto de Parasitología y Biomedicina "López-Neyra", CSIC.

---




## 📜 Licencia

Este proyecto está bajo la licencia MIT. Consulta el archivo LICENSE para más detalles.