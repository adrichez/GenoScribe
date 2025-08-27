<p align="center">
  <img src="assets/metagenomic_cover.jpg" alt="Banner Bioinformatics Reports (Metagenómica)" width="100%">
</p>

<div align="center">
  <h1>Sistema Inteligente y Reproducible de Generación de Informes Bioinformáticos</h1>
  <h2>Guía de Usuario para Análisis Metagenómico</h2>
</div>

</div>

</div>

<br>

<div align="center">

[![R](https://img.shields.io/badge/R-276DC3?style=flat&logo=r&logoColor=white)](https://www.r-project.org/) [![Python](https://img.shields.io/badge/Python-3776AB?style=flat&logo=python&logoColor=white)](https://www.python.org/) [![Quarto](https://img.shields.io/badge/Quarto-1DA1F2?style=flat&logo=quarto&logoColor=white)](https://quarto.org/) [![Docker](https://img.shields.io/badge/Docker-2496ED?style=flat&logo=docker&logoColor=white)](https://www.docker.com/) [![Shiny](https://img.shields.io/badge/Shiny-FF4088?style=flat&logo=r&logoColor=white)](https://shiny.rstudio.com/) [![Apptainer](https://img.shields.io/badge/Apptainer-429999?style=flat&logo=apptainer&logoColor=white)](https://apptainer.org/) [![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=flat&logo=html5&logoColor=white)](https://developer.mozilla.org/en-US/docs/Web/HTML) [![CSS3](https://img.shields.io/badge/CSS3-1572B6?style=flat)](https://developer.mozilla.org/en-US/docs/Web/CSS) [![D3.js](https://img.shields.io/badge/D3.js-F9A03C?style=flat)](https://d3js.org/) [![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?style=flat&logo=javascript&logoColor=black)](https://developer.mozilla.org/en-US/docs/Web/JavaScript) [![Nextflow](https://img.shields.io/badge/Nextflow-1DA1F2?style=flat&logo=nextflow&logoColor=white)](https://www.nextflow.io/) [![Conda](https://img.shields.io/badge/Conda-342B02?style=flat&logo=anaconda&logoColor=white)](https://docs.conda.io/en/latest/) [![R Markdown](https://img.shields.io/badge/R_Markdown-536A89?style=flat&logo=r&logoColor=white)](https://rmarkdown.rstudio.com/) [![Jupyter](https://img.shields.io/badge/Jupyter-F37626?style=flat&logo=jupyter&logoColor=white)](https://jupyter.org/) [![Git](https://img.shields.io/badge/Git-F05032?style=flat&logo=git&logoColor=white)](https://git-scm.com/) [![GitHub](https://img.shields.io/badge/GitHub-181717?style=flat&logo=github&logoColor=white)](https://github.com/) [![spaCy](https://img.shields.io/badge/spaCy-09A3D6?style=flat&logo=spacy&logoColor=white)](https://spacy.io/) [![Markdown](https://img.shields.io/badge/Markdown-000000?style=flat&logo=markdown&logoColor=white)](https://www.markdownguide.org/) [![LaTeX](https://img.shields.io/badge/LaTeX-47A141?style=flat&logo=latex&logoColor=white)](https://www.latex-project.org/)

</div>






<br>
<br>

---

## 1. 🌍 Introducción al proyecto

* Breve párrafo de qué es **este proyecto global** (automatización de informes bioinformáticos, reproducibilidad, integración con contenedores).
* Enlace al `README.md` para visión general.
* Explica que este documento está centrado **exclusivamente en análisis Bulk RNA-Seq**, con un nivel más técnico.

👉 Aquí puedes añadir un **diagrama general** del ecosistema (con App Shiny ↔ Workflows ↔ Informes).






<br>
<br>

---

## 2. 🧬 ¿Qué es el análisis Bulk RNA-Seq?

* Descripción conceptual de **qué es Bulk RNA-Seq** (nivel introductorio, sin volverse una clase completa).
* Explica la diferencia con scRNA-seq y cuándo usarlo.
* Enumera **objetivos típicos**:

  * Medición de expresión génica a nivel de muestra.
  * Comparación de condiciones biológicas.
  * Identificación de genes diferencialmente expresados.
  * Análisis funcional/enriquecimiento.

👉 Aquí puede ir un **esquema ilustrativo** (por ejemplo, pipeline de RNA-seq en dibujo o gif: reads → alineamiento → conteo → DE → informe).






<br>
<br>

---

## 3. ⚙️ Instalación y configuración (extendida)

Esta sección amplía lo ya descrito en el README, con más detalle y ejemplos.




<br>

### 3.1 Requisitos previos

* Docker / Apptainer / Singularity.
* Espacio en disco, RAM mínima.
* Dependencias del sistema (solo listarlas, no instalarlas una por una).

👉 Incluir un **gif de instalación de Docker/Apptainer** o screenshot.




<br>

### 3.2 Descarga del repositorio

Ejemplo con `git clone`.
Screenshot de la estructura del repo (usa un árbol ASCII o imagen).




<br>

### 3.3 Construcción de contenedor

* Paso a paso para **Docker**.
* Paso a paso para **Apptainer**.
* Explicación del tag de la imagen y cómo versionarla.
* **Gif/animación** mostrando `docker build` o `apptainer build`.




<br>

### 3.4 Ejecución mínima

* Ejemplo simple de lanzar el contenedor.
* Nota sobre persistencia de volúmenes (`-v`).
* Screenshot de la App Shiny levantándose o del CLI ejecutando un pipeline.






<br>
<br>

---

## 4. 📥 Entradas requeridas

* **FASTQ**: formatos, compresión `.fastq.gz`, nomenclatura de archivos.
* **Metadatos**: CSV/TSV con columnas obligatorias.
* **Referencias**: genoma, GTF/GFF, índices.
* **Estructura de carpetas esperada** → incluir un **diagrama de árbol ASCII** o captura de ejemplo.






<br>
<br>

---

## 5. 🛠️ Pipeline Bulk RNA-Seq

Explicado con entradas y salidas por etapa.




<br>

### 5.1 Diagrama general

Un **diagrama de flujo visual** con flechas y colores (ideal un SVG simple).




<br>

### 5.2 Etapas del pipeline

Para cada etapa:

* **Entrada → Proceso → Salida**
* Ejemplo de archivo de salida (mini captura de tabla o snippet).

Etapas sugeridas:

1. QC inicial
2. Preprocesado (trimming)
3. Alineamiento / cuantificación pseudoalineada
4. QC post-mapeo
5. Normalización
6. Expresión diferencial
7. Enriquecimiento funcional (opcional)
8. Generación de informe Quarto

👉 Aquí es buen sitio para poner **screenshots de informes parciales**: un volcano plot, un heatmap, etc.






<br>
<br>

---

## 6. ⚙️ Parámetros configurables

Tabla tipo:

| Parámetro     | Descripción                | Tipo/Valores         | Default | Definición    |
| ------------- | -------------------------- | -------------------- | ------- | ------------- |
| min\_quality  | Filtro de calidad de reads | int                  | 20      | `config.yaml` |
| normalization | Método de normalización    | TPM / DESeq2 / EdgeR | DESeq2  | App Shiny     |

👉 Añadir **gif corto** de la App Shiny mostrando cómo se ajusta un parámetro.






<br>
<br>

---

## 7. ▶️ Ejecución del análisis

### 7.1 Desde la App Shiny

* Paso a paso con screenshots (selección de archivos, parámetros, botón “Run”).
* Explica qué se guarda automáticamente.




<br>

### 7.2 Desde CLI / Workflow

* Ejemplo único con `nextflow run` o `snakemake`.
* Screenshot del terminal con logs de progreso.






<br>
<br>

---

## 8. 📤 Outputs esperados

* **Tablas:** conteos crudos, normalizados, DE.
* **Gráficos:** volcano, MA plot, heatmap, PCA.
* **Informe final (HTML/PDF Quarto):**

  * Estructura (índice de secciones).
  * Ejemplos visuales (capturas de pantallas de gráficos).

👉 Aquí usar **screenshots de informes reales** o versiones mockup.






<br>
<br>

---

## 9. ✅ Control de calidad y validación

* Qué métricas revisar (Q30, %map, distribución de counts).
* Screenshot de un reporte QC (MultiQC).
* Sugerencias de valores de corte.






<br>
<br>

---

## 10. 🧪 Ejemplo práctico

* Instrucciones para probar con los datos de `5-examples/bulk/`.
* Qué esperar en el informe resultante.
* Screenshots comparativos “input → output”.






<br>
<br>

---

## 11. 🛟 Troubleshooting

FAQ con errores típicos + capturas de error:

* FASTQ corrupto.
* CSV mal formateado.
* Falta memoria.
* Contenedor no arranca.






<br>
<br>

---

## 12. 🔌 Extensión del pipeline

* Cómo añadir módulos nuevos.
* Ejemplo: añadir análisis de enriquecimiento GO.
* Referencia a los archivos del pipeline donde hacerlo.






<br>
<br>

---

## 13. 📚 Referencias

* Papers y documentación estándar de Bulk RNA-Seq.
* Referencias de herramientas (FastQC, STAR/Salmon, DESeq2, etc.).
