# Nota Informativa: Informe de Ejemplo de Transcriptómica Espacial

Este documento proporciona las instrucciones y enlaces necesarios para acceder al informe bioinformático interactivo de ejemplo de Transcriptómica de Espacial (*Spatial RNA-Seq*) generado por el *pipeline* **GenoScribe**. Debido a las dimensiones excepcionales de este tipo de resultados, su distribución y visualización se gestionan de forma externa al repositorio principal.




## 1. Justificación Técnica

A diferencia de otros ejemplos de análisis proporcionados, la transcriptómica espacial (*Spatial Transcriptomics* o *ST-RNA-Seq*) genera un volumen de datos de una magnitud abrumadora. 

El informe interactivo completo generado por **GenoScribe** para esta disciplina incluye no solo matrices de expresión masivas, sino también la integración de los datos con imágenes histológicas de alta resolución (como tinciones H&E o inmunofluorescencia). Sobre estas imágenes se superponen múltiples proyecciones moleculares espaciales (*SpatialDimPlots*, *FeaturePlots* espaciales) y se generan repositorios exhaustivos para cada nicho tisular o clúster biológico. Como resultado, el peso total del informe de ejemplo descomprimido **alcanza un tamaño excepcionalmente grande**.

> **Nota:** Para garantizar la portabilidad del repositorio principal de GenoScribe, optimizar los tiempos de clonación y evitar sobrecargar la cuota de almacenamiento de Git LFS, se ha decidido **no incluir físicamente el archivo `.zip`** de este ejemplo en este directorio.




## 2. Cómo consultar el informe de ejemplo

Para facilitar su consulta sin penalizar el rendimiento del repositorio principal, el informe de ejemplo ha sido desplegado en una infraestructura independiente. Puede acceder a él a través de las dos vías siguientes:


### a) Visualización Interactiva Online (Opción Recomendada)

Puede explorar el informe completo, interactuar con los gráficos y evaluar el Mini Chatbot RAG directamente desde su navegador web, sin necesidad de descargar ningún archivo pesado.

* **Enlace directo:** [Explorar informe interactivo interactivo de Spatial RNA-Seq](https://adrichez.github.io/GenoScribe-Transcriptomics-Spatial-RNA-Seq-Report/)


### b) Descarga de los archivos fuente

Si necesita obtener los archivos físicos del informe (el documento HTML principal y sus dependencias) para inspeccionarlos en su entorno local, puede clonar o descargar el repositorio satélite dedicado exclusivamente a este fin.

* **Repositorio GitHub:** [adrichez/GenoScribe-Transcriptomics-Spatial-RNA-Seq-Report](https://github.com/adrichez/GenoScribe-Transcriptomics-Spatial-RNA-Seq-Report)
* *Nota:* Los datos y archivos renderizados del informe se encuentran alojados listos para su uso dentro del directorio `/docs` de dicho repositorio.
