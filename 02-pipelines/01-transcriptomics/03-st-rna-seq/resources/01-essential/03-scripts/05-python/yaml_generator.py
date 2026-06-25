# !/usr/bin/env python3

########################################################################################################################
# Importación de librerías
########################################################################################################################

import sys
from ruamel.yaml import YAML
from ruamel.yaml.scalarstring import DoubleQuotedScalarString, LiteralScalarString










########################################################################################################################
# Especificar el nombre del archivo de salida
########################################################################################################################

OUTPUT_YML = "_quarto.yml"










########################################################################################################################
# Leer argumentos de línea de comandos
########################################################################################################################

# Valores por defecto
report_language = 1
report_version = 1


# Validaciones
valid_languages = {1, 2}
valid_versions = {1, 2}

if len(sys.argv) > 2:
    # Primer argumento: report_language
    try:
        report_language = int(sys.argv[1])
    except ValueError:
        print("❌ El parámetro 'report_language' debe ser un número entero (1 o 2).")
        sys.exit(1)
        
    if report_language not in valid_languages:
        print("❌ El parámetro 'report_language' debe ser 1 (Español) o 2 (Inglés).")
        sys.exit(1)
    
    # Segundo argumento: report_version
    try:
        report_version = int(sys.argv[2])
    except ValueError:
        print("❌ El parámetro 'report_version' debe ser un número entero (1 o 2).")
        sys.exit(1)
        
    if report_version not in valid_versions:
        print("❌ El parámetro 'report_version' debe ser 1 (Full) o 2 (Compact).")
        sys.exit(1)
elif len(sys.argv) == 2:
    print("❌ Faltan parámetros. Debe proporcionar 'report_language' y 'report_version'.")
    sys.exit(1)

print(f"✅ Parámetros recibidos -> report_language: {report_language} | report_version: {report_version}")










########################################################################################################################
# Definir la estructura del archivo YAML
########################################################################################################################

#≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠
# Estructura base del archivo YAML
#≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠

#==================================================================================================
# Spanish language base structure
#==================================================================================================

#----------------------------------------------------------------------------------------
# Full version base structure
#----------------------------------------------------------------------------------------

base_spanish_full = {
    "project": {
        "type": "website",
        "output-dir": "report",
        "render": [
            "index_es.qmd",
            "resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab1-metodologia/metodologia.qmd",
            "resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab2-resumen/resumen.qmd",
            "resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/00-contexto.qmd",
            "resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/01-revision-inicial.qmd",
            "resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/02-control-calidad.qmd",
            "resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/03-clustering.qmd",
            "resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/04-marcadores.qmd",
            "resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/05-anotacion.qmd",
            "resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/06-agrupacion.qmd",
            "resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/07-expresion-diferencial.qmd",
            "resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/08-enriquecimiento.qmd",
            "resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/09-extra.qmd",
            "resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/10-conclusiones.qmd"
        ]
    },
    "resources": [
        "resources/**",
        "!resources/01-essential/03-scripts/01-r/",
        "!resources/01-essential/03-scripts/05-python/"
    ],
    "format": {
        "html": {
            "css": "resources/01-essential/03-scripts/03-css/styles.css",
            "theme": "lux",
            "toc": False,
            "code-fold": False,
            "code-tools": False,
            "number-sections": False,
            "page-layout": "custom",
            "smooth-scroll": True,
            "highlight-style": "a11y-dark",
            "self-contained": False,
            "copy-files": True,
            "html": True
        }
    },
    "include-in-header": {
        "text": LiteralScalarString(
            "<link rel=\"shortcut icon\" href=\"resources/01-essential/01-images/icons/favicon.svg\"/>\n"
            "<link rel=\"icon\" type=\"image/x-icon\" href=\"resources/01-essential/01-images/icons/favicon.ico\">"
        )
    },
    "execute": {
        "echo": False,
        "warning": False,
        "message": False,
        "freeze": False,
        "cache": True
    },
    "params": {
        "project_path": "",
        "technology": "",
        "report_language": "",
        "report_version": ""
    },
    "website": {
        "navbar": {
            "title": LiteralScalarString(
                "<img class='brand-logo' src='/resources/01-essential/01-images/icons/ipbln.png'>\n"
                "<a class='brand-text' href='https://www.ipb.csic.es/servicios/Bioinformatica/index.html'>IPBLN</a>"
            ),
            "right": [
                {
                    "text": DoubleQuotedScalarString("Inicio"),
                    "icon": "house",
                    "href": DoubleQuotedScalarString("index_es.qmd")
                },
                {
                    "text": DoubleQuotedScalarString("Metodología"),
                    "icon": "wrench",
                    "href": DoubleQuotedScalarString(
                        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab1-metodologia/metodologia.qmd"
                    ),
                },
                {
                    "text": DoubleQuotedScalarString("Resumen"),
                    "icon": "clipboard-data",
                    "href": DoubleQuotedScalarString(
                        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab2-resumen/resumen.qmd"
                    )
                },
                {
                    "text": DoubleQuotedScalarString("Análisis"),
                    "icon": "bar-chart",
                    "menu": [
                        {
                            "text": DoubleQuotedScalarString("➤ Introducción contextual"),
                            "href": DoubleQuotedScalarString(
                                "resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/00-contexto.qmd"
                            )
                        },
                        {
                            "text": DoubleQuotedScalarString("1. Revisión inicial de muestras y metadatos"),
                            "href": DoubleQuotedScalarString(
                                "resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/01-revision-inicial.qmd"
                            )
                        },
                        {
                            "text": DoubleQuotedScalarString("2. Control de calidad y filtrado (QC)"),
                            "href": DoubleQuotedScalarString(
                                "resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/02-control-calidad.qmd"
                            )
                        },
                        {
                            "text": DoubleQuotedScalarString("3. Reducción de dimensionalidad y clustering"),
                            "href": DoubleQuotedScalarString(
                                "resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/03-clustering.qmd"
                            )
                        },
                        {
                            "text": DoubleQuotedScalarString("4. Identificación de marcadores (clusters ciegos)"),
                            "href": DoubleQuotedScalarString(
                                "resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/04-marcadores.qmd"
                            )
                        },
                        {
                            "text": DoubleQuotedScalarString("5. Anotación celular (automática y manual)"),
                            "href": DoubleQuotedScalarString(
                                "resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/05-anotacion.qmd"
                            )
                        },
                        {
                            "text": DoubleQuotedScalarString("6. Agrupación de poblaciones biológicas"),
                            "href": DoubleQuotedScalarString(
                                "resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/06-agrupacion.qmd"
                            )
                        },
                        {
                            "text": DoubleQuotedScalarString("7. Análisis de expresión diferencial"),
                            "href": DoubleQuotedScalarString(
                                "resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/07-expresion-diferencial.qmd"
                            )
                        },
                        {
                            "text": DoubleQuotedScalarString("8. Análisis funcional y de enriquecimiento"),
                            "href": DoubleQuotedScalarString(
                                "resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/08-enriquecimiento.qmd"
                            )
                        },
                        {
                            "text": DoubleQuotedScalarString("9. Análisis personalizados y ad hoc"),
                            "href": DoubleQuotedScalarString(
                                "resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/09-extra.qmd"
                            )
                        },
                        {
                            "text": DoubleQuotedScalarString("10. Conclusiones y perspectivas"),
                            "href": DoubleQuotedScalarString(
                                "resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/10-conclusiones.qmd"
                            )
                        }
                    ]
                }
            ]
        }
    },
    "clean": False
}




#----------------------------------------------------------------------------------------
# Compact version base structure
#----------------------------------------------------------------------------------------

base_spanish_compact = {
    "project": {
        "type": "website",
        "output-dir": "report",
        "render": [
            "index_es.qmd",
            "resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab2-resumen/resumen.qmd",
            "resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/00-contexto.qmd",
            "resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/01-revision-inicial.qmd",
            "resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/02-control-calidad.qmd",
            "resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/03-clustering.qmd",
            "resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/04-marcadores.qmd",
            "resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/05-anotacion.qmd",
            "resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/06-agrupacion.qmd",
            "resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/07-expresion-diferencial.qmd",
            "resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/08-enriquecimiento.qmd",
            "resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/09-extra.qmd",
            "resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/10-conclusiones.qmd"
        ]
    },
    "resources": [
        "resources/**",
        "!resources/01-essential/03-scripts/01-r/",
        "!resources/01-essential/03-scripts/05-python/"
    ],
    "format": {
        "html": {
            "css": "resources/01-essential/03-scripts/03-css/styles.css",
            "theme": "lux",
            "toc": False,
            "code-fold": False,
            "code-tools": False,
            "number-sections": False,
            "page-layout": "custom",
            "smooth-scroll": True,
            "highlight-style": "a11y-dark",
            "self-contained": False,
            "copy-files": True,
            "html": True
        }
    },
    "include-in-header": {
        "text": LiteralScalarString(
            "<link rel=\"shortcut icon\" href=\"resources/01-essential/01-images/icons/favicon.svg\"/>\n"
            "<link rel=\"icon\" type=\"image/x-icon\" href=\"resources/01-essential/01-images/icons/favicon.ico\">"
        )
    },
    "execute": {
        "echo": False,
        "warning": False,
        "message": False,
        "freeze": False,
        "cache": True
    },
    "params": {
        "project_path": "",
        "report_language": "",
        "report_version": ""
    },
    "website": {
        "navbar": {
            "title": LiteralScalarString(
                "<img class='brand-logo' src='/resources/01-essential/01-images/icons/ipbln.png'>\n"
                "<a class='brand-text' href='https://www.ipb.csic.es/servicios/Bioinformatica/index.html'>IPBLN</a>"
            ),
            "right": [
                {
                    "text": DoubleQuotedScalarString("Inicio"),
                    "icon": "house",
                    "href": DoubleQuotedScalarString("index_es.qmd")
                },
                {
                    "text": DoubleQuotedScalarString("Resumen"),
                    "icon": "clipboard-data",
                    "href": DoubleQuotedScalarString(
                        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab2-resumen/resumen.qmd"
                    )
                },
                {
                    "text": DoubleQuotedScalarString("Análisis"),
                    "icon": "bar-chart",
                    "menu": [
                        {
                            "text": DoubleQuotedScalarString("➤ Introducción contextual"),
                            "href": DoubleQuotedScalarString(
                                "resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/00-contexto.qmd"
                            )
                        },
                        {
                            "text": DoubleQuotedScalarString("1. Revisión inicial de muestras y metadatos"),
                            "href": DoubleQuotedScalarString(
                                "resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/01-revision-inicial.qmd"
                            )
                        },
                        {
                            "text": DoubleQuotedScalarString("2. Control de calidad y filtrado (QC)"),
                            "href": DoubleQuotedScalarString(
                                "resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/02-control-calidad.qmd"
                            )
                        },
                        {
                            "text": DoubleQuotedScalarString("3. Reducción de dimensionalidad y clustering"),
                            "href": DoubleQuotedScalarString(
                                "resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/03-clustering.qmd"
                            )
                        },
                        {
                            "text": DoubleQuotedScalarString("4. Identificación de marcadores (clusters ciegos)"),
                            "href": DoubleQuotedScalarString(
                                "resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/04-marcadores.qmd"
                            )
                        },
                        {
                            "text": DoubleQuotedScalarString("5. Anotación celular (automática y manual)"),
                            "href": DoubleQuotedScalarString(
                                "resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/05-anotacion.qmd"
                            )
                        },
                        {
                            "text": DoubleQuotedScalarString("6. Agrupación de poblaciones biológicas"),
                            "href": DoubleQuotedScalarString(
                                "resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/06-agrupacion.qmd"
                            )
                        },
                        {
                            "text": DoubleQuotedScalarString("7. Análisis de expresión diferencial"),
                            "href": DoubleQuotedScalarString(
                                "resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/07-expresion-diferencial.qmd"
                            )
                        },
                        {
                            "text": DoubleQuotedScalarString("8. Análisis funcional y de enriquecimiento"),
                            "href": DoubleQuotedScalarString(
                                "resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/08-enriquecimiento.qmd"
                            )
                        },
                        {
                            "text": DoubleQuotedScalarString("9. Análisis personalizados y ad hoc"),
                            "href": DoubleQuotedScalarString(
                                "resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/09-extra.qmd"
                            )
                        },
                        {
                            "text": DoubleQuotedScalarString("10. Conclusiones y perspectivas"),
                            "href": DoubleQuotedScalarString(
                                "resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/10-conclusiones.qmd"
                            )
                        }
                    ]
                }
            ]
        }
    },
    "clean": False
}






#==================================================================================================
# English language base structure
#==================================================================================================

#----------------------------------------------------------------------------------------
# Full version base structure
#----------------------------------------------------------------------------------------

base_english_full = {
    "project": {
        "type": "website",
        "output-dir": "report",
        "render": [
            "index_en.qmd",
            "resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab1-metodologia/metodologia.qmd",
            "resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab2-resumen/resumen.qmd",
            "resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/00-contexto.qmd",
            "resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/01-revision-inicial.qmd",
            "resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/02-control-calidad.qmd",
            "resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/03-clustering.qmd",
            "resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/04-marcadores.qmd",
            "resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/05-anotacion.qmd",
            "resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/06-agrupacion.qmd",
            "resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/07-expresion-diferencial.qmd",
            "resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/08-enriquecimiento.qmd",
            "resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/09-extra.qmd",
            "resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/10-conclusiones.qmd"
        ]
    },
    "resources": [
        "resources/**",
        "!resources/01-essential/03-scripts/01-r/",
        "!resources/01-essential/03-scripts/05-python/"
    ],
    "format": {
        "html": {
            "css": "resources/01-essential/03-scripts/03-css/styles.css",
            "theme": "lux",
            "toc": False,
            "code-fold": False,
            "code-tools": False,
            "number-sections": False,
            "page-layout": "custom",
            "smooth-scroll": True,
            "highlight-style": "a11y-dark",
            "self-contained": False,
            "copy-files": True,
            "html": True
        }
    },
    "include-in-header": {
        "text": LiteralScalarString(
            "<link rel=\"shortcut icon\" href=\"resources/01-essential/01-images/icons/favicon.svg\"/>\n"
            "<link rel=\"icon\" type=\"image/x-icon\" href=\"resources/01-essential/01-images/icons/favicon.ico\">"
        )
    },
    "execute": {
        "echo": False,
        "warning": False,
        "message": False,
        "freeze": False,
        "cache": True
    },
    "params": {
        "project_path": "",
        "technology": "",
        "report_language": "",
        "report_version": ""
    },
    "website": {
        "navbar": {
            "title": LiteralScalarString(
                "<img class='brand-logo' src='/resources/01-essential/01-images/icons/ipbln.png'>\n"
                "<a class='brand-text' href='https://www.ipb.csic.es/servicios/Bioinformatica/index.html'>IPBLN</a>"
            ),
            "right": [
                {
                    "text": DoubleQuotedScalarString("Home"),
                    "icon": "house",
                    "href": DoubleQuotedScalarString("index_en.qmd")
                },
                {
                    "text": DoubleQuotedScalarString("Methodology"),
                    "icon": "wrench",
                    "href": DoubleQuotedScalarString(
                        "resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab1-metodologia/metodologia.qmd"
                    ),
                },
                {
                    "text": DoubleQuotedScalarString("Summary"),
                    "icon": "clipboard-data",
                    "href": DoubleQuotedScalarString(
                        "resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab2-resumen/resumen.qmd"
                    )
                },
                {
                    "text": DoubleQuotedScalarString("Analysis"),
                    "icon": "bar-chart",
                    "menu": [
                        {
                            "text": DoubleQuotedScalarString("➤ Contextual introduction"),
                            "href": DoubleQuotedScalarString(
                                "resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/00-contexto.qmd"
                            )
                        },
                        {
                            "text": DoubleQuotedScalarString("1. Initial review of samples and metadata"),
                            "href": DoubleQuotedScalarString(
                                "resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/01-revision-inicial.qmd"
                            )
                        },
                        {
                            "text": DoubleQuotedScalarString("2. Quality control and filtering (QC)"),
                            "href": DoubleQuotedScalarString(
                                "resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/02-control-calidad.qmd"
                            )
                        },
                        {
                            "text": DoubleQuotedScalarString("3. Dimensionality reduction and clustering"),
                            "href": DoubleQuotedScalarString(
                                "resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/03-clustering.qmd"
                            )
                        },
                        {
                            "text": DoubleQuotedScalarString("4. Marker identification (blind clusters)"),
                            "href": DoubleQuotedScalarString(
                                "resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/04-marcadores.qmd"
                            )
                        },
                        {
                            "text": DoubleQuotedScalarString("5. Cell annotation (automatic and manual)"),
                            "href": DoubleQuotedScalarString(
                                "resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/05-anotacion.qmd"
                            )
                        },
                        {
                            "text": DoubleQuotedScalarString("6. Biological population grouping"),
                            "href": DoubleQuotedScalarString(
                                "resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/06-agrupacion.qmd"
                            )
                        },
                        {
                            "text": DoubleQuotedScalarString("7. Differential expression analysis"),
                            "href": DoubleQuotedScalarString(
                                "resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/07-expresion-diferencial.qmd"
                            )
                        },
                        {
                            "text": DoubleQuotedScalarString("8. Functional and enrichment analysis"),
                            "href": DoubleQuotedScalarString(
                                "resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/08-enriquecimiento.qmd"
                            )
                        },
                        {
                            "text": DoubleQuotedScalarString("9. Custom and ad hoc analysis"),
                            "href": DoubleQuotedScalarString(
                                "resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/09-extra.qmd"
                            )
                        },
                        {
                            "text": DoubleQuotedScalarString("10. Conclusions and perspectives"),
                            "href": DoubleQuotedScalarString(
                                "resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/10-conclusiones.qmd"
                            )
                        }
                    ]
                }
            ]
        }
    },
    "clean": False
}




#----------------------------------------------------------------------------------------
# Compact version base structure
#----------------------------------------------------------------------------------------

base_english_compact = {
    "project": {
        "type": "website",
        "output-dir": "report",
        "render": [
            "index_en.qmd",
            "resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab2-resumen/resumen.qmd",
            "resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/00-contexto.qmd",
            "resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/01-revision-inicial.qmd",
            "resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/02-control-calidad.qmd",
            "resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/03-clustering.qmd",
            "resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/04-marcadores.qmd",
            "resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/05-anotacion.qmd",
            "resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/06-agrupacion.qmd",
            "resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/07-expresion-diferencial.qmd",
            "resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/08-enriquecimiento.qmd",
            "resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/09-extra.qmd",
            "resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/10-conclusiones.qmd"
        ]
    },
    "resources": [
        "resources/**",
        "!resources/01-essential/03-scripts/01-r/",
        "!resources/01-essential/03-scripts/05-python/"
    ],
    "format": {
        "html": {
            "css": "resources/01-essential/03-scripts/03-css/styles.css",
            "theme": "lux",
            "toc": False,
            "code-fold": False,
            "code-tools": False,
            "number-sections": False,
            "page-layout": "custom",
            "smooth-scroll": True,
            "highlight-style": "a11y-dark",
            "self-contained": False,
            "copy-files": True,
            "html": True
        }
    },
    "include-in-header": {
        "text": LiteralScalarString(
            "<link rel=\"shortcut icon\" href=\"resources/01-essential/01-images/icons/favicon.svg\"/>\n"
            "<link rel=\"icon\" type=\"image/x-icon\" href=\"resources/01-essential/01-images/icons/favicon.ico\">"
        )
    },
    "execute": {
        "echo": False,
        "warning": False,
        "message": False,
        "freeze": False,
        "cache": True
    },
    "params": {
        "project_path": "",
        "technology": "",
        "report_language": "",
        "report_version": ""
    },
    "website": {
        "navbar": {
            "title": LiteralScalarString(
                "<img class='brand-logo' src='/resources/01-essential/01-images/icons/ipbln.png'>\n"
                "<a class='brand-text' href='https://www.ipb.csic.es/servicios/Bioinformatica/index.html'>IPBLN</a>"
            ),
            "right": [
                {
                    "text": DoubleQuotedScalarString("Home"),
                    "icon": "house",
                    "href": DoubleQuotedScalarString("index_en.qmd")
                },
                {
                    "text": DoubleQuotedScalarString("Summary"),
                    "icon": "clipboard-data",
                    "href": DoubleQuotedScalarString(
                        "resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab2-resumen/resumen.qmd"
                    )
                },
                {
                    "text": DoubleQuotedScalarString("Analysis"),
                    "icon": "bar-chart",
                    "menu": [
                        {
                            "text": DoubleQuotedScalarString("➤ Contextual introduction"),
                            "href": DoubleQuotedScalarString(
                                "resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/00-contexto.qmd"
                            )
                        },
                        {
                            "text": DoubleQuotedScalarString("1. Initial review of samples and metadata"),
                            "href": DoubleQuotedScalarString(
                                "resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/01-revision-inicial.qmd"
                            )
                        },
                        {
                            "text": DoubleQuotedScalarString("2. Quality control and filtering (QC)"),
                            "href": DoubleQuotedScalarString(
                                "resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/02-control-calidad.qmd"
                            )
                        },
                        {
                            "text": DoubleQuotedScalarString("3. Dimensionality reduction and clustering"),
                            "href": DoubleQuotedScalarString(
                                "resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/03-clustering.qmd"
                            )
                        },
                        {
                            "text": DoubleQuotedScalarString("4. Marker identification (blind clusters)"),
                            "href": DoubleQuotedScalarString(
                                "resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/04-marcadores.qmd"
                            )
                        },
                        {
                            "text": DoubleQuotedScalarString("5. Cell annotation (automatic and manual)"),
                            "href": DoubleQuotedScalarString(
                                "resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/05-anotacion.qmd"
                            )
                        },
                        {
                            "text": DoubleQuotedScalarString("6. Biological population grouping"),
                            "href": DoubleQuotedScalarString(
                                "resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/06-agrupacion.qmd"
                            )
                        },
                        {
                            "text": DoubleQuotedScalarString("7. Differential expression analysis"),
                            "href": DoubleQuotedScalarString(
                                "resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/07-expresion-diferencial.qmd"
                            )
                        },
                        {
                            "text": DoubleQuotedScalarString("8. Functional and enrichment analysis"),
                            "href": DoubleQuotedScalarString(
                                "resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/08-enriquecimiento.qmd"
                            )
                        },
                        {
                            "text": DoubleQuotedScalarString("9. Custom and ad hoc analysis"),
                            "href": DoubleQuotedScalarString(
                                "resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/09-extra.qmd"
                            )
                        },
                        {
                            "text": DoubleQuotedScalarString("10. Conclusions and perspectives"),
                            "href": DoubleQuotedScalarString(
                                "resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/10-conclusiones.qmd"
                            )
                        }
                    ]
                }
            ]
        }
    },
    "clean": False
}








#≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠
# Funciones para agregar secciones adicionales específicas
#≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠

#==================================================================================================
# Spanish language functions
#==================================================================================================

#----------------------------------------------------------------------------------------
# Full version functions
#----------------------------------------------------------------------------------------

# Aquí no es necesario agregar funciones, ya que la versión full siempre incluye todas las secciones.




#----------------------------------------------------------------------------------------
# Compact version functions
#----------------------------------------------------------------------------------------

# Aquí no es necesario agregar funciones, ya que la versión compact siempre incluye todas las secciones.






#==================================================================================================
# English language functions
#==================================================================================================

#----------------------------------------------------------------------------------------
# Full version functions
#----------------------------------------------------------------------------------------

# Aquí no es necesario agregar funciones, ya que la versión full siempre incluye todas las secciones.




#----------------------------------------------------------------------------------------
# Compact version functions
#----------------------------------------------------------------------------------------

# Aquí no es necesario agregar funciones, ya que la versión compact siempre incluye todas las secciones.










########################################################################################################################
# Inclusión de secciones según el tipo de análisis específico
########################################################################################################################

# Aquí no es necesario agregar lógica adicional, ya que las estructuras base ya están definidas arriba.










########################################################################################################################
# Guardado del archivo _quarto.yml con líneas en blanco entre bloques
########################################################################################################################

# Escoger la base correcta según el idioma y la versión
if report_language == 1:
    base = base_spanish_full if report_version == 1 else base_spanish_compact
elif report_language == 2:
    base = base_english_full if report_version == 1 else base_english_compact

# Inicializar YAML
yaml_ruamel = YAML()
yaml_ruamel.indent(sequence=4, offset=2)
yaml_ruamel.preserve_quotes = True

# Guardar cada bloque por separado para mantener saltos de línea entre secciones
with open(OUTPUT_YML, "w") as f:
    for i, (k, v) in enumerate(base.items()):
        yaml_ruamel.dump({k: v}, f)
        # Añadir salto de línea entre bloques, excepto al final
        if i < len(base) - 1:
            f.write("\n")

print(f"✅ Archivo _quarto.yml generado correctamente")










########################################################################################################################
# Como probarlo
########################################################################################################################

# Para probar este script, puede ejecutar el siguiente comando en la terminal:
# python yaml_generator.py 1 1
