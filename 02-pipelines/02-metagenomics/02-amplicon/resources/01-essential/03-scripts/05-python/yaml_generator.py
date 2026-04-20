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
amplicon_type = 1

# Validaciones
valid_languages = {1, 2}
valid_versions = {1, 2}
valid_analysis = set(range(1, 8))  # valores válidos: 1 a 7

if len(sys.argv) > 3:
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
        
    # Tercer argumento: amplicon_type
    try:
        amplicon_type = int(sys.argv[3])
    except ValueError:
        print("❌ El parámetro 'amplicon_type' debe ser un número entero entre 1 y 7.")
        sys.exit(1)
        
    if amplicon_type not in valid_analysis:
        print("❌ El parámetro 'amplicon_type' debe estar entre 1 y 7.")
        sys.exit(1)
elif len(sys.argv) in [2, 3]:
    print("❌ Faltan parámetros. Debe proporcionar 'report_language', 'report_version' y 'amplicon_type'.")
    sys.exit(1)

print(f"✅ Parámetros recibidos -> report_language: {report_language} | report_version: {report_version} | amplicon_type: {amplicon_type}")










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
        "amplicon_type": "",
        "report_language": "",
        "report_version": ""
    },
    "website": {
        "navbar": {
            "title": LiteralScalarString(
                "<img class=\'brand-logo\' src=\'/resources/01-essential/01-images/icons/ipbln.png\'>\n"
                "<a class=\'brand-text\' href=\'https://www.ipb.csic.es/servicios/Bioinformatica/index.html\'>IPBLN</a>"
            ),
            "right": [
                {
                    "text": "Inicio",
                    "icon": "house",
                    "href": DoubleQuotedScalarString("index_es.qmd")
                },
                {
                    "text": "Metodología",
                    "icon": "wrench",
                    "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab1-metodologia/metodologia.qmd"),
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
        "amplicon_type": "",
        "report_language": "",
        "report_version": ""
    },
    "website": {
        "navbar": {
            "title": LiteralScalarString(
                "<img class=\'brand-logo\' src=\'/resources/01-essential/01-images/icons/ipbln.png\'>\n"
                "<a class=\'brand-text\' href=\'https://www.ipb.csic.es/servicios/Bioinformatica/index.html\'>IPBLN</a>"
            ),
            "right": [
                {
                    "text": "Inicio",
                    "icon": "house",
                    "href": DoubleQuotedScalarString("index_es.qmd")
                },
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
        "amplicon_type": "",
        "report_language": "",
        "report_version": ""
    },
    "website": {
        "navbar": {
            "title": LiteralScalarString(
                "<img class=\'brand-logo\' src=\'/resources/01-essential/01-images/icons/ipbln.png\'>\n"
                "<a class=\'brand-text\' href=\'https://www.ipb.csic.es/servicios/Bioinformatica/index.html\'>IPBLN</a>"
            ),
            "right": [
                {
                    "text": "Home",
                    "icon": "house",
                    "href": DoubleQuotedScalarString("index_en.qmd")
                },
                {
                    "text": "Methodology",
                    "icon": "wrench",
                    "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab1-metodologia/metodologia.qmd"),
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
        "amplicon_type": "",
        "report_language": "",
        "report_version": ""
    },
    "website": {
        "navbar": {
            "title": LiteralScalarString(
                "<img class=\'brand-logo\' src=\'/resources/01-essential/01-images/icons/ipbln.png\'>\n"
                "<a class=\'brand-text\' href=\'https://www.ipb.csic.es/servicios/Bioinformatica/index.html\'>IPBLN</a>"
            ),
            "right": [
                {
                    "text": "Home",
                    "icon": "house",
                    "href": DoubleQuotedScalarString("index_en.qmd")
                },
            ]
        }
    },
    "clean": False
}








#≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠
# Funciones para agregar secciones específicas según el tipo de análisis
#≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠

#==================================================================================================
# Spanish language functions
#==================================================================================================

#----------------------------------------------------------------------------------------
# Full version functions
#----------------------------------------------------------------------------------------

def add_16S_spanish_full():
    base_spanish_full["project"]["render"].append(
        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab2-resumen/tab2-1-resumen-16S/resumen.qmd"
    )
    base_spanish_full["project"]["render"].extend([
        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/tab3-1-analisis-16S/00-contexto.qmd",
        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/tab3-1-analisis-16S/01-revision-inicial.qmd",
        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/tab3-1-analisis-16S/02-control-calidad.qmd",
        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/tab3-1-analisis-16S/03-generacion-asvs.qmd",
        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/tab3-1-analisis-16S/04-taxonomia-filogenia.qmd",
        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/tab3-1-analisis-16S/05-analisis-diferencial.qmd",
        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/tab3-1-analisis-16S/06-diversidad-microbiana.qmd",
        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/tab3-1-analisis-16S/07-prediccion-funcional.qmd",
        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/tab3-1-analisis-16S/08-conclusiones.qmd"
    ])
    base_spanish_full["website"]["navbar"]["right"].append({
        "text": "Resumen 16S",
        "icon": "clipboard-data",
        "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab2-resumen/tab2-1-resumen-16S/resumen.qmd"),
    })
    base_spanish_full["website"]["navbar"]["right"].append({
        "text": "Análisis 16S",
        "icon": "bar-chart",
        "menu": [
            {"text": "➤ Introducción contextual", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/tab3-1-analisis-16S/00-contexto.qmd")},
            {"text": "1. Revisión inicial de muestras y metadatos", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/tab3-1-analisis-16S/01-revision-inicial.qmd")},
            {"text": "2. Control de calidad y preprocesamiento", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/tab3-1-analisis-16S/02-control-calidad.qmd")},
            {"text": "3. Generación de ASVs y tabla de abundancia", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/tab3-1-analisis-16S/03-generacion-asvs.qmd")},
            {"text": "4. Asignación taxonómica y filogenia", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/tab3-1-analisis-16S/04-taxonomia-filogenia.qmd")},
            {"text": "5. Análisis diferencial de abundancia", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/tab3-1-analisis-16S/05-analisis-diferencial.qmd")},
            {"text": "6. Diversidad microbiana", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/tab3-1-analisis-16S/06-diversidad-microbiana.qmd")},
            {"text": "7. Predicción funcional", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/tab3-1-analisis-16S/07-prediccion-funcional.qmd")},
            {"text": "8. Conclusiones y perspectivas", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/tab3-1-analisis-16S/08-conclusiones.qmd")}
        ]
    })

def add_18S_spanish_full():
    base_spanish_full["project"]["render"].append(
        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab2-resumen/tab2-2-resumen-18S/resumen.qmd"
    )
    base_spanish_full["project"]["render"].extend([
        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/tab3-2-analisis-18S/00-contexto.qmd",
        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/tab3-2-analisis-18S/01-revision-inicial.qmd",
        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/tab3-2-analisis-18S/02-control-calidad.qmd",
        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/tab3-2-analisis-18S/03-generacion-asvs.qmd",
        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/tab3-2-analisis-18S/04-taxonomia-filogenia.qmd",
        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/tab3-2-analisis-18S/05-analisis-diferencial.qmd",
        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/tab3-2-analisis-18S/06-diversidad-microbiana.qmd",
        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/tab3-2-analisis-18S/07-prediccion-funcional.qmd",
        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/tab3-2-analisis-18S/08-conclusiones.qmd"
    ])
    base_spanish_full["website"]["navbar"]["right"].append({
        "text": "Resumen 18S",
        "icon": "clipboard-data",
        "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab2-resumen/tab2-2-resumen-18S/resumen.qmd"),
    })
    base_spanish_full["website"]["navbar"]["right"].append({
        "text": "Análisis 18S",
        "icon": "bar-chart",
        "menu": [
            {"text": "➤ Introducción contextual", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/tab3-2-analisis-18S/00-contexto.qmd")},
            {"text": "1. Revisión inicial de muestras y metadatos", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/tab3-2-analisis-18S/01-revision-inicial.qmd")},
            {"text": "2. Control de calidad y preprocesamiento", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/tab3-2-analisis-18S/02-control-calidad.qmd")},
            {"text": "3. Generación de ASVs y tabla de abundancia", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/tab3-2-analisis-18S/03-generacion-asvs.qmd")},
            {"text": "4. Asignación taxonómica y filogenia", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/tab3-2-analisis-18S/04-taxonomia-filogenia.qmd")},
            {"text": "5. Análisis diferencial de abundancia", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/tab3-2-analisis-18S/05-analisis-diferencial.qmd")},
            {"text": "6. Diversidad microbiana", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/tab3-2-analisis-18S/06-diversidad-microbiana.qmd")},
            {"text": "7. Predicción funcional", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/tab3-2-analisis-18S/07-prediccion-funcional.qmd")},
            {"text": "8. Conclusiones y perspectivas", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/tab3-2-analisis-18S/08-conclusiones.qmd")}
        ]
    })

def add_ITS_spanish_full():
    base_spanish_full["project"]["render"].append(
        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab2-resumen/tab2-3-resumen-ITS/resumen.qmd"
    )
    base_spanish_full["project"]["render"].extend([
        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/tab3-3-analisis-ITS/00-contexto.qmd",
        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/tab3-3-analisis-ITS/01-revision-inicial.qmd",
        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/tab3-3-analisis-ITS/02-control-calidad.qmd",
        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/tab3-3-analisis-ITS/03-generacion-asvs.qmd",
        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/tab3-3-analisis-ITS/04-taxonomia-filogenia.qmd",
        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/tab3-3-analisis-ITS/05-analisis-diferencial.qmd",
        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/tab3-3-analisis-ITS/06-diversidad-microbiana.qmd",
        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/tab3-3-analisis-ITS/07-prediccion-funcional.qmd",
        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/tab3-3-analisis-ITS/08-conclusiones.qmd"
    ])
    base_spanish_full["website"]["navbar"]["right"].append({
        "text": "Resumen ITS",
        "icon": "clipboard-data",
        "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab2-resumen/tab2-3-resumen-ITS/resumen.qmd"),
    })
    base_spanish_full["website"]["navbar"]["right"].append({
        "text": "Análisis ITS",
        "icon": "bar-chart",
        "menu": [
            {"text": "➤ Introducción contextual", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/tab3-3-analisis-ITS/00-contexto.qmd")},
            {"text": "1. Revisión inicial de muestras y metadatos", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/tab3-3-analisis-ITS/01-revision-inicial.qmd")},
            {"text": "2. Control de calidad y preprocesamiento", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/tab3-3-analisis-ITS/02-control-calidad.qmd")},
            {"text": "3. Generación de ASVs y tabla de abundancia", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/tab3-3-analisis-ITS/03-generacion-asvs.qmd")},
            {"text": "4. Asignación taxonómica y filogenia", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/tab3-3-analisis-ITS/04-taxonomia-filogenia.qmd")},
            {"text": "5. Análisis diferencial de abundancia", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/tab3-3-analisis-ITS/05-analisis-diferencial.qmd")},
            {"text": "6. Diversidad microbiana", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/tab3-3-analisis-ITS/06-diversidad-microbiana.qmd")},
            {"text": "7. Predicción funcional", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/tab3-3-analisis-ITS/07-prediccion-funcional.qmd")},
            {"text": "8. Conclusiones y perspectivas", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/01-spanish-language/01-full-version/tab3-analisis/tab3-3-analisis-ITS/08-conclusiones.qmd")}
        ]
    })




#----------------------------------------------------------------------------------------
# Compact version functions
#----------------------------------------------------------------------------------------

def add_16S_spanish_compact():
    base_spanish_compact["project"]["render"].append(
        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab2-resumen/tab2-1-resumen-16S/resumen.qmd"
    )
    base_spanish_compact["project"]["render"].extend([
        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/tab3-1-analisis-16S/00-contexto.qmd",
        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/tab3-1-analisis-16S/01-revision-inicial.qmd",
        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/tab3-1-analisis-16S/02-control-calidad.qmd",
        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/tab3-1-analisis-16S/03-generacion-asvs.qmd",
        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/tab3-1-analisis-16S/04-taxonomia-filogenia.qmd",
        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/tab3-1-analisis-16S/05-analisis-diferencial.qmd",
        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/tab3-1-analisis-16S/06-diversidad-microbiana.qmd",
        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/tab3-1-analisis-16S/07-prediccion-funcional.qmd",
        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/tab3-1-analisis-16S/08-conclusiones.qmd"
    ])
    base_spanish_compact["website"]["navbar"]["right"].append({
        "text": "Resumen 16S",
        "icon": "clipboard-data",
        "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab2-resumen/tab2-1-resumen-16S/resumen.qmd"),
    })
    base_spanish_compact["website"]["navbar"]["right"].append({
        "text": "Análisis 16S",
        "icon": "bar-chart",
        "menu": [
            {"text": "➤ Introducción contextual", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/tab3-1-analisis-16S/00-contexto.qmd")},
            {"text": "1. Revisión inicial de muestras y metadatos", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/tab3-1-analisis-16S/01-revision-inicial.qmd")},
            {"text": "2. Control de calidad y preprocesamiento", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/tab3-1-analisis-16S/02-control-calidad.qmd")},
            {"text": "3. Generación de ASVs y tabla de abundancia", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/tab3-1-analisis-16S/03-generacion-asvs.qmd")},
            {"text": "4. Asignación taxonómica y filogenia", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/tab3-1-analisis-16S/04-taxonomia-filogenia.qmd")},
            {"text": "5. Análisis diferencial de abundancia", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/tab3-1-analisis-16S/05-analisis-diferencial.qmd")},
            {"text": "6. Diversidad microbiana", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/tab3-1-analisis-16S/06-diversidad-microbiana.qmd")},
            {"text": "7. Predicción funcional", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/tab3-1-analisis-16S/07-prediccion-funcional.qmd")},
            {"text": "8. Conclusiones y perspectivas", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/tab3-1-analisis-16S/08-conclusiones.qmd")}
        ]
    })

def add_18S_spanish_compact():
    base_spanish_compact["project"]["render"].append(
        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab2-resumen/tab2-2-resumen-18S/resumen.qmd"
    )
    base_spanish_compact["project"]["render"].extend([
        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/tab3-2-analisis-18S/00-contexto.qmd",
        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/tab3-2-analisis-18S/01-revision-inicial.qmd",
        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/tab3-2-analisis-18S/02-control-calidad.qmd",
        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/tab3-2-analisis-18S/03-generacion-asvs.qmd",
        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/tab3-2-analisis-18S/04-taxonomia-filogenia.qmd",
        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/tab3-2-analisis-18S/05-analisis-diferencial.qmd",
        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/tab3-2-analisis-18S/06-diversidad-microbiana.qmd",
        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/tab3-2-analisis-18S/07-prediccion-funcional.qmd",
        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/tab3-2-analisis-18S/08-conclusiones.qmd"
    ])
    base_spanish_compact["website"]["navbar"]["right"].append({
        "text": "Resumen 18S",
        "icon": "clipboard-data",
        "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab2-resumen/tab2-2-resumen-18S/resumen.qmd"),
    })
    base_spanish_compact["website"]["navbar"]["right"].append({
        "text": "Análisis 18S",
        "icon": "bar-chart",
        "menu": [
            {"text": "➤ Introducción contextual", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/tab3-2-analisis-18S/00-contexto.qmd")},
            {"text": "1. Revisión inicial de muestras y metadatos", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/tab3-2-analisis-18S/01-revision-inicial.qmd")},
            {"text": "2. Control de calidad y preprocesamiento", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/tab3-2-analisis-18S/02-control-calidad.qmd")},
            {"text": "3. Generación de ASVs y tabla de abundancia", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/tab3-2-analisis-18S/03-generacion-asvs.qmd")},
            {"text": "4. Asignación taxonómica y filogenia", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/tab3-2-analisis-18S/04-taxonomia-filogenia.qmd")},
            {"text": "5. Análisis diferencial de abundancia", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/tab3-2-analisis-18S/05-analisis-diferencial.qmd")},
            {"text": "6. Diversidad microbiana", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/tab3-2-analisis-18S/06-diversidad-microbiana.qmd")},
            {"text": "7. Predicción funcional", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/tab3-2-analisis-18S/07-prediccion-funcional.qmd")},
            {"text": "8. Conclusiones y perspectivas", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/tab3-2-analisis-18S/08-conclusiones.qmd")}
        ]
    })

def add_ITS_spanish_compact():
    base_spanish_compact["project"]["render"].append(
        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab2-resumen/tab2-3-resumen-ITS/resumen.qmd"
    )
    base_spanish_compact["project"]["render"].extend([
        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/tab3-3-analisis-ITS/00-contexto.qmd",
        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/tab3-3-analisis-ITS/01-revision-inicial.qmd",
        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/tab3-3-analisis-ITS/02-control-calidad.qmd",
        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/tab3-3-analisis-ITS/03-generacion-asvs.qmd",
        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/tab3-3-analisis-ITS/04-taxonomia-filogenia.qmd",
        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/tab3-3-analisis-ITS/05-analisis-diferencial.qmd",
        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/tab3-3-analisis-ITS/06-diversidad-microbiana.qmd",
        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/tab3-3-analisis-ITS/07-prediccion-funcional.qmd",
        "resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/tab3-3-analisis-ITS/08-conclusiones.qmd"
    ])
    base_spanish_compact["website"]["navbar"]["right"].append({
        "text": "Resumen ITS",
        "icon": "clipboard-data",
        "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab2-resumen/tab2-3-resumen-ITS/resumen.qmd"),
    })
    base_spanish_compact["website"]["navbar"]["right"].append({
        "text": "Análisis ITS",
        "icon": "bar-chart",
        "menu": [
            {"text": "➤ Introducción contextual", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/tab3-3-analisis-ITS/00-contexto.qmd")},
            {"text": "1. Revisión inicial de muestras y metadatos", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/tab3-3-analisis-ITS/01-revision-inicial.qmd")},
            {"text": "2. Control de calidad y preprocesamiento", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/tab3-3-analisis-ITS/02-control-calidad.qmd")},
            {"text": "3. Generación de ASVs y tabla de abundancia", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/tab3-3-analisis-ITS/03-generacion-asvs.qmd")},
            {"text": "4. Asignación taxonómica y filogenia", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/tab3-3-analisis-ITS/04-taxonomia-filogenia.qmd")},
            {"text": "5. Análisis diferencial de abundancia", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/tab3-3-analisis-ITS/05-analisis-diferencial.qmd")},
            {"text": "6. Diversidad microbiana", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/tab3-3-analisis-ITS/06-diversidad-microbiana.qmd")},
            {"text": "7. Predicción funcional", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/tab3-3-analisis-ITS/07-prediccion-funcional.qmd")},
            {"text": "8. Conclusiones y perspectivas", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/01-spanish-language/02-compact-version/tab3-analisis/tab3-3-analisis-ITS/08-conclusiones.qmd")}
        ]
    })






#==================================================================================================
# English language functions
#==================================================================================================

#----------------------------------------------------------------------------------------
# Full version functions
#----------------------------------------------------------------------------------------

def add_16S_english_full():
    base_english_full["project"]["render"].append(
        "resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab2-resumen/tab2-1-resumen-16S/resumen.qmd"
    )
    base_english_full["project"]["render"].extend([
        "resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/tab3-1-analisis-16S/00-contexto.qmd",
        "resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/tab3-1-analisis-16S/01-revision-inicial.qmd",
        "resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/tab3-1-analisis-16S/02-control-calidad.qmd",
        "resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/tab3-1-analisis-16S/03-generacion-asvs.qmd",
        "resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/tab3-1-analisis-16S/04-taxonomia-filogenia.qmd",
        "resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/tab3-1-analisis-16S/05-analisis-diferencial.qmd",
        "resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/tab3-1-analisis-16S/06-diversidad-microbiana.qmd",
        "resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/tab3-1-analisis-16S/07-prediccion-funcional.qmd",
        "resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/tab3-1-analisis-16S/08-conclusiones.qmd"
    ])
    base_english_full["website"]["navbar"]["right"].append({
        "text": "16S Summary",
        "icon": "clipboard-data",
        "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab2-resumen/tab2-1-resumen-16S/resumen.qmd"),
    })
    base_english_full["website"]["navbar"]["right"].append({
        "text": "16S Analysis",
        "icon": "bar-chart",
        "menu": [
            {"text": "➤ Contextual introduction", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/tab3-1-analisis-16S/00-contexto.qmd")},
            {"text": "1. Initial review of samples and metadata", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/tab3-1-analisis-16S/01-revision-inicial.qmd")},
            {"text": "2. Quality control and preprocessing", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/tab3-1-analisis-16S/02-control-calidad.qmd")},
            {"text": "3. ASV generation and abundance table", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/tab3-1-analisis-16S/03-generacion-asvs.qmd")},
            {"text": "4. Taxonomic assignment and phylogeny", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/tab3-1-analisis-16S/04-taxonomia-filogenia.qmd")},
            {"text": "5. Differential abundance analysis", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/tab3-1-analisis-16S/05-analisis-diferencial.qmd")},
            {"text": "6. Microbial diversity", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/tab3-1-analisis-16S/06-diversidad-microbiana.qmd")},
            {"text": "7. Functional prediction", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/tab3-1-analisis-16S/07-prediccion-funcional.qmd")},
            {"text": "8. Conclusions and perspectives", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/tab3-1-analisis-16S/08-conclusiones.qmd")}
        ]
    })

def add_18S_english_full():
    base_english_full["project"]["render"].append(
        "resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab2-resumen/tab2-2-resumen-18S/resumen.qmd"
    )
    base_english_full["project"]["render"].extend([
        "resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/tab3-2-analisis-18S/00-contexto.qmd",
        "resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/tab3-2-analisis-18S/01-revision-inicial.qmd",
        "resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/tab3-2-analisis-18S/02-control-calidad.qmd",
        "resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/tab3-2-analisis-18S/03-generacion-asvs.qmd",
        "resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/tab3-2-analisis-18S/04-taxonomia-filogenia.qmd",
        "resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/tab3-2-analisis-18S/05-analisis-diferencial.qmd",
        "resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/tab3-2-analisis-18S/06-diversidad-microbiana.qmd",
        "resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/tab3-2-analisis-18S/07-prediccion-funcional.qmd",
        "resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/tab3-2-analisis-18S/08-conclusiones.qmd"
    ])
    base_english_full["website"]["navbar"]["right"].append({
        "text": "18S Summary",
        "icon": "clipboard-data",
        "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab2-resumen/tab2-2-resumen-18S/resumen.qmd"),
    })
    base_english_full["website"]["navbar"]["right"].append({
        "text": "18S Analysis",
        "icon": "bar-chart",
        "menu": [
            {"text": "➤ Contextual introduction", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/tab3-2-analisis-18S/00-contexto.qmd")},
            {"text": "1. Initial review of samples and metadata", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/tab3-2-analisis-18S/01-revision-inicial.qmd")},
            {"text": "2. Quality control and preprocessing", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/tab3-2-analisis-18S/02-control-calidad.qmd")},
            {"text": "3. ASV generation and abundance table", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/tab3-2-analisis-18S/03-generacion-asvs.qmd")},
            {"text": "4. Taxonomic assignment and phylogeny", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/tab3-2-analisis-18S/04-taxonomia-filogenia.qmd")},
            {"text": "5. Differential abundance analysis", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/tab3-2-analisis-18S/05-analisis-diferencial.qmd")},
            {"text": "6. Microbial diversity", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/tab3-2-analisis-18S/06-diversidad-microbiana.qmd")},
            {"text": "7. Functional prediction", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/tab3-2-analisis-18S/07-prediccion-funcional.qmd")},
            {"text": "8. Conclusions and perspectives", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/tab3-2-analisis-18S/08-conclusiones.qmd")}
        ]
    })

def add_ITS_english_full():
    base_english_full["project"]["render"].append(
        "resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab2-resumen/tab2-3-resumen-ITS/resumen.qmd"
    )
    base_english_full["project"]["render"].extend([
        "resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/tab3-3-analisis-ITS/00-contexto.qmd",
        "resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/tab3-3-analisis-ITS/01-revision-inicial.qmd",
        "resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/tab3-3-analisis-ITS/02-control-calidad.qmd",
        "resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/tab3-3-analisis-ITS/03-generacion-asvs.qmd",
        "resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/tab3-3-analisis-ITS/04-taxonomia-filogenia.qmd",
        "resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/tab3-3-analisis-ITS/05-analisis-diferencial.qmd",
        "resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/tab3-3-analisis-ITS/06-diversidad-microbiana.qmd",
        "resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/tab3-3-analisis-ITS/07-prediccion-funcional.qmd",
        "resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/tab3-3-analisis-ITS/08-conclusiones.qmd"
    ])
    base_english_full["website"]["navbar"]["right"].append({
        "text": "ITS Summary",
        "icon": "clipboard-data",
        "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab2-resumen/tab2-3-resumen-ITS/resumen.qmd"),
    })
    base_english_full["website"]["navbar"]["right"].append({
        "text": "ITS Analysis",
        "icon": "bar-chart",
        "menu": [
            {"text": "➤ Contextual introduction", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/tab3-3-analisis-ITS/00-contexto.qmd")},
            {"text": "1. Initial review of samples and metadata", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/tab3-3-analisis-ITS/01-revision-inicial.qmd")},
            {"text": "2. Quality control and preprocessing", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/tab3-3-analisis-ITS/02-control-calidad.qmd")},
            {"text": "3. ASV generation and abundance table", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/tab3-3-analisis-ITS/03-generacion-asvs.qmd")},
            {"text": "4. Taxonomic assignment and phylogeny", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/tab3-3-analisis-ITS/04-taxonomia-filogenia.qmd")},
            {"text": "5. Differential abundance analysis", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/tab3-3-analisis-ITS/05-analisis-diferencial.qmd")},
            {"text": "6. Microbial diversity", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/tab3-3-analisis-ITS/06-diversidad-microbiana.qmd")},
            {"text": "7. Functional prediction", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/tab3-3-analisis-ITS/07-prediccion-funcional.qmd")},
            {"text": "8. Conclusions and perspectives", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/02-english-language/01-full-version/tab3-analisis/tab3-3-analisis-ITS/08-conclusiones.qmd")}
        ]
    })




#----------------------------------------------------------------------------------------
# Compact version functions
#----------------------------------------------------------------------------------------

def add_16S_english_compact():
    base_english_compact["project"]["render"].append(
        "resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab2-resumen/tab2-1-resumen-16S/resumen.qmd"
    )
    base_english_compact["project"]["render"].extend([
        "resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/tab3-1-analisis-16S/00-contexto.qmd",
        "resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/tab3-1-analisis-16S/01-revision-inicial.qmd",
        "resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/tab3-1-analisis-16S/02-control-calidad.qmd",
        "resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/tab3-1-analisis-16S/03-generacion-asvs.qmd",
        "resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/tab3-1-analisis-16S/04-taxonomia-filogenia.qmd",
        "resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/tab3-1-analisis-16S/05-analisis-diferencial.qmd",
        "resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/tab3-1-analisis-16S/06-diversidad-microbiana.qmd",
        "resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/tab3-1-analisis-16S/07-prediccion-funcional.qmd",
        "resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/tab3-1-analisis-16S/08-conclusiones.qmd"
    ])
    base_english_compact["website"]["navbar"]["right"].append({
        "text": "16S Summary",
        "icon": "clipboard-data",
        "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab2-resumen/tab2-1-resumen-16S/resumen.qmd"),
    })
    base_english_compact["website"]["navbar"]["right"].append({
        "text": "16S Analysis",
        "icon": "bar-chart",
        "menu": [
            {"text": "➤ Contextual introduction", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/tab3-1-analisis-16S/00-contexto.qmd")},
            {"text": "1. Initial review of samples and metadata", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/tab3-1-analisis-16S/01-revision-inicial.qmd")},
            {"text": "2. Quality control and preprocessing", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/tab3-1-analisis-16S/02-control-calidad.qmd")},
            {"text": "3. ASV generation and abundance table", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/tab3-1-analisis-16S/03-generacion-asvs.qmd")},
            {"text": "4. Taxonomic assignment and phylogeny", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/tab3-1-analisis-16S/04-taxonomia-filogenia.qmd")},
            {"text": "5. Differential abundance analysis", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/tab3-1-analisis-16S/05-analisis-diferencial.qmd")},
            {"text": "6. Microbial diversity", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/tab3-1-analisis-16S/06-diversidad-microbiana.qmd")},
            {"text": "7. Functional prediction", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/tab3-1-analisis-16S/07-prediccion-funcional.qmd")},
            {"text": "8. Conclusions and perspectives", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/tab3-1-analisis-16S/08-conclusiones.qmd")}
        ]
    })

def add_18S_english_compact():
    base_english_compact["project"]["render"].append(
        "resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab2-resumen/tab2-2-resumen-18S/resumen.qmd"
    )
    base_english_compact["project"]["render"].extend([
        "resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/tab3-2-analisis-18S/00-contexto.qmd",
        "resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/tab3-2-analisis-18S/01-revision-inicial.qmd",
        "resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/tab3-2-analisis-18S/02-control-calidad.qmd",
        "resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/tab3-2-analisis-18S/03-generacion-asvs.qmd",
        "resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/tab3-2-analisis-18S/04-taxonomia-filogenia.qmd",
        "resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/tab3-2-analisis-18S/05-analisis-diferencial.qmd",
        "resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/tab3-2-analisis-18S/06-diversidad-microbiana.qmd",
        "resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/tab3-2-analisis-18S/07-prediccion-funcional.qmd",
        "resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/tab3-2-analisis-18S/08-conclusiones.qmd"
    ])
    base_english_compact["website"]["navbar"]["right"].append({
        "text": "18S Summary",
        "icon": "clipboard-data",
        "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab2-resumen/tab2-2-resumen-18S/resumen.qmd"),
    })
    base_english_compact["website"]["navbar"]["right"].append({
        "text": "18S Analysis",
        "icon": "bar-chart",
        "menu": [
            {"text": "➤ Contextual introduction", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/tab3-2-analisis-18S/00-contexto.qmd")},
            {"text": "1. Initial review of samples and metadata", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/tab3-2-analisis-18S/01-revision-inicial.qmd")},
            {"text": "2. Quality control and preprocessing", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/tab3-2-analisis-18S/02-control-calidad.qmd")},
            {"text": "3. ASV generation and abundance table", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/tab3-2-analisis-18S/03-generacion-asvs.qmd")},
            {"text": "4. Taxonomic assignment and phylogeny", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/tab3-2-analisis-18S/04-taxonomia-filogenia.qmd")},
            {"text": "5. Differential abundance analysis", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/tab3-2-analisis-18S/05-analisis-diferencial.qmd")},
            {"text": "6. Microbial diversity", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/tab3-2-analisis-18S/06-diversidad-microbiana.qmd")},
            {"text": "7. Functional prediction", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/tab3-2-analisis-18S/07-prediccion-funcional.qmd")},
            {"text": "8. Conclusions and perspectives", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/tab3-2-analisis-18S/08-conclusiones.qmd")}
        ]
    })

def add_ITS_english_compact():
    base_english_compact["project"]["render"].append(
        "resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab2-resumen/tab2-3-resumen-ITS/resumen.qmd"
    )
    base_english_compact["project"]["render"].extend([
        "resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/tab3-3-analisis-ITS/00-contexto.qmd",
        "resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/tab3-3-analisis-ITS/01-revision-inicial.qmd",
        "resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/tab3-3-analisis-ITS/02-control-calidad.qmd",
        "resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/tab3-3-analisis-ITS/03-generacion-asvs.qmd",
        "resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/tab3-3-analisis-ITS/04-taxonomia-filogenia.qmd",
        "resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/tab3-3-analisis-ITS/05-analisis-diferencial.qmd",
        "resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/tab3-3-analisis-ITS/06-diversidad-microbiana.qmd",
        "resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/tab3-3-analisis-ITS/07-prediccion-funcional.qmd",
        "resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/tab3-3-analisis-ITS/08-conclusiones.qmd"
    ])
    base_english_compact["website"]["navbar"]["right"].append({
        "text": "ITS Summary",
        "icon": "clipboard-data",
        "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab2-resumen/tab2-3-resumen-ITS/resumen.qmd"),
    })
    base_english_compact["website"]["navbar"]["right"].append({
        "text": "ITS Analysis",
        "icon": "bar-chart",
        "menu": [
            {"text": "➤ Contextual introduction", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/tab3-3-analisis-ITS/00-contexto.qmd")},
            {"text": "1. Initial review of samples and metadata", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/tab3-3-analisis-ITS/01-revision-inicial.qmd")},
            {"text": "2. Quality control and preprocessing", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/tab3-3-analisis-ITS/02-control-calidad.qmd")},
            {"text": "3. ASV generation and abundance table", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/tab3-3-analisis-ITS/03-generacion-asvs.qmd")},
            {"text": "4. Taxonomic assignment and phylogeny", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/tab3-3-analisis-ITS/04-taxonomia-filogenia.qmd")},
            {"text": "5. Differential abundance analysis", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/tab3-3-analisis-ITS/05-analisis-diferencial.qmd")},
            {"text": "6. Microbial diversity", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/tab3-3-analisis-ITS/06-diversidad-microbiana.qmd")},
            {"text": "7. Functional prediction", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/tab3-3-analisis-ITS/07-prediccion-funcional.qmd")},
            {"text": "8. Conclusions and perspectives", "href": DoubleQuotedScalarString("resources/01-essential/03-scripts/02-quarto/02-english-language/02-compact-version/tab3-analisis/tab3-3-analisis-ITS/08-conclusiones.qmd")}
        ]
    })










########################################################################################################################
# Inclusión de secciones según el tipo de amplicon
########################################################################################################################

# Mapeo amplicon_type -> targets
metagenomics_map = {
    1: ["16S"],
    2: ["18S"],
    3: ["ITS"],
    4: ["16S", "18S"],
    5: ["16S", "ITS"],
    6: ["18S", "ITS"],
    7: ["16S", "18S", "ITS"],
}

# Mapeo funciones disponibles por idioma y versión
funciones = {
    1: { # Español
        1: { # Full
            "16S": add_16S_spanish_full,
            "18S": add_18S_spanish_full,
            "ITS": add_ITS_spanish_full,
        },
        2: { # Compact
            "16S": add_16S_spanish_compact,
            "18S": add_18S_spanish_compact,
            "ITS": add_ITS_spanish_compact,
        }
    },
    2: { # Inglés
        1: { # Full
            "16S": add_16S_english_full,
            "18S": add_18S_english_full,
            "ITS": add_ITS_english_full,
        },
        2: { # Compact
            "16S": add_16S_english_compact,
            "18S": add_18S_english_compact,
            "ITS": add_ITS_english_compact,
        }
    }
}

# Ejecutar funciones según parámetros recibidos
for target in metagenomics_map[amplicon_type]:
    funciones[report_language][report_version][target]()










########################################################################################################################
# Guardado del archivo _quarto.yml con líneas en blanco entre bloques
########################################################################################################################

# Escoger la base correcta según el idioma y la versión
if report_language == 1:
    base = base_spanish_full if report_version == 1 else base_spanish_compact
elif report_language == 2:
    base = base_english_full if report_version == 1 else base_english_compact

# Guardado del archivo _quarto.yml con líneas en blanco entre bloques
yaml_ruamel = YAML()
yaml_ruamel.indent(sequence=4, offset=2)
yaml_ruamel.preserve_quotes = True

with open(OUTPUT_YML, "w") as f:
    keys = list(base.keys())
    for i, k in enumerate(keys):
        yaml_ruamel.dump({k: base[k]}, f)
        if i < len(keys) - 1:
            f.write("\n")

print(f"✅ Archivo _quarto.yml generado correctamente.")










########################################################################################################################
# Como probarlo
########################################################################################################################

# Para probar este script, puede ejecutar el siguiente comando en la terminal:
# python yaml_generator.py 1 1 1
