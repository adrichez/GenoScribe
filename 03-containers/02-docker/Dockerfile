#############################################################################################################################################################
# DOCKERFILE DEL CONTENEDOR DE GENOSCRIBE
#############################################################################################################################################################

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
    libwebp-dev \
    pkg-config \
    freetype2-demos \
    openjdk-17-jre-headless \
    curl \
    git \
    python3 \
    python3-pip \
    unzip \
    less \
    nano \
    lsof \
    procps \
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


# 6. Librería global de R
ENV R_LIBS_SITE=/usr/local/lib/R/site-library
ENV R_LIBS_USER=


# 7. Instalación de paquetes R
RUN set -e \
  && Rscript -e "options(repos = 'https://cloud.r-project.org'); install.packages(c( \
      'shiny', 'xfun', 'knitr', 'rmarkdown', 'quarto', 'fs', 'jsonlite', 'dplyr', \
      'DT', 'glue', 'purrr', 'stringr', 'ggplot2', 'readxl', 'htmltools', 'plotly', \
      'scales', 'tidyr', 'tibble', 'magrittr', 'htmlwidgets', 'ragg', 'bslib', 'readr', \
      'promises', 'httpuv' \
    ), dependencies = TRUE)" \
  && Rscript -e "options(repos = 'https://cloud.r-project.org'); install.packages('tidyverse', dependencies = TRUE)" \
  && Rscript -e "if (!requireNamespace('tidyverse', quietly = TRUE)) quit(status = 1)"


# 8. Instalación de MultiQC (vía pip)
RUN pip3 install --no-cache-dir multiqc


# 9. Instalar Miniconda + Mamba (solo conda-forge)
RUN curl -fsSL https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -o /tmp/miniconda.sh \
  && bash /tmp/miniconda.sh -b -p /opt/miniconda3 \
  && rm /tmp/miniconda.sh \
  # Sembrar config global ANTES del primer 'conda' (sin defaults)
  && mkdir -p /etc/conda \
  && printf "channels:\n  - conda-forge\nchannel_priority: strict\ndefault_channels: []\n" > /etc/conda/condarc \
  # Ahora sí se puede usar conda sin topar ToS de Anaconda
  && /opt/miniconda3/bin/conda install -y -n base -c conda-forge --override-channels mamba \
  && /opt/miniconda3/bin/conda clean -afy


# 10. Crear entorno conda para Genoscribe
COPY 03-containers/01-assets/env_genoscribe.yml /tmp/env_genoscribe.yml
RUN /opt/miniconda3/bin/mamba env create -f /tmp/env_genoscribe.yml \
    && rm /tmp/env_genoscribe.yml


# 11. Activar entorno conda por defecto para shells/bash
RUN echo "source /opt/miniconda3/bin/activate /opt/miniconda3/envs/genoscribe" > /etc/profile.d/conda.sh \
  && echo 'export PATH="/opt/miniconda3/envs/genoscribe/bin:$PATH"' >> /etc/profile.d/conda.sh \
  && echo 'export R_HOME=/opt/miniconda3/envs/genoscribe/lib/R' >> /etc/profile.d/conda.sh \
  && echo 'export R_LIBS=/opt/miniconda3/envs/genoscribe/lib/R/library' >> /etc/profile.d/conda.sh \
  && chmod +x /etc/profile.d/conda.sh


# 12. Crear estructura base para la app
RUN mkdir -p /workspace \
  && mkdir -p /workspace/data \
  && mkdir -p /srv/shiny-server/app/www/reports \
  && chown -R shiny:shiny /srv/shiny-server /workspace


# 13. Copiar y registrar el entrypoint
COPY 03-containers/02-docker/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh


# 14. Exponer el puerto de Shiny
EXPOSE 3838


# 15. Mantener el contenedor vivo con Shiny Server
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
