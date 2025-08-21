#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
# APP SHINY PARA FORMULARIO DE EJECUCIÓN DE PIPELINES
#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# 1. CARGA DE LIBRERÍAS
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

library(shiny)
library(quarto)
library(fs)








#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# 2. DEFINICIÓN DE LA INTERFAZ DE USUARIO (UI)
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

# Permitir subida de archivos grandes (hasta 5 GB)
options(shiny.maxRequestSize = 5000 * 1024^2)

# Definición de la interfaz de usuario
ui <- basicPage(
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








#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# 3. LÓGICA DEL SERVIDOR
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

# Server: maneja interacción del UI, validaciones y ejecución de pipelines.
server <- function(input, output, session) {
  
  
  
  
  
  
  #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  # 3.1. Inicialización y variables reactivas
  #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  
  # Salidas iniciales (evita "object not found" y contenido residual)
  output$mensaje <- renderText("")  # log/estado visible al usuario
  output$error <- renderText("")  # mensajes de error
  output$reportViewer <- renderUI({})  # contenedor del informe (iframe)
  output$resultLinks <- renderUI({})  # enlace al informe
  
  # Log interno del pipeline
  pipeline_log <- reactiveVal("")
  
  
  
  
  
  
  #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  # 3.2. Renderizado dinámico del formulario de inputs
  #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  
  output$formulario_inputs <- renderUI({
    tagList(
      
      # Tipo de análisis
      div(class = "form-group tipo-analisis",
          tags$label("Tipo de análisis", class = "label-grande"),
          selectInput(
            "tipo_analisis", NULL,
            choices = c(
              "Selecciona..." = "",
              "RNA-Seq" = "bulk-rna-seq",
              "scRNA-Seq" = "sc-rna-seq",
              "Metagenómica" = "metagenomica"
            )
          )
      ),
      
      
      
      
      
      
      #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
      # 3.3. Validación y estados de inputs
      #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
      
      ############################################################################################
      # 3.3.1. RNA-Seq
      ############################################################################################
      
      conditionalPanel(
        condition = "input.tipo_analisis == 'bulk-rna-seq'",
        tagList(
          
          # Ruta proyecto
          div(class = "form-group inputs-conjuntos",
              tags$label("Ruta absoluta a la carpeta del proyecto generado por miARma-Seq"),
              textInput(
                "ruta_proyecto", label = NULL,
                placeholder = "Ej: /ruta/a/la/carpeta_proyecto/"
              ),
              div(style = "min-height: 25px; margin-bottom: 45px;",
                  uiOutput("status_ruta_proyecto")
              )
          ),
          
          # Nombre experimento
          div(class = "form-group inputs-conjuntos",
              tags$label("Nombre del experimento"),
              textInput(
                "nombre_experimento", label = NULL,
                placeholder = "Ej: exp_1"
              ),
              div(style = "min-height: 25px; margin-bottom: 45px;",
                  uiOutput("status_nombre_experimento")
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
      # 3.3.2. scRNA-Seq
      ############################################################################################
      
      conditionalPanel(
        condition = "input.tipo_analisis == 'sc-rna-seq'",
        tagList(
          
          # Matrix.mtx
          div(class = "form-group inputs-conjuntos",
              tags$label("Matrix.mtx"),
              fileInput("matrix_file", NULL, accept = ".mtx"),
              textOutput("status_matrix")
          ),
          
          # Genes.tsv
          div(class = "form-group inputs-conjuntos",
              tags$label("Genes.tsv"),
              fileInput("genes_file", NULL, accept = ".tsv"),
              textOutput("status_genes")
          ),
          
          # Barcodes.tsv
          div(class = "form-group inputs-conjuntos",
              tags$label("Barcodes.tsv"),
              fileInput("barcodes_file", NULL, accept = ".tsv"),
              textOutput("status_barcodes")
          )
        )
      ),
      
      
      
      
      
      ############################################################################################
      # 3.3.3. Metagenómica
      ############################################################################################
      
      conditionalPanel(
        condition = "input.tipo_analisis == 'metagenomica'",
        tagList(
          
          # Archivo FASTQ (comprimido)
          div(class = "form-group inputs-conjuntos",
              tags$label("Archivo FASTQ (comprimido)"),
              fileInput("meta_fastq", NULL, accept = c(".fastq.gz", ".fq.gz")),
              textOutput("status_meta_fastq")
          ),
          
          # Archivo de referencia Kraken (opcional)
          div(class = "form-group inputs-conjuntos",
              tags$label("Archivo de referencia Kraken (opcional)"),
              fileInput("meta_kraken", NULL),
              textOutput("status_meta_kraken")
          )
        )
      )
    )
  })
  
  
  
  
  
  
  #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  # 3.4. Renderizado de mensajes y reportes iniciales
  #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  
  ############################################################################################
  # 3.4.1. RNA-Seq – Verificación inicial de estructura del proyecto
  ############################################################################################
  
  # Observa cambios en la ruta del proyecto y el nombre del experimento
  observeEvent(
    {
      input$ruta_proyecto
      input$nombre_experimento
    },
    {
      # Requiere ambos campos antes de continuar
      req(input$ruta_proyecto, input$nombre_experimento)
      
      ruta <- input$ruta_proyecto
      exp  <- input$nombre_experimento
      
      # Definir rutas relativas esperadas para el experimento (dinámicas con 'exp')
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
      
      # Comprobar si cada ruta existe en el directorio del proyecto
      existen <- sapply(file.path(ruta, rutas_esperadas), file.exists)
      
      # Mostrar mensaje según el resultado de la verificación
      if (all(existen)) {
        output$status_ruta_proyecto <- renderUI({
          tags$span(
            class = "valido",
            "✅ Ruta y nombre de experimento válidos. Todos los archivos y carpetas requeridos están presentes."
          )
        })
      } else {
        faltantes <- rutas_esperadas[!existen]
        output$status_ruta_proyecto <- renderUI({
          tags$span(
            class = "error",
            HTML(paste0(
              "❌ Faltan elementos:<br><code>",
              paste(faltantes, collapse = "<br>"),
              "</code>"
            ))
          )
        })
      }
    }
  )
  
  
  
  
  
  ############################################################################################
  # 3.4.2. scRNA-Seq – Verificación inicial de archivos de entrada
  ############################################################################################
  
  # Estado de carga de los archivos requeridos (se ampliará en el futuro como en RNA-Seq)
  output$status_matrix <- renderText({
    req(input$matrix_file)  # Requiere archivo de matriz
    "✔ Archivo cargado correctamente"
  })
  
  output$status_genes <- renderText({
    req(input$genes_file)  # Requiere archivo de genes
    "✔ Archivo cargado correctamente"
  })
  
  output$status_barcodes <- renderText({
    req(input$barcodes_file)  # Requiere archivo de códigos de barras
    "✔ Archivo cargado correctamente"
  })
  
  
  
  
  
  ############################################################################################
  # 3.4.3. Metagenómica – Verificación inicial de archivos y placeholders de salida
  ############################################################################################
  
  # Estado de carga de archivos requeridos para análisis metagenómico
  output$status_meta_fastq <- renderText({
    req(input$meta_fastq)  # Requiere archivo FASTQ
    "✔ Archivo cargado correctamente"
  })
  
  output$status_meta_kraken <- renderText({
    req(input$meta_kraken)  # Requiere archivo de resultados Kraken
    "✔ Archivo cargado correctamente"
  })
  
  # Placeholders para mostrar mensajes, reportes y enlaces de resultados
  output$mensaje <- renderText({
    pipeline_log()  # Mensajes del pipeline (log)
  })
  
  output$reportViewer <- renderUI({})  # Área para mostrar reporte HTML
  output$resultLinks  <- renderUI({})  # Área para mostrar enlaces a resultados
  
  
  
  
  
  
  #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  # 3.5. Observador principal para ejecución del pipeline
  #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  
  observeEvent(input$run, {
    
    tipo <- input$tipo_analisis
    
    # Inicializar estado
    output$error <- renderText({ "" })  # Limpiar mensaje de error
    pipeline_log("")  # Limpiar log previo
    
    
    
    
    
    ############################################################################################
    # 3.5.1. RNA-Seq – Ejecución del pipeline con Nextflow
    ############################################################################################

    if (tipo == "bulk-rna-seq") {
      req(input$ruta_proyecto, input$nombre_experimento)  # Verificar entradas obligatorias
      
      withProgress(message = "Ejecutando pipeline RNA-Seq... \n", value = 0, {
        
        pipeline_log("Lanzando pipeline con Nextflow...")
        
        # Definir rutas base
        app_base <- getwd()
        www_dir <- file.path(app_base, "www")
        www_report_bulk_rna_seq_dir <- file.path(app_base, "www", "reports", "1-bulk-rna-seq")
        bulk_rna_seq_pipeline_base <- normalizePath("../2-pipelines/1-bulk-rna-seq", mustWork = TRUE)
        bulk_rna_seq_report_dir <- file.path(bulk_rna_seq_pipeline_base, "report")

        # Crear carpetas necesarias si no existen
        if (!dir.exists(bulk_rna_seq_report_dir)) {
          dir.create(bulk_rna_seq_report_dir, recursive = TRUE)
        }
        if (!dir.exists(www_dir)) {
          dir.create(www_dir, recursive = TRUE)
        }
        if (!dir.exists(www_report_bulk_rna_seq_dir)) {
          dir.create(www_report_bulk_rna_seq_dir, recursive = TRUE)
        }

        # Preparar script de ejecución
        setwd(bulk_rna_seq_pipeline_base)
        incProgress(0.2, detail = "Preparando comando")
        system2("chmod", c("+x", "run_pipeline_shiny.sh"))  # Asegurar permisos
        
        # Ejecutar pipeline con parámetros del usuario
        incProgress(0.3, detail = "Ejecutando Nextflow (esto puede tardar)")
        log_out <- system2(
          "./run_pipeline_shiny.sh",
          args = c(shQuote(input$ruta_proyecto), shQuote(input$nombre_experimento)),
          stdout = TRUE,
          stderr = TRUE
        )
        
        # Obtener estado de salida
        status <- attr(log_out, "status")
        if (is.null(status)) status <- 0
        
        # Registrar salida completa en el log
        pipeline_log(paste(pipeline_log(), "\n\n--- LOG ---\n", paste(log_out, collapse = "\n")))
        
        # Si falla, mostrar mensaje y salir
        if (status != 0) {
          output$error <- renderText({
            paste0("⚠️ El pipeline falló (status ", status, "). Revisa el log en la salida de la app.")
          })
          incProgress(1)
          return()
        }
        
        # Pipeline finalizado con éxito
        incProgress(0.8, detail = "Organizando archivos")
        
        # Copiar reporte generado a carpeta www para acceso desde la app
        if (dir.exists(bulk_rna_seq_report_dir)) {
          
          # Crear la carpeta destino si no existe
          if (!dir.exists(www_report_bulk_rna_seq_dir)) dir.create(www_report_bulk_rna_seq_dir, recursive = TRUE)
          
          # Copiar todo el contenido recursivamente
          system2("cp", shQuote(c("-R", paste0(bulk_rna_seq_report_dir, "/."), www_report_bulk_rna_seq_dir)))

          output$resultLinks <- renderUI({
            tags$a(href = "reports/1-bulk-rna-seq/index.html", target = "_blank", "Abrir informe HTML en nueva pestaña")
          })
          
          pipeline_log(paste0(pipeline_log(), "\n\n✅ Informe generado y disponible abajo."))
          
        } else {
          output$error <- renderText("⚠️ La carpeta reports/1-bulk-rna-seq/ no se encontró después de ejecutar Nextflow.")
        }
        
        incProgress(1)
      })
      
      
      
      
      
    ############################################################################################
    # 3.5.2. scRNA-Seq – Ejecución del pipeline
    ############################################################################################

    } else if (tipo == "sc-rna-seq") {

      # Verificar que todos los archivos requeridos están cargados
      if (is.null(input$matrix_file) || 
          is.null(input$genes_file)  || 
          is.null(input$barcodes_file)) {
        
        output$error <- renderText("⚠️ Faltan archivos para ejecutar el análisis scRNA-Seq.")
        return()
      }
      
      # (Futuro) Aquí se integrará la lógica de ejecución del pipeline con Nextflow
      # siguiendo el mismo esquema que en 3.5.1 (RNA-Seq):
      # - Definir rutas base
      # - Crear directorios necesarios
      # - Asegurar permisos de ejecución
      # - Llamar al script Nextflow
      # - Capturar logs y manejar errores
      # - Copiar reportes a www/ y mostrar enlace
      
      # Mensaje temporal de éxito (placeholder)
      output$mensaje <- renderText("✅ ¡Pipeline scRNA-Seq completado con éxito!")
      
      
      
      
      
    ############################################################################################
    # 3.5.3. Metagenómica – Ejecución del pipeline
    ############################################################################################
      
    } else if (tipo == "metagenomica") {
      
      # Verificar que al menos un archivo FASTQ ha sido cargado
      if (is.null(input$meta_fastq)) {
        output$error <- renderText("⚠️ Debes subir al menos un archivo FASTQ para metagenómica.")
        return()
      }
      
      # (Futuro) Aquí se integrará la lógica de ejecución del pipeline con Nextflow:
      # - Definir rutas base
      # - Crear directorios necesarios
      # - Asegurar permisos de ejecución
      # - Llamar al script Nextflow
      # - Capturar logs y manejar errores
      # - Copiar reportes a www/ y mostrar enlace
      
      # Mensaje temporal de éxito (placeholder)
      output$mensaje <- renderText("✅ ¡Pipeline de metagenómica completado con éxito!")
      
      
      
      
      
    ############################################################################################
    # 3.5.4. Caso por defecto – Sin tipo de análisis seleccionado
    ############################################################################################
      
    } else {
      # Mostrar mensaje de advertencia si no se ha elegido un tipo de análisis
      output$error <- renderText("⚠️ Selecciona un tipo de análisis.")
    }
    
  })
}








#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# 4. EJECUCIÓN DE LA APLICACIÓN SHINY
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

shinyApp(ui, server)










