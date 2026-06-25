#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
# APP SHINY PARA FORMULARIO DE EJECUCIÓN DE PIPELINES
#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# 1. CARGA DE LIBRERÍAS
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

library(shiny)
library(quarto)
library(fs)










#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# 2. DEFINICIÓN DE LA INTERFAZ DE USUARIO (UI)
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

# Permitir subida de archivos grandes (hasta 5 GB)
options(shiny.maxRequestSize = 8000 * 1024^2)

# Definición de la interfaz de usuario
ui <- basicPage(
  tags$head(
    tags$link(rel = "icon", type = "image/png", href = "favicon.png")
  ),

  htmlTemplate(
    filename = "template.html",
    
    # Elementos que se renderizan dinámicamente desde el servidor
    contenido = uiOutput("formulario_inputs"),
    boton = actionButton("run", "Ejecutar Pipeline"),
    mensaje = verbatimTextOutput("mensaje"),
    error = textOutput("error"),
    informe = uiOutput("reportViewer"),
    resultLinks = uiOutput("resultLinks")
  )
)










#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# 3. LÓGICA DEL SERVIDOR
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

# Server: maneja interacción del UI, validaciones y ejecución de pipelines.
server <- function(input, output, session) {

  # Función auxiliar para limpiar comillas simples o dobles al principio y al final
  limpiar_comillas <- function(x) {
    gsub("^['\"]|['\"]$", "", x)
  }
  
  
  
  


  
  
  #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  # 3.1. Inicialización y variables reactivas
  #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  
  # Salidas iniciales (evita "object not found" y contenido residual)
  output$mensaje <- renderText("")  # log/estado visible al usuario
  output$error <- renderText("")  # mensajes de error
  output$reportViewer <- renderUI({})  # contenedor del informe (iframe)
  output$resultLinks <- renderUI({})  # enlace al informe
  
  # Log interno del pipeline
  pipeline_log <- reactiveVal("")

  
  
  
  

  
  
  #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  # 3.2. Renderizado dinámico del formulario de inputs
  #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  
  output$formulario_inputs <- renderUI({
    tagList(
      
      # Nivel 1: Categoría Ómica
      div(class = "form-group tipo-analisis",
          tags$label("Categoría ómica", class = "label-grande"),
          selectInput(
            "categoria_omica", NULL,
            choices = c(
              "Selecciona..." = "",
              "Transcriptómica" = "transcriptomics",
              "Metagenómica" = "metagenomics",
              "Metatranscriptómica" = "metatranscriptomics"
            )
          )
      ),
    
      # Nivel 2: Transcriptómica
      conditionalPanel(
        condition = "input.categoria_omica == 'transcriptomics'",
        div(class = "form-group tipo-analisis",
            tags$label("Tipo de análisis", class = "label-grande"),
            selectInput(
              "tipo_analisis_trans", NULL,
              choices = c(
                "Selecciona..." = "",
                "Bulk RNA-Seq" = "trans_bulk",
                "Single-Cell RNA-Seq" = "trans_sc",
                "Transcriptómica Espacial" = "trans_st"
              )
            )
        )
      ),
      
      # Nivel 2: Metagenómica
      conditionalPanel(
        condition = "input.categoria_omica == 'metagenomics'",
        div(class = "form-group tipo-analisis",
            tags$label("Tipo de análisis", class = "label-grande"),
            selectInput(
              "tipo_analisis_metagen", NULL,
              choices = c(
                "Selecciona..." = "",
                "Shotgun" = "metagen_shotgun",
                "Amplicones" = "metagen_amplicon"
              )
            )
        )
      ),
      
      # Nivel 2: Metatranscriptómica
      conditionalPanel(
        condition = "input.categoria_omica == 'metatranscriptomics'",
        div(class = "form-group tipo-analisis",
            tags$label("Tipo de análisis", class = "label-grande"),
            selectInput(
              "tipo_analisis_metatrans", NULL,
              choices = c(
                "Selecciona..." = "",
                "Shotgun" = "shotgun"
              )
            )
        )
      ),
      
      
      
      



  #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  # 3.3. Validación y estados de inputs
  #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

    ############################################################################################
    # 3.3.1. Transcriptomics - Bulk RNA-Seq
    ############################################################################################
    
    conditionalPanel(
      condition = "input.categoria_omica == 'transcriptomics' && input.tipo_analisis_trans == 'trans_bulk'",
      tagList(
        
        # Path project
        div(class = "form-group inputs-conjuntos",
            tags$label(
              span("Ruta absoluta a la carpeta del proyecto con los resultados generados del análisis"), tags$br(),
              span("(en el caso de usar un contenedor, introducir: /workspace/data/carpeta_proyecto)", 
                    style = "margin-top: 6px; display: inline-block;")
            ),
            textInput(
              "project_path_trans_bulk", label = NULL,
              placeholder = "Ej: /ruta/a/la/carpeta_proyecto"
            ),
            div(style = "min-height: 25px; margin-bottom: 45px;",
                uiOutput("status_project_path_trans_bulk")
            )
        ),
        
        # Experiment name
        div(class = "form-group inputs-conjuntos",
            tags$label("Nombre del experimento específico dentro del directorio del proyecto"),
            textInput(
              "experiment_name_trans_bulk", label = NULL,
              placeholder = "Ej: exp_1"
            ),
            div(style = "min-height: 25px; margin-bottom: 45px;",
                uiOutput("status_experiment_name_trans_bulk")
            )
        ),
        
        # Report language
        div(class = "form-group inputs-conjuntos",
            tags$label("Idioma del informe:"),
            selectInput(
              "report_language_trans_bulk", label = NULL,
              choices = c(
                "Selecciona..." = "",
                "Español" = "1",
                "Inglés" = "2"
              )
            ),
            div(style = "min-height: 25px; margin-bottom: 45px;",
                uiOutput("status_report_language_trans_bulk")
            )
        ),
        
        # Report version
        div(class = "form-group inputs-conjuntos",
            tags$label("Versión del informe:"),
            selectInput(
              "report_version_trans_bulk", label = NULL,
              choices = c(
                "Selecciona..." = "",
                "Completo (Full)" = "1",
                "Resumido (Compact)" = "2"
              )
            ),
            div(style = "min-height: 25px; margin-bottom: 45px;",
                uiOutput("status_report_version_trans_bulk")
            )
        ),
        
        # CSS para validación visual
        tags$style(HTML("
        .valido {
          color: green;
          font-size: 11px;
          font-weight: normal;
        }
        .error {
          color: red;
          font-size: 11px;
          font-weight: normal;
        }
      "))
      )
    ),

      
      
      

        
    ############################################################################################
    # 3.3.2. Transcriptomics - Single-Cell RNA-Seq
    ############################################################################################
    
    conditionalPanel(
      condition = "input.categoria_omica == 'transcriptomics' && input.tipo_analisis_trans == 'trans_sc'",
      tagList(
        
        # Path project
        div(class = "form-group inputs-conjuntos",
            tags$label(
              span("Ruta absoluta a la carpeta del proyecto con los resultados generados del análisis"), tags$br(),
              span("(en el caso de usar un contenedor, introducir: /workspace/data/carpeta_proyecto)", 
                    style = "margin-top: 6px; display: inline-block;")
            ),
            textInput(
              "project_path_trans_sc", label = NULL,
              placeholder = "Ej: /ruta/a/la/carpeta_proyecto"
            ),
            div(style = "min-height: 25px; margin-bottom: 45px;",
                uiOutput("status_project_path_trans_sc")
            )
        ),
        
        # Report language
        div(class = "form-group inputs-conjuntos",
            tags$label("Idioma del informe:"),
            selectInput(
              "report_language_trans_sc", label = NULL,
              choices = c(
                "Selecciona..." = "",
                "Español" = "1",
                "Inglés" = "2"
              )
            ),
            div(style = "min-height: 25px; margin-bottom: 45px;",
                uiOutput("status_report_language_trans_sc")
            )
        ),
        
        # Report version
        div(class = "form-group inputs-conjuntos",
            tags$label("Versión del informe:"),
            selectInput(
              "report_version_trans_sc", label = NULL,
              choices = c(
                "Selecciona..." = "",
                "Completo (Full)" = "1",
                "Resumido (Compact)" = "2"
              )
            ),
            div(style = "min-height: 25px; margin-bottom: 45px;",
                uiOutput("status_report_version_trans_sc")
            )
        ),
        
        # CSS para validación visual
        tags$style(HTML("
        .valido {
          color: green;
          font-size: 11px;
          font-weight: normal;
        }
        .error {
          color: red;
          font-size: 11px;
          font-weight: normal;
        }
      "))
      )
    ),






    ############################################################################################
    # 3.3.3. Transcriptomics - Spatial RNA-Seq
    ############################################################################################
    
    conditionalPanel(
      condition = "input.categoria_omica == 'transcriptomics' && input.tipo_analisis_trans == 'trans_st'",
      tagList(
        
        # Path project
        div(class = "form-group inputs-conjuntos",
            tags$label(
              span("Ruta absoluta a la carpeta del proyecto con los resultados generados del análisis"), tags$br(),
              span("(en el caso de usar un contenedor, introducir: /workspace/data/carpeta_proyecto)", 
                    style = "margin-top: 6px; display: inline-block;")
            ),
            textInput(
              "project_path_trans_st", label = NULL,
              placeholder = "Ej: /ruta/a/la/carpeta_proyecto"
            ),
            div(style = "min-height: 25px; margin-bottom: 45px;",
                uiOutput("status_project_path_trans_st")
            )
        ),

        # Technology
        div(class = "form-group inputs-conjuntos",
            tags$label("Tecnología de captura:"),
            selectInput(
              "technology_trans_st", label = NULL,
              choices = c(
                "Selecciona..." = "",
                "VisiumHD" = "1",
                "Stereo-Seq" = "2"
              )
            ),
            div(style = "min-height: 25px; margin-bottom: 45px;",
                uiOutput("status_technology_trans_st")
            )
        ),

        # Report language
        div(class = "form-group inputs-conjuntos",
            tags$label("Idioma del informe:"),
            selectInput(
              "report_language_trans_st", label = NULL,
              choices = c(
                "Selecciona..." = "",
                "Español" = "1",
                "Inglés" = "2"
              )
            ),
            div(style = "min-height: 25px; margin-bottom: 45px;",
                uiOutput("status_report_language_trans_st")
            )
        ),
        
        # Report version
        div(class = "form-group inputs-conjuntos",
            tags$label("Versión del informe:"),
            selectInput(
              "report_version_trans_st", label = NULL,
              choices = c(
                "Selecciona..." = "",
                "Completo (Full)" = "1",
                "Resumido (Compact)" = "2"
              )
            ),
            div(style = "min-height: 25px; margin-bottom: 45px;",
                uiOutput("status_report_version_trans_st")
            )
        ),
        
        # CSS para validación visual
        tags$style(HTML("
        .valido {
          color: green;
          font-size: 11px;
          font-weight: normal;
        }
        .error {
          color: red;
          font-size: 11px;
          font-weight: normal;
        }
      "))
      )
    ),






    ############################################################################################
    # 3.3.4. Metagenomics - Shotgun
    ############################################################################################
    
    conditionalPanel(
      condition = "input.categoria_omica == 'metagenomics' && input.tipo_analisis_metagen == 'metagen_shotgun'",
      tagList(
        
        # Path project
        div(class = "form-group inputs-conjuntos",
            tags$label(
              span("Ruta absoluta a la carpeta del proyecto con los resultados generados del análisis"), tags$br(),
              span("(en el caso de usar un contenedor, introducir: /workspace/data/carpeta_proyecto)", 
                    style = "margin-top: 6px; display: inline-block;")
            ),
            textInput(
              "project_path_metagen_shotgun", label = NULL,
              placeholder = "Ej: /ruta/a/la/carpeta_proyecto"
            ),
            div(style = "min-height: 25px; margin-bottom: 45px;",
                uiOutput("status_project_path_metagen_shotgun")
            )
        ),

        # Report language
        div(class = "form-group inputs-conjuntos",
            tags$label("Idioma del informe:"),
            selectInput(
              "report_language_metagen_shotgun", label = NULL,
              choices = c(
                "Selecciona..." = "",
                "Español" = "1",
                "Inglés" = "2"
              )
            ),
            div(style = "min-height: 25px; margin-bottom: 45px;",
                uiOutput("status_report_language_metagen_shotgun")
            )
        ),
        
        # Report version
        div(class = "form-group inputs-conjuntos",
            tags$label("Versión del informe:"),
            selectInput(
              "report_version_metagen_shotgun", label = NULL,
              choices = c(
                "Selecciona..." = "",
                "Completo (Full)" = "1",
                "Resumido (Compact)" = "2"
              )
            ),
            div(style = "min-height: 25px; margin-bottom: 45px;",
                uiOutput("status_report_version_metagen_shotgun")
            )
        ),
        
        # CSS para validación visual
        tags$style(HTML("
        .valido {
          color: green;
          font-size: 11px;
          font-weight: normal;
        }
        .error {
          color: red;
          font-size: 11px;
          font-weight: normal;
        }
      "))
      )
    ),






    ############################################################################################
    # 3.3.5. Metagenomics - Amplicones
    ############################################################################################
    
    conditionalPanel(
      condition = "input.categoria_omica == 'metagenomics' && input.tipo_analisis_metagen == 'metagen_amplicon'",
      tagList(
        
        # Path project
        div(class = "form-group inputs-conjuntos",
            tags$label(
              span("Ruta absoluta a la carpeta del proyecto con los resultados generados del análisis"), tags$br(),
              span("(en el caso de usar un contenedor, introducir: /workspace/data/carpeta_proyecto)", 
                    style = "margin-top: 6px; display: inline-block;")
            ),
            textInput(
              "project_path_metagen_amplicon", label = NULL,
              placeholder = "Ej: /ruta/a/la/carpeta_proyecto"
            ),
            div(style = "min-height: 25px; margin-bottom: 45px;",
                uiOutput("status_project_path_metagen_amplicon")
            )
        ),
        
        # Amplicon type
        div(class = "form-group inputs-conjuntos",
            tags$label("Tipo de análisis de amplicones:"),
            selectInput(
              "amplicon_type_metagen_amplicon", label = NULL,
              choices = c(
                "Selecciona..." = "",
                "16S" = "1",
                "18S" = "2",
                "ITS" = "3",
                "16S, 18S" = "4",
                "18S, ITS" = "5",
                "16S, ITS" = "6",
                "16S, 18S, ITS" = "7"
              )
            ),
            div(style = "min-height: 25px; margin-bottom: 45px;",
                uiOutput("status_amplicon_type_metagen_amplicon")
            )
        ),
        
        # Report language
        div(class = "form-group inputs-conjuntos",
            tags$label("Idioma del informe:"),
            selectInput(
              "report_language_metagen_amplicon", label = NULL,
              choices = c(
                "Selecciona..." = "",
                "Español" = "1",
                "Inglés" = "2"
              )
            ),
            div(style = "min-height: 25px; margin-bottom: 45px;",
                uiOutput("status_report_language_metagen_amplicon")
            )
        ),
        
        # Report version
        div(class = "form-group inputs-conjuntos",
            tags$label("Versión del informe:"),
            selectInput(
              "report_version_metagen_amplicon", label = NULL,
              choices = c(
                "Selecciona..." = "",
                "Completo (Full)" = "1",
                "Resumido (Compact)" = "2"
              )
            ),
            div(style = "min-height: 25px; margin-bottom: 45px;",
                uiOutput("status_report_version_metagen_amplicon")
            )
        ),
        
        # CSS para validación visual
        tags$style(HTML("
        .valido {
          color: green;
          font-size: 11px;
          font-weight: normal;
        }
        .error {
          color: red;
          font-size: 11px;
          font-weight: normal;
        }
      "))
      )
    ),






    ############################################################################################
    # 3.3.6. Metatranscriptomics - Shotgun
    ############################################################################################
    
    conditionalPanel(
      condition = "input.categoria_omica == 'metatranscriptomics' && input.tipo_analisis_metatrans == 'metatrans_shotgun'",
      tagList(
        
        # Path project
        div(class = "form-group inputs-conjuntos",
            tags$label(
              span("Ruta absoluta a la carpeta del proyecto con los resultados generados del análisis"), tags$br(),
              span("(en el caso de usar un contenedor, introducir: /workspace/data/carpeta_proyecto)", 
                    style = "margin-top: 6px; display: inline-block;")
            ),
            textInput(
              "project_path_metatrans_shotgun", label = NULL,
              placeholder = "Ej: /ruta/a/la/carpeta_proyecto"
            ),
            div(style = "min-height: 25px; margin-bottom: 45px;",
                uiOutput("status_project_path_metatrans_shotgun")
            )
        ),

        # Report language
        div(class = "form-group inputs-conjuntos",
            tags$label(
              span("Versión del informe:"), tags$br(),
              span("(1: Español | 2: Inglés)", 
                    style = "margin-top: 6px; display: inline-block;")
            ),
            textInput(
              "report_language_metatrans_shotgun", label = NULL,
              placeholder = "Ej: 1"
            ),
            div(style = "min-height: 25px; margin-bottom: 45px;",
                uiOutput("status_report_language_metatrans_shotgun")
            )
        ),
        
        # Report version
        div(class = "form-group inputs-conjuntos",
            tags$label(
              span("Versión del informe:"), tags$br(),
              span("(1: Full | 2: Compact)", 
                    style = "margin-top: 6px; display: inline-block;")
            ),
            textInput(
              "report_version_metatrans_shotgun", label = NULL,
              placeholder = "Ej: 1"
            ),
            div(style = "min-height: 25px; margin-bottom: 45px;",
                uiOutput("status_report_version_metatrans_shotgun")
            )
        )
      )
    )

  )
})








  #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  # 3.4. Renderizado de mensajes y reportes iniciales
  #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  
    ############################################################################################
    # 3.4.1. Transcriptomics - Bulk RNA-Seq
    ############################################################################################
    
    observeEvent(
      {
        input$project_path_trans_bulk
        input$experiment_name_trans_bulk
        input$report_language_trans_bulk
        input$report_version_trans_bulk
      },
      {
        req(input$project_path_trans_bulk, input$experiment_name_trans_bulk, input$report_language_trans_bulk, input$report_version_trans_bulk)
        ruta <- limpiar_comillas(input$project_path_trans_bulk)
        exp  <- limpiar_comillas(input$experiment_name_trans_bulk)
        
        rutas_esperadas <- c(
          paste0("Analisis/", exp, "/Pre_fastqc_results"),
          paste0("Analisis/", exp, "/hisat2_results"),
          paste0("Analisis/", exp, "/hisat2_index"),
          paste0("Analisis/", exp, "/Readcount_results"),
          paste0("Analisis/reads_down_select_", exp),
          paste0("Resultados/targets_", exp, ".txt"),
          paste0("Resultados/", exp, "/", exp, "_QC.pdf"),
          paste0("Resultados/", exp, "/", exp, "_RPKM.xls"),
          paste0("Resultados/", exp, "/Enrichment")
        )
        
        existen <- sapply(file.path(ruta, rutas_esperadas), file.exists)
        
        if (all(existen)) {
          output$status_project_path_trans_bulk <- renderUI({
            tags$span(class = "valido", HTML("✅ Ruta y nombre de experimento válidos.<br>Todos los archivos requeridos presentes."))
          })
        } else {
          faltantes <- rutas_esperadas[!existen]
          output$status_project_path_trans_bulk <- renderUI({
            tags$span(class = "error", HTML(paste0("❌ Faltan elementos:<br><code>", paste(faltantes, collapse = "<br>"), "</code>")))
          })
        }
      }
    )






    ############################################################################################
    # 3.4.2. Transcriptomics - Single-Cell RNA-Seq
    ############################################################################################
    
    observeEvent(
      {
        input$project_path_trans_sc
        input$report_language_trans_sc
        input$report_version_trans_sc
      },
      {
        req(input$project_path_trans_sc, input$report_language_trans_sc, input$report_version_trans_sc)
        ruta <- limpiar_comillas(input$project_path_trans_sc)
        
        rutas_esperadas <- c(
          paste0("analysis/", "01_qc"),
          paste0("analysis/", "02_dim_reduction"),
          paste0("analysis/", "03_clustering"),
          paste0("analysis/", "04_markers"),
          paste0("analysis/", "05_cell_annotation"),
          paste0("analysis/", "06_population_aggregation"),
          paste0("analysis/", "07_deg_conditions"),
          paste0("analysis/", "08_enrichment"),
          paste0("analysis/", "09_extra"),
          paste0("data/", "01_raw_blc"),
          paste0("data/", "02_genome"),
          paste0("data/", "03_alignment_outputs"),
          paste0("data/", "04_processed_objects"),
          paste0("data/", "05_resources"),
          paste0("scripts/", "01_main"),
          paste0("scripts/", "02_functions"),
          paste0("scripts/", "03_extra")
        )
        
        existen <- sapply(file.path(ruta, rutas_esperadas), file.exists)
        
        if (all(existen)) {
          output$status_project_path_trans_sc <- renderUI({
            tags$span(class = "valido", HTML("✅ Rutas y directórios válidos.<br>Todos los archivos requeridos presentes."))
          })
        } else {
          faltantes <- rutas_esperadas[!existen]
          output$status_project_path_trans_sc <- renderUI({
            tags$span(class = "error", HTML(paste0("❌ Faltan elementos:<br><code>", paste(faltantes, collapse = "<br>"), "</code>")))
          })
        }
      }
    )






    ############################################################################################
    # 3.4.3. Transcriptomics - Spatial RNA-Seq
    ############################################################################################
    
    observeEvent(
      {
        input$project_path_trans_st
        input$technology_trans_st
        input$report_language_trans_st
        input$report_version_trans_st
      },
      {
        req(input$project_path_trans_st, input$technology_trans_st, input$report_language_trans_st, input$report_version_trans_st)
        ruta <- limpiar_comillas(input$project_path_trans_st)
        
        rutas_esperadas <- c(
          paste0("analysis/", "01_qc"),
          paste0("analysis/", "02_dim_reduction"),
          paste0("analysis/", "03_clustering"),
          paste0("analysis/", "04_markers"),
          paste0("analysis/", "05_cell_annotation"),
          paste0("analysis/", "06_population_aggregation"),
          paste0("analysis/", "07_deg_conditions"),
          paste0("analysis/", "08_enrichment"),
          paste0("analysis/", "09_extra"),
          paste0("data/", "01_raw_blc"),
          paste0("data/", "02_genome"),
          paste0("data/", "03_images"),
          paste0("data/", "04_spatial_templates"),
          paste0("data/", "05_alignment_outputs"),
          paste0("data/", "06_processed_objects"),
          paste0("data/", "07_resources"),
          paste0("scripts/", "01_main"),
          paste0("scripts/", "02_functions"),
          paste0("scripts/", "03_extra")
        )
        
        existen <- sapply(file.path(ruta, rutas_esperadas), file.exists)
        
        if (all(existen)) {
          output$status_project_path_trans_st <- renderUI({
            tags$span(class = "valido", HTML("✅ Rutas y directórios válidos.<br>Todos los archivos requeridos presentes."))
          })
        } else {
          faltantes <- rutas_esperadas[!existen]
          output$status_project_path_trans_st <- renderUI({
            tags$span(class = "error", HTML(paste0("❌ Faltan elementos:<br><code>", paste(faltantes, collapse = "<br>"), "</code>")))
          })
        }
      }
    )






    ############################################################################################
    # 3.4.4. Metagenomics - Shotgun
    ############################################################################################
    
    observeEvent(
      {
        input$project_path_metagen_shotgun
        input$report_language_metagen_amplicon
        input$report_version_metagen_shotgun
      },
      {
        req(input$project_path_metagen_shotgun, input$report_language_metagen_amplicon, input$report_version_metagen_shotgun)
        ruta <- limpiar_comillas(input$project_path_metagen_shotgun)
        
        rutas_esperadas <- c(
          paste0("analysis/", "completar"),
          paste0("data/", "completar"),
          paste0("scripts/", "completar")
        )
        
        existen <- sapply(file.path(ruta, rutas_esperadas), file.exists)
        
        if (all(existen)) {
          output$status_project_path_metagen_shotgun <- renderUI({
            tags$span(class = "valido", HTML("✅ Rutas y directórios válidos.<br>Todos los archivos requeridos presentes."))
          })
        } else {
          faltantes <- rutas_esperadas[!existen]
          output$status_project_path_metagen_shotgun <- renderUI({
            tags$span(class = "error", HTML(paste0("❌ Faltan elementos:<br><code>", paste(faltantes, collapse = "<br>"), "</code>")))
          })
        }
      }
    )






    ############################################################################################
    # 3.4.5. Metagenomics - Amplicones
    ############################################################################################
    
    observeEvent(
      {
        input$project_path_metagen_amplicon
        input$amplicon_type_metagen_amplicon
        input$report_language_metagen_amplicon
        input$report_version_metagen_amplicon
      },
      {
        req(input$project_path_metagen_amplicon, input$amplicon_type_metagen_amplicon, input$report_language_metagen_amplicon, input$report_version_metagen_amplicon)
        
        ruta <- limpiar_comillas(input$project_path_metagen_amplicon)
        type  <- limpiar_comillas(input$amplicon_type_metagen_amplicon)
        
        tipo_map <- list(
          `1` = c("16S"), `2` = c("18S"), `3` = c("ITS"),
          `4` = c("16S", "18S"), `5` = c("18S", "ITS"),
          `6` = c("16S", "ITS"), `7` = c("16S", "18S", "ITS")
        )
        
        rutas_esperadas <- c(
          file.path("Analisis", "miARma_workflow.ini"),
          file.path("Analisis", "Slurm.sh")
        )
        
        if (!is.null(tipo_map[[as.character(type)]])) {
          targets <- tipo_map[[as.character(type)]]
          for (target in targets) {
            rutas_esperadas <- c(
              rutas_esperadas,
              file.path("Analisis", paste0("miARma_", target), "Pre_fastqc_results"),
              file.path("Resultados", paste0("Def_", target), "core-metrics-results"),
              file.path("Resultados", paste0("Def_", target), "exported")
            )
          }
        }
        
        existen <- sapply(file.path(ruta, rutas_esperadas), file.exists)
        
        if (all(existen)) {
          output$status_project_path_metagen_amplicon <- renderUI({
            tags$span(class = "valido", HTML("✅ Ruta y tipo de análisis válidos.<br>Todos los archivos requeridos están presentes."))
          })
        } else {
          faltantes <- rutas_esperadas[!existen]
          output$status_project_path_metagen_amplicon <- renderUI({
            tags$span(class = "error", HTML(paste0("❌ Faltan elementos:<br><code>", paste(faltantes, collapse = "<br>"), "</code>")))
          })
        }
      }
    )






    ############################################################################################
    # 3.4.6. Metatranscriptomics - Shotgun
    ############################################################################################
    
    observeEvent(
      {
        input$project_path_metatrans_shotgun
        input$report_language_metatrans_shotgun
        input$report_version_metatrans_shotgun
      },
      {
        req(input$project_path_metatrans_shotgun, input$report_language_metatrans_shotgun, input$report_version_metatrans_shotgun)
        ruta <- limpiar_comillas(input$project_path_metatrans_shotgun)
        
        rutas_esperadas <- c(
          paste0("analysis/", "completar"),
          paste0("data/", "completar"),
          paste0("scripts/", "completar")
        )
        
        existen <- sapply(file.path(ruta, rutas_esperadas), file.exists)
        
        if (all(existen)) {
          output$status_project_path_metatrans_shotgun <- renderUI({
            tags$span(class = "valido", HTML("✅ Rutas y directórios válidos.<br>Todos los archivos requeridos presentes."))
          })
        } else {
          faltantes <- rutas_esperadas[!existen]
          output$status_project_path_metatrans_shotgun <- renderUI({
            tags$span(class = "error", HTML(paste0("❌ Faltan elementos:<br><code>", paste(faltantes, collapse = "<br>"), "</code>")))
          })
        }
      }
    )






    ############################################################################################
    # Renderizar
    ############################################################################################

    output$reportViewer <- renderUI({})  # Área para mostrar reporte HTML
    output$resultLinks  <- renderUI({})  # Área para mostrar enlaces a resultados








  #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  # 3.5. Observador principal para ejecución del pipeline
  #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

  observeEvent(input$run, {
    
    cat <- input$categoria_omica
    
    # Determinar el tipo específico dependiendo de la categoría seleccionada
    tipo <- ""
    if (cat == "transcriptomics") {
      tipo <- input$tipo_analisis_trans
    } else if (cat == "metagenomics") {
      tipo <- input$tipo_analisis_metagen
    } else if (cat == "metatranscriptomics") {
      tipo <- input$tipo_analisis_metatrans
    }
    
    # Inicializar estado
    output$error <- renderText({ "" })  # Limpiar mensaje de error
    pipeline_log("")  # Limpiar log previo






    ############################################################################################
    # 3.5.1. Transcriptomics - Bulk RNA-Seq
    ############################################################################################

    if (cat == "transcriptomics" && tipo == "trans_bulk") {
      req(input$project_path_trans_bulk, input$experiment_name_trans_bulk, input$report_language_trans_bulk, input$report_version_trans_bulk)
      
      ruta <- limpiar_comillas(input$project_path_trans_bulk)
      exp <- limpiar_comillas(input$experiment_name_trans_bulk)
      lan <- limpiar_comillas(input$report_language_trans_bulk)
      ver <- limpiar_comillas(input$report_version_trans_bulk)
      
      withProgress(message = "Ejecutando pipeline de Bulk RNA-Seq... \n", value = 0, {
        pipeline_log("Lanzando pipeline con Nextflow...")
        
        app_base <- getwd()
        www_dir <- file.path(app_base, "www")
        www_report_dir <- file.path(app_base, "www", "reports", "01-transcriptomics", "01-bulk-rna-seq")
        pipeline_base <- normalizePath("../02-pipelines/01-transcriptomics/01-bulk-rna-seq", mustWork = TRUE)
        report_dir <- file.path(pipeline_base, "report")
        
        if (!dir.exists(report_dir)) dir.create(report_dir, recursive = TRUE)
        if (!dir.exists(www_dir)) dir.create(www_dir, recursive = TRUE)
        if (!dir.exists(www_report_dir)) dir.create(www_report_dir, recursive = TRUE)
        
        setwd(pipeline_base)
        incProgress(0.2, detail = "Preparando comando")
        system2("chmod", c("+x", "run_pipeline_shiny.sh"))
        
        incProgress(0.3, detail = "Ejecutando Nextflow (esto puede tardar)")
        log_out <- system2("./run_pipeline_shiny.sh", args = c(shQuote(ruta), shQuote(exp), shQuote(lan), shQuote(ver)), stdout = TRUE, stderr = TRUE)
        
        status <- attr(log_out, "status")
        if (is.null(status)) status <- 0
        
        pipeline_log(paste(pipeline_log(), "\n\n--- LOG ---\n", paste(log_out, collapse = "\n")))
        
        path_tmp <- file.path(www_dir, "resources", "03-archives", "02-tmp", "01-transcriptomics", "01-bulk-rna-seq")
        if (!dir.exists(path_tmp)) dir.create(path_tmp, recursive = TRUE)
        writeLines(log_out, file.path(path_tmp, "pipeline_log.txt"))
        
        if (status != 0) {
          output$error <- renderText({ paste0("⚠️ El pipeline falló (status ", status, "). Revisa el log en la salida de la app.") })
          incProgress(1); return()
        }
        

        incProgress(0.8, detail = "Organizando archivos")
        
        if (dir.exists(report_dir)) {
          # 1. Copia original para la web de Shiny
          system2("cp", shQuote(c("-R", paste0(report_dir, "/."), www_report_dir)))
          
          # 2. Nueva copia a la ruta raíz del proyecto del usuario
          project_report_dir <- file.path(ruta, "report")
          
          if (dir.exists(project_report_dir)) {
            unlink(project_report_dir, recursive = TRUE)  # Borra la carpeta previa si existe
          }
          dir.create(project_report_dir, recursive = TRUE)  # Crea la carpeta nueva
          
          # Copia el contenido a la ruta del proyecto
          system2("cp", shQuote(c("-R", paste0(report_dir, "/."), project_report_dir)))
          
          # 3. Renderizado de UI y log adaptado al idioma
          html_file <- if (lan == "1") "index_es.html" else "index_en.html"
          
          output$resultLinks <- renderUI({
            tags$a(href = paste0("reports/01-transcriptomics/01-bulk-rna-seq/", html_file), 
                    target = "_blank", 
                    "Abrir informe HTML en nueva pestaña")
          })
          pipeline_log(paste0(pipeline_log(), "\n\n✅ Informe generado y disponible abajo (copia guardada en la ruta del proyecto)."))
        } else {
          output$error <- renderText("⚠️ La carpeta reports no se encontró después de ejecutar Nextflow.")
        }
        incProgress(1)
      })






    ############################################################################################
    # 3.5.2. Transcriptomics - Single-Cell RNA-Seq
    ############################################################################################

    } else if (cat == "transcriptomics" && tipo == "trans_sc") {
          req(input$project_path_trans_sc, input$report_language_trans_sc, input$report_version_trans_sc)
          
          ruta <- limpiar_comillas(input$project_path_trans_sc)
          lan <- limpiar_comillas(input$report_language_trans_sc)
          ver <- limpiar_comillas(input$report_version_trans_sc)
          
          withProgress(message = "Ejecutando pipeline de Single Cell RNA-Seq... \n", value = 0, {
            pipeline_log("Lanzando pipeline con Nextflow...")
            
            app_base <- getwd()
            www_dir <- file.path(app_base, "www")
            www_report_dir <- file.path(app_base, "www", "reports", "01-transcriptomics", "02-sc-rna-seq")
            pipeline_base <- normalizePath("../02-pipelines/01-transcriptomics/02-sc-rna-seq", mustWork = TRUE)
            report_dir <- file.path(pipeline_base, "report")
            
            if (!dir.exists(report_dir)) dir.create(report_dir, recursive = TRUE)
            if (!dir.exists(www_dir)) dir.create(www_dir, recursive = TRUE)
            if (!dir.exists(www_report_dir)) dir.create(www_report_dir, recursive = TRUE)
            
            setwd(pipeline_base)
            incProgress(0.2, detail = "Preparando comando")
            system2("chmod", c("+x", "run_pipeline_shiny.sh"))
            
            incProgress(0.3, detail = "Ejecutando Nextflow (esto puede tardar)")
            log_out <- system2("./run_pipeline_shiny.sh", args = c(shQuote(ruta), shQuote(lan), shQuote(ver)), stdout = TRUE, stderr = TRUE)
            
            status <- attr(log_out, "status")
            if (is.null(status)) status <- 0
            
            pipeline_log(paste(pipeline_log(), "\n\n--- LOG ---\n", paste(log_out, collapse = "\n")))
            
            path_tmp <- file.path(www_dir, "resources", "03-archives", "02-tmp", "01-transcriptomics", "02-sc-rna-seq")
            if (!dir.exists(path_tmp)) dir.create(path_tmp, recursive = TRUE)
            writeLines(log_out, file.path(path_tmp, "pipeline_log.txt"))
            
            if (status != 0) {
              output$error <- renderText({ paste0("⚠️ El pipeline falló (status ", status, ").") })
              incProgress(1); return()
            }
            

            incProgress(0.8, detail = "Organizando archivos")
            
            if (dir.exists(report_dir)) {
              # 1. Copia original para la web de Shiny
              system2("cp", shQuote(c("-R", paste0(report_dir, "/."), www_report_dir)))
              
              # 2. Nueva copia a la ruta raíz del proyecto del usuario
              project_report_dir <- file.path(ruta, "report")
              
              if (dir.exists(project_report_dir)) {
                unlink(project_report_dir, recursive = TRUE)  # Borra la carpeta previa si existe
              }
              dir.create(project_report_dir, recursive = TRUE)  # Crea la carpeta nueva
              
              # Copia el contenido a la ruta del proyecto
              system2("cp", shQuote(c("-R", paste0(report_dir, "/."), project_report_dir)))
              
              # 3. Renderizado de UI y log adaptado al idioma
              html_file <- if (lan == "1") "index_es.html" else "index_en.html"
              
              output$resultLinks <- renderUI({
                tags$a(href = paste0("reports/01-transcriptomics/02-sc-rna-seq/", html_file), 
                        target = "_blank", 
                        "Abrir informe HTML en nueva pestaña")
              })
              pipeline_log(paste0(pipeline_log(), "\n\n✅ Informe generado y disponible abajo (copia guardada en la ruta del proyecto)."))
            } else {
              output$error <- renderText("⚠️ La carpeta reports no se encontró.")
            }
            incProgress(1)
          })






    ############################################################################################
    # 3.5.3. Transcriptomics - Spatial Transcriptomics
    ############################################################################################
  
    } else if (cat == "transcriptomics" && tipo == "trans_st") {
      req(input$project_path_trans_st, input$technology_trans_st, input$report_language_trans_st, input$report_version_trans_st)
      
      ruta <- limpiar_comillas(input$project_path_trans_st)
      tech <- limpiar_comillas(input$technology_trans_st)
      lan <- limpiar_comillas(input$report_language_trans_st)
      ver <- limpiar_comillas(input$report_version_trans_st)
      
      withProgress(message = "Ejecutando pipeline de Spatial Transcriptomics... \n", value = 0, {
        pipeline_log("Lanzando pipeline con Nextflow...")
        
        app_base <- getwd()
        www_dir <- file.path(app_base, "www")
        www_report_dir <- file.path(app_base, "www", "reports", "01-transcriptomics", "03-st-rna-seq")
        pipeline_base <- normalizePath("../02-pipelines/01-transcriptomics/03-st-rna-seq", mustWork = TRUE)
        report_dir <- file.path(pipeline_base, "report")
        
        if (!dir.exists(report_dir)) dir.create(report_dir, recursive = TRUE)
        if (!dir.exists(www_report_dir)) dir.create(www_report_dir, recursive = TRUE)
        
        setwd(pipeline_base)
        incProgress(0.2, detail = "Preparando comando")
        system2("chmod", c("+x", "run_pipeline_shiny.sh"))
        
        incProgress(0.3, detail = "Ejecutando Nextflow")
        log_out <- system2("./run_pipeline_shiny.sh", args = c(shQuote(ruta), shQuote(lan), shQuote(ver), shQuote(ver)), stdout = TRUE, stderr = TRUE)
        
        status <- attr(log_out, "status")
        if (is.null(status)) status <- 0
        
        pipeline_log(paste(pipeline_log(), "\n\n--- LOG ---\n", paste(log_out, collapse = "\n")))
        
        path_tmp <- file.path(www_dir, "resources", "03-archives", "02-tmp", "01-transcriptomics", "03-st-rna-seq")
        if (!dir.exists(path_tmp)) dir.create(path_tmp, recursive = TRUE)
        writeLines(log_out, file.path(path_tmp, "pipeline_log.txt"))
        
        if (status != 0) {
          output$error <- renderText({ paste0("⚠️ El pipeline falló (status ", status, ").") })
          incProgress(1); return()
        }
        
        
        incProgress(0.8, detail = "Organizando archivos")

        if (dir.exists(report_dir)) {
          # 1. Copia original para la web de Shiny
          system2("cp", shQuote(c("-R", paste0(report_dir, "/."), www_report_dir)))
          
          # 2. Nueva copia a la ruta raíz del proyecto del usuario
          project_report_dir <- file.path(ruta, "report")
          
          if (dir.exists(project_report_dir)) {
            unlink(project_report_dir, recursive = TRUE)  # Borra la carpeta previa si existe
          }
          dir.create(project_report_dir, recursive = TRUE)  # Crea la carpeta nueva
          
          # Copia el contenido a la ruta del proyecto
          system2("cp", shQuote(c("-R", paste0(report_dir, "/."), project_report_dir)))
          
          # 3. Renderizado de UI y log adaptado al idioma
          html_file <- if (lan == "1") "index_es.html" else "index_en.html"
          
          output$resultLinks <- renderUI({
            tags$a(href = paste0("reports/01-transcriptomics/03-st-rna-seq/", html_file), 
                    target = "_blank", 
                    "Abrir informe HTML en nueva pestaña")
          })
          pipeline_log(paste0(pipeline_log(), "\n\n✅ Informe generado y disponible abajo (copia guardada en la ruta del proyecto)."))
        } else {
          # Añadido este 'else' para mantener la consistencia con los anteriores y capturar errores si la carpeta no se crea
          output$error <- renderText("⚠️ La carpeta reports no se encontró.")
        }
        incProgress(1)
      })






    ############################################################################################
    # 3.5.4. Metagenomics - Shotgun
    ############################################################################################
      
    } else if (cat == "metagenomics" && tipo == "metagen_shotgun") {
      # Nota: Corregido el input$report_language_metagen_amplicon a _shotgun en el req()
      req(input$project_path_metagen_shotgun, input$report_language_metagen_shotgun, input$report_version_metagen_shotgun)
      
      ruta <- limpiar_comillas(input$project_path_metagen_shotgun)
      lan <- limpiar_comillas(input$report_language_metagen_shotgun)
      ver <- limpiar_comillas(input$report_version_metagen_shotgun)
      
      withProgress(message = "Ejecutando pipeline de Metagenómica Shotgun... \n", value = 0, {
        pipeline_log("Lanzando pipeline con Nextflow...")
        
        app_base <- getwd()
        www_dir <- file.path(app_base, "www")
        www_report_dir <- file.path(app_base, "www", "reports", "02-metagenomics", "01-shotgun")
        pipeline_base <- normalizePath("../02-pipelines/02-metagenomics/01-shotgun", mustWork = TRUE)
        report_dir <- file.path(pipeline_base, "report")
        
        if (!dir.exists(report_dir)) dir.create(report_dir, recursive = TRUE)
        if (!dir.exists(www_report_dir)) dir.create(www_report_dir, recursive = TRUE)
        
        setwd(pipeline_base)
        incProgress(0.2, detail = "Preparando comando")
        system2("chmod", c("+x", "run_pipeline_shiny.sh"))
        
        incProgress(0.3, detail = "Ejecutando Nextflow")
        log_out <- system2("./run_pipeline_shiny.sh", args = c(shQuote(ruta), shQuote(lan), shQuote(ver)), stdout = TRUE, stderr = TRUE)
        
        status <- attr(log_out, "status")
        if (is.null(status)) status <- 0
        
        pipeline_log(paste(pipeline_log(), "\n\n--- LOG ---\n", paste(log_out, collapse = "\n")))
        
        path_tmp <- file.path(www_dir, "resources", "03-archives", "02-tmp", "02-metagenomics", "01-shotgun")
        if (!dir.exists(path_tmp)) dir.create(path_tmp, recursive = TRUE)
        writeLines(log_out, file.path(path_tmp, "pipeline_log.txt"))
        
        if (status != 0) {
          output$error <- renderText({ paste0("⚠️ El pipeline falló (status ", status, ").") })
          incProgress(1); return()
        }
        
        
        incProgress(0.8, detail = "Organizando archivos")

        if (dir.exists(report_dir)) {
          # 1. Copia original para la web de Shiny
          system2("cp", shQuote(c("-R", paste0(report_dir, "/."), www_report_dir)))
          
          # 2. Nueva copia a la ruta raíz del proyecto del usuario
          project_report_dir <- file.path(ruta, "report")
          
          if (dir.exists(project_report_dir)) {
            unlink(project_report_dir, recursive = TRUE)  # Borra la carpeta previa si existe
          }
          dir.create(project_report_dir, recursive = TRUE)  # Crea la carpeta nueva
          
          # Copia el contenido a la ruta del proyecto
          system2("cp", shQuote(c("-R", paste0(report_dir, "/."), project_report_dir)))
          
          # 3. Renderizado de UI y log adaptado al idioma
          html_file <- if (lan == "1") "index_es.html" else "index_en.html"
          
          output$resultLinks <- renderUI({
            tags$a(href = paste0("reports/02-metagenomics/01-shotgun/", html_file), 
                    target = "_blank", 
                    "Abrir informe HTML en nueva pestaña")
          })
          pipeline_log(paste0(pipeline_log(), "\n\n✅ Informe generado y disponible abajo (copia guardada en la ruta del proyecto)."))
        } else {
          output$error <- renderText("⚠️ La carpeta reports no se encontró.")
        }
        incProgress(1)
      })






    ############################################################################################
    # 3.5.5. Metagenomics - Amplicones
    ############################################################################################
      
    } else if (cat == "metagenomics" && tipo == "metagen_amplicon") {
      req(input$project_path_metagen_amplicon, input$amplicon_type_metagen_amplicon, input$report_language_metagen_amplicon, input$report_version_metagen_amplicon)
      
      ruta <- limpiar_comillas(input$project_path_metagen_amplicon)
      type <- limpiar_comillas(input$amplicon_type_metagen_amplicon)
      lan <- limpiar_comillas(input$report_language_metagen_amplicon)
      ver <- limpiar_comillas(input$report_version_metagen_amplicon)
      
      withProgress(message = "Ejecutando pipeline de Metagenómica de Amplicones... \n", value = 0, {
        pipeline_log("Lanzando pipeline con Nextflow...")
        
        app_base <- getwd()
        www_dir <- file.path(app_base, "www")
        www_report_dir <- file.path(app_base, "www", "reports", "02-metagenomics", "02-amplicon")
        pipeline_base <- normalizePath("../02-pipelines/02-metagenomics/02-amplicon", mustWork = TRUE)
        report_dir <- file.path(pipeline_base, "report")
        
        if (!dir.exists(report_dir)) dir.create(report_dir, recursive = TRUE)
        if (!dir.exists(www_report_dir)) dir.create(www_report_dir, recursive = TRUE)
        
        setwd(pipeline_base)
        incProgress(0.2, detail = "Preparando comando")
        system2("chmod", c("+x", "run_pipeline_shiny.sh"))
        
        incProgress(0.3, detail = "Ejecutando Nextflow")
        log_out <- system2("./run_pipeline_shiny.sh", args = c(shQuote(ruta), shQuote(type), shQuote(lan), shQuote(ver)), stdout = TRUE, stderr = TRUE)
        
        status <- attr(log_out, "status")
        if (is.null(status)) status <- 0
        
        pipeline_log(paste(pipeline_log(), "\n\n--- LOG ---\n", paste(log_out, collapse = "\n")))

        path_tmp <- file.path(www_dir, "resources", "03-archives", "02-tmp", "02-metagenomics", "02-amplicon")
        if (!dir.exists(path_tmp)) dir.create(path_tmp, recursive = TRUE)
        writeLines(log_out, file.path(path_tmp, "pipeline_log.txt"))
        
        if (status != 0) {
          output$error <- renderText({ paste0("⚠️ El pipeline falló (status ", status, ").") })
          incProgress(1); return()
        }
        

        incProgress(0.8, detail = "Organizando archivos")

        if (dir.exists(report_dir)) {
          # 1. Copia original para la web de Shiny
          system2("cp", shQuote(c("-R", paste0(report_dir, "/."), www_report_dir)))
          
          # 2. Nueva copia a la ruta raíz del proyecto del usuario
          project_report_dir <- file.path(ruta, "report")
          
          if (dir.exists(project_report_dir)) {
            unlink(project_report_dir, recursive = TRUE)  # Borra la carpeta previa si existe
          }
          dir.create(project_report_dir, recursive = TRUE)  # Crea la carpeta nueva
          
          # Copia el contenido a la ruta del proyecto
          system2("cp", shQuote(c("-R", paste0(report_dir, "/."), project_report_dir)))
          
          # 3. Renderizado de UI y log adaptado al idioma
          html_file <- if (lan == "1") "index_es.html" else "index_en.html"
          
          output$resultLinks <- renderUI({
            tags$a(href = paste0("reports/02-metagenomics/02-amplicon/", html_file), 
                    target = "_blank", 
                    "Abrir informe HTML en nueva pestaña")
          })
          pipeline_log(paste0(pipeline_log(), "\n\n✅ Informe generado y disponible abajo (copia guardada en la ruta del proyecto)."))
        } else {
          output$error <- renderText("⚠️ La carpeta reports no se encontró.")
        }
        incProgress(1)
      })






    ############################################################################################
    # 3.5.6. Metatranscriptomics - Shotgun
    ############################################################################################

    } else if (cat == "metatranscriptomics" && tipo == "metatrans_shotgun") {
      req(input$project_path_metatrans_shotgun, input$report_language_metatrans_shotgun, input$report_version_metatrans_shotgun)
      
      ruta <- limpiar_comillas(input$project_path_metatrans_shotgun)
      lan <- limpiar_comillas(input$report_language_metatrans_shotgun)
      ver <- limpiar_comillas(input$report_version_metatrans_shotgun)
      
      withProgress(message = "Ejecutando pipeline de Metatranscriptómica Shotgun... \n", value = 0, {
        pipeline_log("Lanzando pipeline con Nextflow...")
        
        app_base <- getwd()
        www_dir <- file.path(app_base, "www")
        www_report_dir <- file.path(app_base, "www", "reports", "03-metatranscriptomics", "01-shotgun")
        pipeline_base <- normalizePath("../02-pipelines/03-metatranscriptomics/01-shotgun", mustWork = TRUE)
        report_dir <- file.path(pipeline_base, "report")
        
        if (!dir.exists(report_dir)) dir.create(report_dir, recursive = TRUE)
        if (!dir.exists(www_report_dir)) dir.create(www_report_dir, recursive = TRUE)
        
        setwd(pipeline_base)
        incProgress(0.2, detail = "Preparando comando")
        system2("chmod", c("+x", "run_pipeline_shiny.sh"))
        
        incProgress(0.3, detail = "Ejecutando Nextflow")
        log_out <- system2("./run_pipeline_shiny.sh", args = c(shQuote(ruta), shQuote(lan), shQuote(ver)), stdout = TRUE, stderr = TRUE)
        
        status <- attr(log_out, "status")
        if (is.null(status)) status <- 0
        
        pipeline_log(paste(pipeline_log(), "\n\n--- LOG ---\n", paste(log_out, collapse = "\n")))
        
        path_tmp <- file.path(www_dir, "resources", "03-archives", "02-tmp", "03-metatranscriptomics", "01-shotgun")
        if (!dir.exists(path_tmp)) dir.create(path_tmp, recursive = TRUE)
        writeLines(log_out, file.path(path_tmp, "pipeline_log.txt"))
        
        if (status != 0) {
          output$error <- renderText({ paste0("⚠️ El pipeline falló (status ", status, ").") })
          incProgress(1); return()
        }
        
        incProgress(0.8, detail = "Organizando archivos")
        if (dir.exists(report_dir)) {
          # 1. Copia original para la web de Shiny
          system2("cp", shQuote(c("-R", paste0(report_dir, "/."), www_report_dir)))
          
          # 2. NUEVA COPIA a la ruta raíz del proyecto del usuario
          project_report_dir <- file.path(ruta, "report")
          
          if (dir.exists(project_report_dir)) {
            unlink(project_report_dir, recursive = TRUE) # Borra la carpeta previa si existe
          }
          dir.create(project_report_dir, recursive = TRUE) # Crea la carpeta nueva
          
          # Copia el contenido a la ruta del proyecto
          system2("cp", shQuote(c("-R", paste0(report_dir, "/."), project_report_dir)))
          
          # 3. Renderizado de UI y log adaptado al idioma
          html_file <- if (lan == "1") "index_es.html" else "index_en.html"
          
          output$resultLinks <- renderUI({
            tags$a(href = paste0("reports/03-metatranscriptomics/01-shotgun/", html_file), 
                    target = "_blank", 
                    "Abrir informe HTML en nueva pestaña")
          })
          pipeline_log(paste0(pipeline_log(), "\n\n✅ Informe generado y disponible abajo (copia guardada en la ruta del proyecto)."))
        } else {
          output$error <- renderText("⚠️ La carpeta reports no se encontró.")
        }
        incProgress(1)
      })






    ############################################################################################
    # 3.5.7. Caso por defecto – Sin tipo de análisis seleccionado
    ############################################################################################
    
    } else {
      output$error <- renderText("⚠️ Por favor, selecciona la Categoría Ómica y el Tipo de Análisis.")
    }
    
  })
}










#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# 4. EJECUCIÓN DE LA APLICACIÓN SHINY
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

shinyApp(ui, server)