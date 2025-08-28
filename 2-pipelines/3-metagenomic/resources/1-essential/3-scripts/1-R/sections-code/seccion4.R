#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
# SECCIÓN 4: CUANTIFICACIÓN DE LA EXPRESIÓN GENÉTICA
#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

library(DT)
library(ggplot2)
library(plotly)
library(dplyr)
library(stringr)
library(scales)
library(tidyverse)
library(tidyr)
library(tibble)








#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# 4.3. Exploración preliminar de los recuentos
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ruta_proyecto <- "/Users/adrian/Documents/4 Workspace/Prototipo_resultados/EXT_RNA_Seq"
nombre_experimento <- "mary"

his_ReadCount_ruta <- file.path(ruta_proyecto, "Analisis", nombre_experimento, "Readcount_results", "his-ReadCount.tab")
his_ReadCount <- read.delim(his_ReadCount_ruta, row.names = 1)

his_Size_ruta <- file.path(ruta_proyecto, "Analisis", nombre_experimento, "Readcount_results", "his-Size.tab")
his_Size <- read.delim(his_Size_ruta, row.names = 1)






#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# 4.3.1. Total de lecturas asignadas por muestra
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

# Calcular número total de lecturas asignadas por muestra
total_recuentos_por_muestra <- colSums(his_ReadCount)

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
# 4.3.2. Número de genes expresados por muestra
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

# Calcular número de genes expresados por muestra (genes con recuentos > 0)
genes_expresados_por_muestra <- colSums(his_ReadCount > 0)

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
# 4.3.3. Genes con mayor nivel de expresión total
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

# Obtener los genes con mayor nivel de expresión total (suma por fila)
top_genes<- rowSums(his_ReadCount) |>
  sort(decreasing = TRUE)

top_genes_df <- data.frame(
  Gen = names(top_genes),
  TotalRecuentos = as.integer(top_genes)
)

top_genes_20 <- rowSums(his_ReadCount) |>
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
# 4.3.4. Distribución de recuentos por muestra (boxplot log10)
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

# Convertir a formato largo
his_ReadCount_long <- his_ReadCount |>
  rownames_to_column("gene") |>
  pivot_longer(-gene, names_to = "muestra", values_to = "recuento")

# Filtrar recuentos mayores que cero antes de graficar
his_ReadCount_long_filtrado <- his_ReadCount_long |>
  filter(recuento > 0)


# Hacer el left join con targets para añadir la columna 'Type' como 'condicion'
his_ReadCount_long_filtrado <- his_ReadCount_long_filtrado %>%
  mutate(muestra_clean = str_remove(muestra, "_nat$")) %>%
  select(-muestra) %>%
  rename(muestra = muestra_clean) %>%
  left_join(targets %>% select(Filename, Type), by = c("muestra" = "Filename")) %>%
  rename(condicion = Type)


# Boxplot con color por condición
p <- ggplot(his_ReadCount_long_filtrado, aes(x = muestra, y = recuento, fill = condicion)) +
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
  data = his_ReadCount_long_filtrado,
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
