#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
# SECCIÓN 5: NORMALIZACIÓN DE LA EXPRESIÓN GÉNICA
#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

params <- list(
  ruta_proyecto = "/Users/adrian/Documents/4 Workspace/Prototipo_resultados/EXT_RNA_Seq",
  nombre_experimento = "mary"
)










#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# 5.1. Normalización de los datos de expresión
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

library(DT)
library(ggplot2)
library(plotly)
library(dplyr)
library(stringr)
library(scales)
library(tidyverse)
library(tidyr)
library(tibble)
library(glue)








#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# 5.1.1. Visualización de la matriz normalizada
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

# Definir rutas clave
experimento_RPKM <- paste0(params$nombre_experimento, "_RPKM.xls")
ruta_experimento_RPKM <- file.path(params$ruta_proyecto, "Resultados", params$nombre_experimento, experimento_RPKM)
file_ruta_experimento_RPKM <- gsub(" ", "%20", paste0("file:///", ruta_experimento_RPKM))



# Leer el archivo y mostrar tabla interactiva
if (file.exists(ruta_experimento_RPKM)) {
  # Leer la matriz de RPKM
  matriz_RPKM <- read.table(ruta_experimento_RPKM, header = TRUE, fill = TRUE, stringsAsFactors = FALSE)
  rownames(matriz_RPKM) <- matriz_RPKM[[1]]
  matriz_RPKM <- matriz_RPKM[, -1]
  
  # Tabla interactiva de metadatos
  htmltools::div(
    class = "scroll-y-max-500",
    DT::datatable(
      matriz_RPKM,
      options = list(
        scrollX = TRUE,
        paging = FALSE,
        lengthChange = FALSE,
        language = list(
          url = '//cdn.datatables.net/plug-ins/1.13.4/i18n/es-ES.json'
        )
      ),
      class = 'stripe hover compact',
      rownames = FALSE
    )
  )
  
} else {
  cat(glue::glue('
  cat("Archivo "{experimento_RPKM}" no encontrado. Verifica la ruta.")
  \n\n'))
}



# Definir ruta de salida para el archivo TXT
ruta_experimento_RPKM_txt <- file.path(getwd(), "results", "5-analisis-estadistico", paste0(params$nombre_experimento, "_RPKM.txt"))
experimento_RPKM_txt <- basename(ruta_experimento_RPKM_txt)
file_ruta_experimento_RPKM_txt <- gsub(" ", "%20", paste0("file:///", ruta_experimento_RPKM_txt))






#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# 5.1.2. Total de lecturas asignadas por muestra (RPKM)
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

# Calcular número total de lecturas asignadas por muestra
total_recuentos_por_muestra <- colSums(matriz_RPKM)

total_recuentos_por_muestra_df <- data.frame(
  Muestra = names(total_recuentos_por_muestra),
  TotalRecuentos = as.integer(total_recuentos_por_muestra)
)


# Convertir a data frame para ggplot2
df_total <- data.frame(
  muestra = names(total_recuentos_por_muestra),
  total_lecturas = as.integer(total_recuentos_por_muestra)
)

# Asegurarnos que 'targets' está cargado previamente
targets_experimento <- paste0("targets_", params$nombre_experimento, ".txt")
ruta_targets_experimento <- file.path(params$ruta_proyecto, "Resultados", targets_experimento)
targets <- read.table(ruta_targets_experimento, header = TRUE, fill = TRUE, stringsAsFactors = FALSE)

# Limpiar y unir condición
df_total$muestra <- str_remove(df_total$muestra, "_nat$")
df_total <- df_total %>%
  left_join(targets %>% select(Filename, Type), by = c("muestra" = "Filename")) %>%
  rename(condicion = Type) %>%
  select(muestra, condicion, total_lecturas) %>%
  arrange(desc(total_lecturas))


# Mostrar tabla interactiva con DT
htmltools::div(
  class = "scroll-y-max-500",
  DT::datatable(
    df_total,
    options = list(
      scrollX = TRUE,
      paging = FALSE,
      lengthChange = FALSE,
      language = list(
        url = '//cdn.datatables.net/plug-ins/1.13.4/i18n/es-ES.json'
      )
    ),
    class = 'stripe hover compact',
  )
)


# Gráfico de número total de lecturas por muestra
p <- ggplot(df_total, aes(x = muestra, y = total_lecturas, fill = condicion)) +
  geom_bar(stat = "identity", color = "black", alpha = 0.9) +
  geom_text(
    aes(label = comma(total_lecturas)),
    position = position_dodge(width = 0.9),  # Mejora la alineación en plotly
    vjust = -0.7, 
    size = 3.5
  ) +
  scale_y_continuous(
    labels = comma,
    expand = expansion(mult = c(0, 0.15))  # Más espacio arriba
  ) +
  scale_fill_brewer(palette = "Set2") +
  labs(
    title = "Total de lecturas por muestra",
    x = "Muestra",
    y = "Número de lecturas",
    fill = "Condición"
  ) +
  theme_minimal(base_size = 13) +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    legend.position = "bottom"
  )

# Convertir a interactivo
ggplotly(p)


# Gráfico de número total de lecturas por muestra con plotly
plot_ly(
  data = df_total,
  x = ~muestra,
  y = ~total_lecturas,
  type = "bar",
  color = ~condicion,
  colors = "Set2",
  text = ~comma(total_lecturas),
  textposition = "outside",
  hoverinfo = "text",
  hovertext = ~paste0("Muestra: ", muestra, "<br>Lecturas: ", comma(total_lecturas))
) %>%
  layout(
    title = "Total de lecturas por muestra",
    xaxis = list(title = "Muestra", tickangle = -45, tickfont = list(size = 10)),
    yaxis = list(
      title = "Número de lecturas",
      range = c(0, max(df_total$total_lecturas) * 1.15)
    ),
    legend = list(
      orientation = "h",
      x = 0.5,
      y = -0.5,
      xanchor = "center"
    ),
    margin = list(t = 100, b = 170),
    autosize = TRUE
  )






#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# 5.1.3. Número de genes expresados por muestra (RPKM)
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

# Calcular número de genes expresados por muestra (genes con recuentos > 0)
genes_expresados_por_muestra <- colSums(matriz_RPKM > 0)

genes_expresados_por_muestra_df <- data.frame(
  Muestra = names(genes_expresados_por_muestra),
  GenesExpresados = as.integer(genes_expresados_por_muestra)
)


# Crear data frame
df_genes_exp <- data.frame(
  muestra = names(genes_expresados_por_muestra),
  genes_expresados = as.integer(genes_expresados_por_muestra)
)

# Añadir la columna 'condicion' uniendo por el nombre de muestra
df_genes_exp$muestra <- str_remove(df_genes_exp$muestra, "_nat$")
df_genes_exp <- df_genes_exp %>%
  left_join(targets %>% select(Filename, Type), by = c("muestra" = "Filename")) %>%
  rename(condicion = Type) %>%
  select(muestra, condicion, genes_expresados) %>%
  arrange(desc(genes_expresados))


# Crear la tabla interactiva
htmltools::div(
  class = "scroll-y-max-500",
  DT::datatable(
    df_genes_exp,
    options = list(
      scrollX = TRUE,
      paging = FALSE,
      lengthChange = FALSE,
      language = list(
        url = '//cdn.datatables.net/plug-ins/1.13.4/i18n/es-ES.json'
      )
    ),
    class = 'stripe hover compact',
  )
)


# Gráfico: genes expresados por muestra (>0)
p <- ggplot(df_genes_exp, aes(x = muestra, y = genes_expresados, fill = condicion)) +
  geom_bar(stat = "identity", color = "black", alpha = 0.9) +
  geom_text(aes(label = comma(genes_expresados)), vjust = -0.5, size = 3.5) +
  scale_y_continuous(labels = comma) +
  scale_fill_brewer(palette = "Set1") +
  labs(
    title = "Número de genes expresados por muestra",
    x = "Muestra",
    y = "Genes con recuentos > 0",
    fill = "Condición"
  ) +
  theme_minimal(base_size = 13) +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    legend.position = "bottom"
  )

# Convertir a interactivo
ggplotly(p)


# Gráfico: genes expresados por muestra (>0) con plotly
plot_ly(
  data = df_genes_exp,
  x = ~muestra,
  y = ~genes_expresados,
  type = "bar",
  color = ~condicion,
  colors = "Set2",  # mismo estilo que ggplot (Set1)
  text = ~comma(genes_expresados),
  textposition = "outside",
  hoverinfo = "text",
  hovertext = ~paste0("Muestra: ", muestra, "<br>Genes expresados: ", comma(genes_expresados))
) %>%
  layout(
    title = "Número de genes expresados por muestra",
    xaxis = list(
      title = "Muestra",
      tickangle = -45,
      tickfont = list(size = 10)
    ),
    yaxis = list(
      title = "Genes con recuentos > 0",
      range = c(0, max(df_genes_exp$genes_expresados) * 1.15),
      separatethousands = TRUE
    ),
    legend = list(
      orientation = "h",
      x = 0.5,
      y = -0.52,
      xanchor = "center"
    ),
    margin = list(t = 100, b = 170),
    autosize = TRUE
  )






#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# 5.1.4. Genes con mayor expresión total (RPKM)
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

# Obtener los genes con mayor nivel de expresión total (suma por fila)
top_genes<- rowSums(matriz_RPKM) |>
  sort(decreasing = TRUE)

top_genes_df <- data.frame(
  Gen = names(top_genes),
  TotalRecuentos = as.integer(top_genes)
)

top_genes_20 <- rowSums(matriz_RPKM) |>
  sort(decreasing = TRUE) |>
  head(20)

top_genes_20_df <- data.frame(
  Gen = names(top_genes_20),
  TotalRecuentos = as.integer(top_genes_20)
)


# Crear la tabla interactiva
htmltools::div(
  class = "scroll-y-max-500",
  DT::datatable(
    top_genes_df,
    options = list(
      scrollX = TRUE,
      paging = FALSE,
      lengthChange = FALSE,
      language = list(
        url = '//cdn.datatables.net/plug-ins/1.13.4/i18n/es-ES.json'
      )
    ),
    class = 'stripe hover compact',
  )
)


# Ordenar los genes de forma descendente para el gráfico
top_genes_20_df$Gen <- factor(top_genes_20_df$Gen, levels = rev(top_genes_20_df$Gen))

# Crear gráfico de barras
p <- ggplot(top_genes_20_df, aes(x = Gen, y = TotalRecuentos)) +
  geom_bar(stat = "identity", fill = "#098", color = "black", alpha = 0.9) +
  geom_text(aes(label = comma(TotalRecuentos)), hjust = -0.1, size = 3.5) +
  scale_y_continuous(labels = comma, expand = expansion(mult = c(0, 0.1))) +
  coord_flip() +  # Para poner los genes en el eje Y (más legible)
  labs(
    title = "Top 10 genes más expresados",
    x = "Gen",
    y = "Recuentos totales"
  ) +
  theme_minimal(base_size = 13)

# Convertir a interactivo
ggplotly(p)


# Gráfico: top 20 genes más expresados con plotly (horizontal)
plot_ly(
  data = top_genes_20_df,
  x = ~TotalRecuentos,
  y = ~Gen,
  type = "bar",
  orientation = "h",
  marker = list(
    color = "#098",
    line = list(color = "black", width = 1)
  ),
  text = ~comma(TotalRecuentos),
  textposition = "outside",
  hoverinfo = "text",
  hovertext = ~paste0("Gen: ", Gen, "<br>Recuentos: ", comma(TotalRecuentos))
) %>%
  layout(
    title = "Top 20 genes más expresados",
    xaxis = list(
      title = "Recuentos totales",
      range = c(0, max(top_genes_20_df$TotalRecuentos) * 1.2),
      separatethousands = TRUE
    ),
    yaxis = list(
      title = "Gen",
      automargin = TRUE,
      tickfont = list(size = 10)
    ),
    margin = list(l = 100, t = 80, r = 40),
    autosize = TRUE
  )






#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# 5.1.5. Distribución de expresión por muestra (boxplot log10 RPKM)
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

# Convertir a formato largo
matriz_RPKM_long <- matriz_RPKM |>
  rownames_to_column("gene") |>
  pivot_longer(-gene, names_to = "muestra", values_to = "recuento")

# Filtrar recuentos mayores que cero antes de graficar
matriz_RPKM_long_filtrado <- matriz_RPKM_long |>
  filter(recuento > 0)


# Hacer el left join con targets para añadir la columna 'Type' como 'condicion'
matriz_RPKM_long_filtrado <- matriz_RPKM_long_filtrado %>%
  mutate(muestra_clean = str_remove(muestra, "_nat$")) %>%
  select(-muestra) %>%
  rename(muestra = muestra_clean) %>%
  left_join(targets %>% select(Filename, Type), by = c("muestra" = "Filename")) %>%
  rename(condicion = Type)


# Boxplot con color por condición
p <- ggplot(matriz_RPKM_long_filtrado, aes(x = muestra, y = recuento, fill = condicion)) +
  geom_boxplot(outlier.size = 0.4, alpha = 0.8, color = "black") +
  scale_y_log10() +
  scale_fill_brewer(palette = "Set1") +
  labs(
    title = "Distribución logarítmica de recuentos por muestra",
    subtitle = "Cada boxplot representa los niveles de expresión génica (log10) por muestra",
    x = "Muestra",
    y = "Recuento (log10)",
    fill = "Condición"
  ) +
  theme_minimal(base_size = 13) +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    legend.position = "bottom"
  )

# Convertir a interactivo
ggplotly(p)


# Gráfico: distribución logarítmica de recuentos por muestra (boxplot)
plot_ly(
  data = matriz_RPKM_long_filtrado,
  x = ~muestra,
  y = ~recuento,
  color = ~condicion,
  colors = "Set2",
  type = "box",
  boxpoints = "outliers",
  marker = list(size = 3, opacity = 0.5, line = list(width = 0)),
  line = list(color = "black"),
  opacity = 0.8
) %>%
  layout(
    title = list(
      text = "Distribución logarítmica de recuentos por muestra<br><sub>Cada boxplot representa los niveles de expresión génica (log10) por muestra</sub>",
      y = 0.95
    ),
    xaxis = list(
      title = "Muestra",
      tickangle = -45,
      tickfont = list(size = 10)
    ),
    yaxis = list(
      title = "Recuento (log10)",
      type = "log",
      separatethousands = TRUE
    ),
    legend = list(
      orientation = "h",
      x = 0.5,
      y = -0.52,
      xanchor = "center"
    ),
    margin = list(t = 100, b = 170),
    autosize = TRUE
  )






#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# 5.1.6. Comparación entre recuentos crudos y datos normalizados
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

# Asegurarse de que las matrices de recuentos crudos y RPKM están disponibles
his_ReadCount_ruta <- file.path(params$ruta_proyecto, "Analisis", params$nombre_experimento, "Readcount_results", "his-ReadCount.tab")
counts_raw <- read.delim(his_ReadCount_ruta, row.names = 1)

ruta_experimento_RPKM <- file.path(params$ruta_proyecto, "Resultados", params$nombre_experimento, experimento_RPKM)
counts_rpkm <- read.table(ruta_experimento_RPKM, header = TRUE, fill = TRUE, stringsAsFactors = FALSE)
rownames(counts_rpkm) <- counts_rpkm[[1]]
counts_rpkm <- counts_rpkm[, -1]


# Asegurarse de que las columnas de recuentos crudos y RPKM coinciden
colnames(counts_raw) <- gsub("_nat$", "", colnames(counts_raw))
  
  
# Prepara data en formato largo y limpia el nombre de muestra
df_raw <- counts_raw %>%
  as.data.frame() %>%
  rownames_to_column("gene") %>%
  pivot_longer(-gene, names_to = "sample", values_to = "value") %>%
  mutate(type = "Crudo")

df_rpkm <- counts_rpkm %>%
  as.data.frame() %>%
  rownames_to_column("gene") %>%
  pivot_longer(-gene, names_to = "sample", values_to = "value") %>%
  mutate(type = "RPKM")


# Combina y filtra ceros para log10
df_combined <- bind_rows(df_raw, df_rpkm) %>%
  filter(value > 0) %>%
  mutate(log_value = log10(value))


# Convertir el factor para asegurar orden y color consistente
df_combined <- df_combined %>%
  mutate(
    sample = factor(sample, levels = unique(sample)),
    type = factor(type)
  )

plot_ly(df_combined, x = ~sample, y = ~log_value, color = ~type, colors = "Set2", type = "box") %>%
  layout(
    title = "Distribución log10(Expresión) por muestra y tipo de dato",
    xaxis = list(title = "Muestra", tickangle = -45),
    yaxis = list(title = "log10(Expresión)"),
    legend = list(title = list(text = "<b>Tipo de dato</b>")),
    boxmode = "group"
  )



# Obtener genes comunes entre ambas matrices
genes_comunes <- intersect(rownames(counts_raw), rownames(counts_rpkm))

# Subconjuntos alineados por gene
raw_mat <- counts_raw[genes_comunes, ]
rpkm_mat <- counts_rpkm[genes_comunes, ]

# Seleccionar una muestra
sample_to_plot <- colnames(raw_mat)[1]

# Crear el data frame para el scatter plot incluyendo el nombre del gen
df_scatter <- tibble(
  gene = genes_comunes,
  log_raw = log10(raw_mat[[sample_to_plot]] + 1),
  log_rpkm = log10(rpkm_mat[[sample_to_plot]] + 1)
)


# Rango para la línea de identidad (y = x)
rango <- range(c(df_scatter$log_raw, df_scatter$log_rpkm))

# Visualización interactiva con plotly
plot_ly() %>%
  add_trace(
    data = df_scatter,
    x = ~log_raw,
    y = ~log_rpkm,
    type = 'scatter',
    mode = 'markers',
    text = ~paste("Gen:", gene),
    marker = list(
      size = 5,
      opacity = 0.8,
      color = 'rgba(100, 149, 237, 0.6)'
    ),
    name = "Genes"
  ) %>%
  add_lines(
    x = rango,
    y = rango,
    line = list(color = "red", dash = "dash"),
    showlegend = FALSE,
    inherit = FALSE  # Muy importante para evitar heredar el `df_scatter`
  ) %>%
  layout(
    title = list(
      text = glue("Recuentos crudos vs RPKM ({sample_to_plot})"),
      x = 0.5
    ),
    xaxis = list(title = "log10(Conteo crudo + 1)"),
    yaxis = list(title = "log10(RPKM + 1)"),
    plot_bgcolor = "#ffffff",
    paper_bgcolor = "#ffffff"
  )



# Asegurarse de que ambos objetos tienen los mismos genes en el mismo orden
common_genes <- intersect(rownames(counts_raw), rownames(counts_rpkm))
counts_raw_filt <- counts_raw[common_genes, ]
counts_rpkm_filt <- counts_rpkm[common_genes, ]

# Calcular la correlación de Pearson por muestra
library(purrr)
library(tibble)
library(ggplot2)

df_cor <- tibble(
  sample = colnames(counts_raw_filt),
  correlation = map_dbl(colnames(counts_raw_filt), ~ cor(counts_raw_filt[[.x]], counts_rpkm_filt[[.x]], method = "pearson"))
)


plot_ly(
  data = df_cor,
  x = ~sample,
  y = ~correlation,
  type = "bar",
  marker = list(color = "#3E8E7E")
) %>%
  layout(
    title = list(text = "Correlación entre conteos crudos y RPKM por muestra", x = 0.5),
    yaxis = list(title = "Correlación de Pearson", range = c(0, 1)),
    xaxis = list(title = "", tickangle = -45),
    plot_bgcolor = "#ffffff",
    paper_bgcolor = "#ffffff"
  )








#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# 5.3. Análisis de expresión diferencial
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

# Ruta donde están los resultados de DEG y volcano
ruta_resultados_experimento <- file.path(params$ruta_proyecto, "Resultados", params$nombre_experimento)
resultados_experimento <- basename(ruta_resultados_experimento)

# Buscar archivos .xlsx y .pdf
archivos_deg <- list.files(ruta_resultados_experimento, pattern = "^DEG_.*\\.xlsx$", full.names = TRUE)
archivos_volcano <- list.files(ruta_resultados_experimento, pattern = "^Volcano_plot_.*\\.pdf$", full.names = TRUE)

file_archivos_deg  <- gsub(" ", "%20", paste0("file:///", archivos_deg))
file_archivos_volcano  <- gsub(" ", "%20", paste0("file:///", archivos_volcano))

# Extraer nombres base de comparación
comparaciones <- gsub("^DEG_(.*)\\.xlsx$", "\\1", basename(archivos_deg))
comparaciones <- gsub("_", " ", comparaciones)


# Verificar si hay archivos
if (length(comparaciones) == 0) {
  cat('<p><em>No se encontraron archivos de expresión diferencial en la ruta especificada.</em></p>\n')
} else {
  cat("<ol>\n")  # Comenzar lista numerada
  
  for (i in seq_along(comparaciones)) {
    cat(glue::glue('
      <li>
        <strong>{comparaciones[i]}</strong>
        <ul style="margin-top: 4px; margin-bottom: 4px;">
          <li style="margin: 0;">📄 <a href="{file_archivos_deg[i]}" target="_blank">Tabla de resultados (.xlsx)</a></li>
          <li style="margin: 0;">📊 <a href="{file_archivos_volcano[i]}" target="_blank">Volcano plot (.pdf)</a></li>
        </ul>
      </li>\n\n'))
  }
  
  cat("</ol>\n")  # Cerrar lista numerada
}





#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# 5.3.X. Comparación X
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

library(readxl)
library(DT)
library(htmltools)
library(glue)

secciones <- tagList()  # Contenedor general

for (i in seq_along(archivos_deg)) {
  # Leer archivo de DEG
  deg_data <- readxl::read_excel(
    archivos_deg[i],
    col_types = c("text", "text", "numeric", "numeric", "numeric", "numeric", "numeric")
  )
  deg_data <- as.data.frame(deg_data)
  rownames(deg_data) <- deg_data$Gene
  deg_data$Gene <- NULL
  deg_data$Description <- NULL
  
  # Crear contenido HTML para esta comparación
  seccion <- tagList(
    HTML(glue('
      <div class="titulo3" id="tab2-seccion5.3.{i}">
        5.3.{i}. Comparación: {comparaciones[i]}
      </div>
    ')),
    
    HTML(glue('
      <p>
        En esta sección se presentan los resultados obtenidos para la comparación <strong>{comparaciones[i]}</strong>, realizada como parte del análisis de expresión diferencial dentro del experimento. Esta comparación permite identificar los genes cuya actividad transcripcional varía significativamente entre las dos condiciones biológicas o experimentales evaluadas, lo cual puede reflejar cambios funcionales relevantes o mecanismos de regulación diferencial.
      </p>

      <p>
        Para cada gen analizado, se han calculado métricas estadísticas clave como el logaritmo en base 2 del cambio en la expresión (<em>logFC</em>), la abundancia media expresada como <em>logCPM</em> (log counts per million), el valor p crudo y su correspondiente valor ajustado por tasa de falsos descubrimientos (<em>FDR</em>). Aquellos genes con valores de <em>FDR</em> por debajo de un umbral determinado (habitualmente <code>0.05</code>) se consideran diferencialmente expresados con significancia estadística.
      </p>

      <p>
        A continuación se presenta una <strong>tabla interactiva</strong> que permite explorar en detalle estos resultados. Esta tabla ofrece funcionalidades como el ordenamiento por columnas, el desplazamiento horizontal y la posibilidad de búsqueda, lo que facilita la identificación de genes de interés según sus niveles de significancia y magnitud del cambio. Además, al estar alineada con el resto de comparaciones, esta visualización contribuye a una comprensión global del comportamiento transcripcional en las distintas condiciones analizadas.
      </p>

      <div style="height: 10px; background-color: transparent;"></div>
    ')),
    
    htmltools::div(
      class = "scroll-y-max-500",
      DT::datatable(
        deg_data,
        options = list(
          scrollX = TRUE,
          paging = FALSE,
          lengthChange = FALSE,
          language = list(url = '//cdn.datatables.net/plug-ins/1.13.4/i18n/es-ES.json')
        ),
        class = 'stripe hover compact'
      ),
      tags$hr()
    ),
    
    HTML(glue('
      <div style="height: 25px; background-color: transparent;"></div>

      <p>
        Como complemento visual a la tabla de resultados, se incluye a continuación el <strong>volcano plot</strong> correspondiente a la comparación <strong>{comparaciones[i]}</strong>. Este gráfico representa la relación entre la magnitud del cambio de expresión (<em>log<sub>2</sub> fold-change</em>, eje X) y la significancia estadística de dicho cambio (−log<sub>10</sub> del valor de <em>FDR</em>, eje Y) para cada gen evaluado.
      </p>

      <p>
        En el gráfico, cada punto representa un gen, y su color indica si ha sido clasificado como diferencialmente expresado según los criterios del análisis. En concreto:
        <ul>
          <li><strong>DEG</strong> (genes diferencialmente expresados): resaltados en un color específico (por ejemplo, rojo o azul), representan genes con cambios de expresión significativos.</li>
          <li><strong>nDEG</strong> (no diferencialmente expresados): mostrados en un color neutro, corresponden a genes que no superan el umbral de significancia estadística.</li>
          <li><strong>threshold</strong>: marca visualmente los puntos de corte establecidos para definir significancia y magnitud del cambio.</li>
        </ul>
      </p>

      <p>
        Este tipo de representación permite una identificación rápida de genes que combinan una alta significancia estadística con un cambio de expresión relevante, facilitando así la priorización de candidatos para análisis funcionales posteriores.
      </p>

      <iframe src="{file_archivos_volcano[i]}" width="100%" height="700px" style="border: 1px solid #ccc; border-radius: 6px;"></iframe>

      <div style="height: 10px; background-color: transparent;"></div>

      <p style="text-align:center;">
        <a href="{file_archivos_volcano[i]}" target="_blank" class="boton-iframe">
          🔍 Ver el documento con el gráfico en una nueva página
        </a>
      </p>

      <div style="height: 15px; background-color: transparent;"></div>
    '))
  )
  
  # Agregar esta sección a la lista general
  secciones <- tagAppendChild(secciones, seccion)
}

# Mostrar todo el contenido al final
browsable(secciones)





############################################################################################
# Histograma o densidad de logFC
############################################################################################

library(ggplot2)
library(plotly)

ggplot(deg_data, aes(x = logFC)) +
  geom_histogram(bins = 50, fill = "#098", color = "white") +
  labs(
    title = "Distribución de log2 Fold Change",
    x = "log2 Fold Change",
    y = "Número de genes"
  ) +
  theme_minimal()


ggplot(deg_data, aes(x = logFC)) +
  geom_density(fill = "#098", alpha = 0.4) +
  labs(
    title = "Densidad del log2 Fold Change",
    x = "log2 Fold Change",
    y = "Densidad"
  ) +
  theme_minimal()


# Suponiendo que `deg_data` es tu data.frame y contiene la columna logFC
plot_ly(
  data = deg_data,
  x = ~logFC,
  type = "histogram",
  nbinsx = 50,
  marker = list(color = "#098", line = list(color = "white", width = 1))
) %>% layout(
  title = "Distribución de log2 Fold Change",
  xaxis = list(title = "log2 Fold Change"),
  yaxis = list(title = "Número de genes"),
  plot_bgcolor = "#ffffff",
  paper_bgcolor = "#ffffff"
)





############################################################################################
# MA Plot (logCPM vs logFC)
############################################################################################

ggplot(deg_data, aes(x = logCPM, y = logFC)) +
  geom_point(alpha = 0.5, color = "gray50") +
  geom_hline(yintercept = 0, linetype = "dashed", color = "red") +
  labs(
    title = "MA Plot",
    x = "logCPM (Nivel medio de expresión)",
    y = "log2 Fold Change"
  ) +
  theme_minimal()


# Scatter plot interactivo
plot_ly(
  data = deg_data,
  x = ~logCPM,
  y = ~logFC,
  type = "scatter",
  mode = "markers",
  marker = list(color = "gray50", opacity = 0.5)
) %>% add_lines(
  x = range(deg_data$logCPM, na.rm = TRUE),
  y = c(0, 0),
  line = list(dash = "dash", color = "red"),
  showlegend = FALSE
) %>% layout(
  title = "MA Plot",
  xaxis = list(title = "logCPM (Nivel medio de expresión)"),
  yaxis = list(title = "log2 Fold Change"),
  plot_bgcolor = "#ffffff",
  paper_bgcolor = "#ffffff"
)





############################################################################################
# Número de genes DEG vs no-DEG
############################################################################################

library(dplyr)
library(ggplot2)

# Definir DEG como FDR < 0.05 y |logFC| > 1
deg_data$grupo <- ifelse(
  deg_data$FDR < 0.05 & abs(deg_data$logFC) > 1,
  "DEG",
  "no-DEG"
)

# Contar número de genes por grupo (DEG vs no-DEG)
deg_summary <- deg_data %>%
  mutate(grupo = ifelse(FDR < 0.05 & abs(logFC) > 1, "DEG", "no-DEG")) %>%
  count(grupo)


deg_data %>%
  count(grupo) %>%
  ggplot(aes(x = grupo, y = n, fill = grupo)) +
  geom_bar(stat = "identity") +
  labs(
    title = "Resumen de genes diferencialmente expresados",
    x = "",
    y = "Número de genes"
  ) +
  scale_fill_manual(values = c("DEG" = "#E64B35FF", "no-DEG" = "#4DBBD5FF")) +
  theme_minimal()


# Crear gráfico interactivo de barras
plot_ly(
  data = deg_summary,
  x = ~grupo,
  y = ~n,
  type = "bar",
  color = ~grupo,
  colors = c("DEG" = "#E64B35FF", "no-DEG" = "#4DBBD5FF")
) %>% layout(
  title = "Resumen de genes diferencialmente expresados",
  xaxis = list(title = ""),
  yaxis = list(title = "Número de genes"),
  showlegend = FALSE,
  plot_bgcolor = "#ffffff",
  paper_bgcolor = "#ffffff"
)






############################################################################################
# Top N genes ordenados por FDR o |logFC|
############################################################################################

library(ggplot2)
library(dplyr)

# Seleccionar top 10 genes por FDR
top_genes <- deg_data %>%
  mutate(Gene = rownames(.)) %>%
  arrange(FDR) %>%
  slice_head(n = 10)

# Reordenar niveles del factor para presentación en orden descendente
top_genes$Gene <- factor(top_genes$Gene, levels = rev(top_genes$Gene))

# Agregar variable lógica para dirección del logFC
top_genes <- top_genes %>%
  mutate(direction = logFC > 0)


ggplot(top_genes, aes(x = Gene, y = logFC, fill = logFC > 0)) +
  geom_col() +
  coord_flip() +
  labs(
    title = "Top 10 genes más significativos",
    x = "Gen",
    y = "log2 Fold Change"
  ) +
  scale_fill_manual(values = c("TRUE" = "#4c9", "FALSE" = "#d55")) +
  theme_minimal() +
  theme(legend.position = "none")


# Crear gráfico de barras horizontales
plot_ly(
  data = top_genes,
  x = ~logFC,
  y = ~Gene,
  type = "bar",
  orientation = "h",
  marker = list(color = ifelse(top_genes$direction, "#4c9", "#d55"))
) %>% layout(
  title = "Top 10 genes más significativos",
  xaxis = list(title = "log2 Fold Change"),
  yaxis = list(title = "Gen"),
  showlegend = FALSE,
  plot_bgcolor = "#ffffff",
  paper_bgcolor = "#ffffff"
)








#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# 5.4. Análisis funcional y enriquecimiento
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

library(stringr)

# Ruta donde están los resultados de enriquecimiento
ruta_enrichment <- file.path(params$ruta_proyecto, "Resultados", params$nombre_experimento, "Enrichment")

# Archivos
archivos_enrichment <- list.files(ruta_enrichment, pattern = "^Enrichment_.*\\.(pdf|xls)$", full.names = TRUE)

# Extraer categoría funcional y comparación
info_archivos <- str_match(
  basename(archivos_enrichment),
  "^Enrichment_((?:GO_(?:BP|CC|MF)|KEGG))_([^_]+_vs_[^_]+)_"
)

# Crear un data.frame con columnas útiles
df_info <- data.frame(
  ruta_archivo = archivos_enrichment,
  file_ruta_archivo = gsub(" ", "%20", paste0("file:///", archivos_enrichment)),
  categoria_funcional = info_archivos[,2],
  comparacion = info_archivos[,3],
  tipo = tools::file_ext(archivos_enrichment),
  stringsAsFactors = FALSE
)

# Reemplazar "_" por ":" en la columna 'categoria_funcional'
df_info$categoria_funcional <- str_replace_all(df_info$categoria_funcional, "_", ":")

# Reemplazar "_" por " " en la columna 'comparacion'
df_info$comparacion <- str_replace_all(df_info$comparacion, "_", " ")


# Verificar si hay archivos
if (nrow(df_info) == 0) {
  cat('<p><em>No se encontraron archivos de enriquecimiento funcional en la ruta especificada.</em></p>\n')
} else {
  cat("<ol>\n")  # Lista numerada de comparaciones
  
  for (comp in unique(df_info$comparacion)) {
    cat(glue::glue('<li><strong>{comp}</strong>\n<ul style="margin-top: 4px; margin-bottom: 4px;">\n'))
    
    # Filtrar archivos de esta comparación
    subset_comp <- df_info[df_info$comparacion == comp, ]
    
    for (cat in unique(subset_comp$categoria_funcional)) {
      subset_cat <- subset_comp[subset_comp$categoria_funcional == cat, ]
      
      # Obtener rutas
      file_ruta_archivo_xls <- subset_cat$file_ruta_archivo[subset_cat$tipo == "xls"]
      file_ruta_archivo_pdf <- subset_cat$file_ruta_archivo[subset_cat$tipo == "pdf"]
      
      # Mostrar si existen
      cat(glue::glue('<li style="margin: 0;"><strong>{cat}</strong>\n<ul style="margin: 0 0 4px 12px;">\n'))
      if (length(file_ruta_archivo_xls)) {
        cat(glue::glue('<li style="margin: 0;">📄 <a href="{file_ruta_archivo_xls}" target="_blank">Tabla de resultados (.xls)</a></li>\n'))
      }
      if (length(file_ruta_archivo_pdf)) {
        cat(glue::glue('<li style="margin: 0;">📊 <a href="{file_ruta_archivo_pdf}" target="_blank">Gráfico resumen (.pdf)</a></li>\n'))
      }
      cat('</ul></li>\n')
    }
    
    cat("</ul></li>\n\n")
  }
  
  cat("</ol>\n")  # Fin lista numerada
}






#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# 5.4.X. Comparación X
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

library(readxl)
library(DT)
library(htmltools)
library(glue)
library(ggplot2)
library(plotly)
library(dplyr)

secciones <- tagList()  # Contenedor general

comparaciones <- unique(df_info$comparacion)

for (comp in comparaciones) {
  # Título general de la comparación
  seccion_comp <- tagList(
    HTML(glue('
      <div class="titulo2" id="comp-{comp}">
        Comparación: {comp}
      </div>
    '))
  )
  
  # Subset para esta comparación
  subset_comp <- df_info[df_info$comparacion == comp, ]
  
  for (categ in unique(subset_comp$categoria_funcional)) {
    subset_categ <- subset_comp[subset_comp$categoria_funcional == categ, ]
    
    # Rutas relevantes
    ruta_archivo_xls <- subset_categ$ruta_archivo[subset_categ$tipo == "xls"]
    ruta_archivo_pdf <- subset_categ$ruta_archivo[subset_categ$tipo == "pdf"]
    file_ruta_archivo_pdf <- subset_categ$file_ruta_archivo[subset_categ$tipo == "pdf"]
    
    if (length(ruta_archivo_xls) > 0) {
      tmp <- read.csv(ruta_archivo_xls, sep = "\t", row.names = 1, check.names = FALSE)
      if (any(duplicated(rownames(tmp)))) {
        rownames(tmp) <- make.unique(rownames(tmp))
      }
      
      seccion_categ <- tagList(
        HTML(glue('
          <div class="titulo3" id="comp-{comp}-categ-{categ}">
            Categoría funcional: {categ}
          </div>
        ')),
        
        HTML(glue('
          <p>
            Resultados de enriquecimiento funcional para la categoría <strong>{categ}</strong> dentro de la comparación <strong>{comp}</strong>.
          </p>
        ')),
        
        htmltools::div(
          class = "scroll-y-max-500",
          DT::datatable(
            tmp,
            options = list(
              scrollX = TRUE,
              paging = FALSE,
              lengthChange = FALSE,
              language = list(url = '//cdn.datatables.net/plug-ins/1.13.4/i18n/es-ES.json')
            ),
            class = 'stripe hover compact'
          ),
          tags$hr()
        ),
        
        HTML(glue('
          <p>
            Volcano plot generado para visualizar la distribución de significancia y cambio de expresión asociado a los genes de esta categoría.
          </p>
        ')),
        
        if (length(file_ruta_archivo_pdf) > 0) HTML(glue('
          <iframe src="{file_ruta_archivo_pdf}" width="100%" height="600px" style="border: 1px solid #ccc; border-radius: 6px;"></iframe>
          <p style="text-align:center;">
            <a href="{file_ruta_archivo_pdf}" target="_blank" class="boton-iframe">
              🔍 Ver el documento PDF en una nueva pestaña
            </a>
          </p>
        ')) else HTML('<p><em>No se encontró volcano plot para esta categoría.</em></p>')
      )
      
      # Agregar la subsección de categoría a la sección de la comparación
      seccion_comp <- tagAppendChild(seccion_comp, seccion_categ)
    }
  }
  
  # Agregar la sección completa de esta comparación al contenedor principal
  secciones <- tagAppendChild(secciones, seccion_comp)
}

# Mostrar el contenido final en el documento
browsable(secciones)


comparaciones <- unique(df_info$comparacion)
subset_comp <- df_info[df_info$comparacion == comparaciones[1], ]

categorias <- unique(subset_comp$categoria_funcional)
subset_categ <- subset_comp[subset_comp$categoria_funcional == categorias[1], ]

ruta_archivo_xls <- subset_categ$ruta_archivo[subset_categ$tipo == "xls"]
tmp <- read.csv(ruta_archivo_xls, sep = "\t", row.names = 1, check.names = FALSE)




