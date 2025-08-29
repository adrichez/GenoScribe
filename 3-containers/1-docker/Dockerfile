# 1. Imagen base: R + Shiny Server
FROM rocker/shiny:4.4.1

# 2. Variables para evitar preguntas en apt y asegurar rutas
ENV DEBIAN_FRONTEND=noninteractive
ENV PATH="/usr/local/bin:${PATH}"

# 3. Paquetes de sistema
RUN apt-get update && apt-get install -y --no-install-recommends \
    libssl-dev \
    libcurl4-openssl-dev \
    libxml2-dev \
    libfontconfig1-dev \
    libharfbuzz-dev \
    libfribidi-dev \
    libfreetype6-dev \
    libpng-dev \
    libtiff5-dev \
    libjpeg-dev \
    pkg-config \
    openjdk-17-jre-headless \
    curl \
    git \
    python3 \
    python3-pip \
    unzip \
    less \
    nano \
  && rm -rf /var/lib/apt/lists/*

# 4. Nextflow
RUN curl -s https://get.nextflow.io | bash \
    && mv nextflow /usr/local/bin/ \
    && chown root:shiny /usr/local/bin/nextflow \
    && chmod 755 /usr/local/bin/nextflow \
    && /usr/local/bin/nextflow -v

# 5. Quarto CLI
RUN curl -fsSL https://quarto.org/download/latest/quarto-linux-amd64.deb -o /tmp/quarto.deb \
  && apt-get update && apt-get install -y /tmp/quarto.deb \
  && rm -f /tmp/quarto.deb

# 6 Forzar librería de usuario de R dentro del contenedor
ENV R_LIBS_USER=/usr/local/lib/R/site-library

# 7. Paquetes R que usas (añade los que falten)
RUN R -e "options(repos='https://cloud.r-project.org'); \
    install.packages(c('shiny','xfun','knitr','rmarkdown','quarto','fs','jsonlite','dplyr','DT','glue','purrr','stringr','ggplot2','readxl','htmltools','plotly','scales','tidyverse','tidyr','tibble'), dependencies=TRUE, quiet=TRUE)"

# 8. MultiQC (vía pip)
RUN pip3 install --no-cache-dir multiqc

# 9. Instalar Miniconda + Mamba (solo con conda-forge)
RUN curl -fsSL https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -o /tmp/miniconda.sh \
    && bash /tmp/miniconda.sh -b -p /opt/miniconda3 \
    && rm /tmp/miniconda.sh \
    # Sembrar config global ANTES del primer 'conda' (sin defaults)
    && mkdir -p /etc/conda \
    && printf "channels:\n  - conda-forge\nchannel_priority: strict\ndefault_channels: []\n" > /etc/conda/condarc \
    # Ahora sí podemos usar conda sin topar ToS de Anaconda
    && /opt/miniconda3/bin/conda install -y -n base -c conda-forge --override-channels mamba \
    && /opt/miniconda3/bin/conda clean -afy

# 10. Crear entorno para bulk RNA-seq
COPY 3-containers/1-docker/env_bulk_rna_seq.yml /tmp/env_bulk_rna_seq.yml
RUN /opt/miniconda3/bin/mamba env create -f /tmp/env_bulk_rna_seq.yml \
    && rm /tmp/env_bulk_rna_seq.yml

# 11. Copiar carpetas del proyecto
COPY 1-app /GenoScribe/1-app
COPY 2-pipelines /GenoScribe/2-pipelines
COPY 3-containers /GenoScribe/3-containers
COPY 4-launch /GenoScribe/4-launch
COPY 5-examples /GenoScribe/5-examples
COPY 6-info /GenoScribe/6-info
COPY README.md /GenoScribe/README.md

# 12. Limpiar caches de Quarto y R que arrastran rutas absolutas del host
RUN rm -rf /GenoScribe/1-app/_freeze /GenoScribe/1-app/_cache \
    && rm -rf /GenoScribe/2-pipelines/1-bulk-rna-seq/_freeze /GenoScribe/2-pipelines/1-bulk-rna-seq/_cache \
    && rm -rf /GenoScribe/2-pipelines/3-metagenomic/_freeze /GenoScribe/2-pipelines/3-metagenomic/_cache \
    && find /GenoScribe -type f -name "*.rds" -delete

# 13. Crear enlace simbólico para que Shiny sirva la app
RUN ln -s /GenoScribe/1-app /srv/shiny-server/app

# 14. Crear carpeta de reports dentro de www
RUN mkdir -p /srv/shiny-server/app/www/reports

# 15. Permisos de Shiny y entrypoint
RUN chown -R shiny:shiny /srv/shiny-server /GenoScribe
RUN chmod +x /GenoScribe/3-containers/1-docker/entrypoint.sh

# 16. Exponer el puerto 3838
EXPOSE 3838

# 17. Comando por defecto
CMD ["/GenoScribe/3-containers/1-docker/entrypoint.sh"]
