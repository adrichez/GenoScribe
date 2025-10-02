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
analysis_type = 1
report_version = "full"

# Validaciones
valid_analysis = set(range(1, 8))  # valores válidos: 1 a 7
valid_versions = {"full", "compact"}

if len(sys.argv) > 1:
    # Primer argumento: analysis_type
    try:
        analysis_type = int(sys.argv[1])
        if analysis_type not in valid_analysis:
            print(f"❌ El parámetro 'analysis_type' debe estar entre 1 y 7.")
            sys.exit(1)
    except ValueError:
        print("❌ El parámetro 'analysis_type' debe ser un número entero entre 1 y 7.")
        sys.exit(1)

if len(sys.argv) > 2:
    # Segundo argumento: report_version
    report_version = sys.argv[2].lower()
    if report_version not in valid_versions:
        print("❌ El parámetro 'report_version' debe ser 'full' o 'compact'.")
        sys.exit(1)

print(f"✅ Parámetros recibidos -> analysis_type: {analysis_type}, report_version: {report_version}")






########################################################################################################################
# Definir la estructura base del archivo YAML
########################################################################################################################

#========================================================================================================
# Estructura base del archivo YAML
#========================================================================================================

#---------------------------------------------------------------------------------------------
# Full version base structure
#---------------------------------------------------------------------------------------------

base_full = {
    "project": {
        "type": "website",
        "output-dir": "report",
        "render": [
            "full_report.qmd",
            "resources/1-essential/3-scripts/2-quarto/1-full-version/tab1-metodologia/metodologia.qmd",
        ]
    },
    "resources": [
        "resources/**",
        "!resources/1-essential/3-scripts/1-r/",
        "!resources/1-essential/3-scripts/5-python/"
    ],
    "format": {
        "html": {
            "css": "resources/1-essential/3-scripts/3-css/styles.css",
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
            "<link rel=\"shortcut icon\" href=\"resources/1-essential/1-images/icons/favicon.svg\"/>\n"
            "<link rel=\"icon\" type=\"image/x-icon\" href=\"resources/1-essential/1-images/icons/favicon.ico\">"
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
        "analysis_type": "",
        "report_version": ""
    },
    "website": {
        "navbar": {
            "title": LiteralScalarString(
                "<img class=\'brand-logo\' src=\'/resources/1-essential/1-images/icons/ipbln_background.png\'>\n"
                "<a class=\'brand-text\' href=\'https://www.ipb.csic.es/servicios/Bioinformatica/index.html\'>IPBLN</a>"
            ),
            "right": [
                {
                    "text": "Inicio",
                    "icon": "house",
                    "href": DoubleQuotedScalarString("full_report.qmd")
                },
                {
                    "text": "Metodología",
                    "icon": "wrench",
                    "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/1-full-version/tab1-metodologia/metodologia.qmd"),
                }
            ]
        }
    },
    "clean": False
}



#---------------------------------------------------------------------------------------------
# Compact version base structure
#---------------------------------------------------------------------------------------------

base_compact = {
    "project": {
        "type": "website",
        "output-dir": "report",
        "render": [
            "compact_report.qmd",
            "resources/1-essential/3-scripts/2-quarto/2-compact-version/tab1-metodologia/metodologia.qmd",
        ]
    },
    "resources": [
        "resources/**",
        "!resources/1-essential/3-scripts/1-r/",
        "!resources/1-essential/3-scripts/5-python/"
    ],
    "format": {
        "html": {
            "css": "resources/1-essential/3-scripts/3-css/styles.css",
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
            "<link rel=\"shortcut icon\" href=\"resources/1-essential/1-images/icons/favicon.svg\"/>\n"
            "<link rel=\"icon\" type=\"image/x-icon\" href=\"resources/1-essential/1-images/icons/favicon.ico\">"
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
        "analysis_type": "",
        "report_version": ""
    },
    "website": {
        "navbar": {
            "title": LiteralScalarString(
                "<img class=\'brand-logo\' src=\'/resources/1-essential/1-images/icons/ipbln_background.png\'>\n"
                "<a class=\'brand-text\' href=\'https://www.ipb.csic.es/servicios/Bioinformatica/index.html\'>IPBLN</a>"
            ),
            "right": [
                {
                    "text": "Inicio",
                    "icon": "house",
                    "href": DoubleQuotedScalarString("compact_report.qmd")
                },
                {
                    "text": "Metodología",
                    "icon": "wrench",
                    "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/2-compact-version/tab1-metodologia/metodologia.qmd"),
                }
            ]
        }
    },
    "clean": False
}






#========================================================================================================
# Funciones para agregar secciones específicas según el tipo de análisis
#========================================================================================================

#---------------------------------------------------------------------------------------------
# Full version functions
#---------------------------------------------------------------------------------------------

def add_16S_full():
    base_full["project"]["render"].append(
        "resources/1-essential/3-scripts/2-quarto/1-full-version/tab2-resumen/tab2-1-resumen-16S/resumen.qmd"
    )
    base_full["project"]["render"].extend([
        "resources/1-essential/3-scripts/2-quarto/1-full-version/tab3-analisis/tab3-1-analisis-16S/0-contexto.qmd",
        "resources/1-essential/3-scripts/2-quarto/1-full-version/tab3-analisis/tab3-1-analisis-16S/1-revision-inicial.qmd",
        "resources/1-essential/3-scripts/2-quarto/1-full-version/tab3-analisis/tab3-1-analisis-16S/2-control-calidad.qmd",
        "resources/1-essential/3-scripts/2-quarto/1-full-version/tab3-analisis/tab3-1-analisis-16S/3-generacion-asvs.qmd",
        "resources/1-essential/3-scripts/2-quarto/1-full-version/tab3-analisis/tab3-1-analisis-16S/4-taxonomia-filogenia.qmd",
        "resources/1-essential/3-scripts/2-quarto/1-full-version/tab3-analisis/tab3-1-analisis-16S/5-analisis-diferencial.qmd",
        "resources/1-essential/3-scripts/2-quarto/1-full-version/tab3-analisis/tab3-1-analisis-16S/6-diversidad-microbiana.qmd",
        "resources/1-essential/3-scripts/2-quarto/1-full-version/tab3-analisis/tab3-1-analisis-16S/7-prediccion-funcional.qmd",
        "resources/1-essential/3-scripts/2-quarto/1-full-version/tab3-analisis/tab3-1-analisis-16S/8-conclusiones.qmd"
    ])
    base_full["website"]["navbar"]["right"].append({
        "text": "Resumen 16S",
        "icon": "clipboard-data",
        "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/1-full-version/tab2-resumen/tab2-1-resumen-16S/resumen.qmd"),
    })
    base_full["website"]["navbar"]["right"].append({
        "text": "Análisis 16S",
        "icon": "bar-chart",
        "menu": [
            {"text": "➤ Introducción contextual", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/1-full-version/tab3-analisis/tab3-1-analisis-16S/0-contexto.qmd")},
            {"text": "1. Revisión inicial de muestras y metadatos", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/1-full-version/tab3-analisis/tab3-1-analisis-16S/1-revision-inicial.qmd")},
            {"text": "2. Control de calidad y preprocesamiento", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/1-full-version/tab3-analisis/tab3-1-analisis-16S/2-control-calidad.qmd")},
            {"text": "3. Generación de ASVs y tabla de abundancia", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/1-full-version/tab3-analisis/tab3-1-analisis-16S/3-generacion-asvs.qmd")},
            {"text": "4. Asignación taxonómica y filogenia", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/1-full-version/tab3-analisis/tab3-1-analisis-16S/4-taxonomia-filogenia.qmd")},
            {"text": "5. Análisis diferencial de abundancia", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/1-full-version/tab3-analisis/tab3-1-analisis-16S/5-analisis-diferencial.qmd")},
            {"text": "6. Diversidad microbiana", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/1-full-version/tab3-analisis/tab3-1-analisis-16S/6-diversidad-microbiana.qmd")},
            {"text": "7. Predicción funcional", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/1-full-version/tab3-analisis/tab3-1-analisis-16S/7-prediccion-funcional.qmd")},
            {"text": "8. Conclusiones y perspectivas", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/1-full-version/tab3-analisis/tab3-1-analisis-16S/8-conclusiones.qmd")}
        ]
    })

def add_18S_full():
    base_full["project"]["render"].append(
        "resources/1-essential/3-scripts/2-quarto/1-full-version/tab2-resumen/tab2-1-resumen-18S/resumen.qmd"
    )
    base_full["project"]["render"].extend([
        "resources/1-essential/3-scripts/2-quarto/1-full-version/tab3-analisis/tab3-1-analisis-18S/0-contexto.qmd",
        "resources/1-essential/3-scripts/2-quarto/1-full-version/tab3-analisis/tab3-1-analisis-18S/1-revision-inicial.qmd",
        "resources/1-essential/3-scripts/2-quarto/1-full-version/tab3-analisis/tab3-1-analisis-18S/2-control-calidad.qmd",
        "resources/1-essential/3-scripts/2-quarto/1-full-version/tab3-analisis/tab3-1-analisis-18S/3-generacion-asvs.qmd",
        "resources/1-essential/3-scripts/2-quarto/1-full-version/tab3-analisis/tab3-1-analisis-18S/4-taxonomia-filogenia.qmd",
        "resources/1-essential/3-scripts/2-quarto/1-full-version/tab3-analisis/tab3-1-analisis-18S/5-analisis-diferencial.qmd",
        "resources/1-essential/3-scripts/2-quarto/1-full-version/tab3-analisis/tab3-1-analisis-18S/6-diversidad-microbiana.qmd",
        "resources/1-essential/3-scripts/2-quarto/1-full-version/tab3-analisis/tab3-1-analisis-18S/7-prediccion-funcional.qmd",
        "resources/1-essential/3-scripts/2-quarto/1-full-version/tab3-analisis/tab3-1-analisis-18S/8-conclusiones.qmd"
    ])
    base_full["website"]["navbar"]["right"].append({
        "text": "Resumen 18S",
        "icon": "clipboard-data",
        "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/1-full-version/tab2-resumen/tab2-1-resumen-18S/resumen.qmd"),
    })
    base_full["website"]["navbar"]["right"].append({
        "text": "Análisis 18S",
        "icon": "bar-chart",
        "menu": [
            {"text": "➤ Introducción contextual", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/1-full-version/tab3-analisis/tab3-1-analisis-18S/0-contexto.qmd")},
            {"text": "1. Revisión inicial de muestras y metadatos", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/1-full-version/tab3-analisis/tab3-1-analisis-18S/1-revision-inicial.qmd")},
            {"text": "2. Control de calidad y preprocesamiento", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/1-full-version/tab3-analisis/tab3-1-analisis-18S/2-control-calidad.qmd")},
            {"text": "3. Generación de ASVs y tabla de abundancia", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/1-full-version/tab3-analisis/tab3-1-analisis-18S/3-generacion-asvs.qmd")},
            {"text": "4. Asignación taxonómica y filogenia", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/1-full-version/tab3-analisis/tab3-1-analisis-18S/4-taxonomia-filogenia.qmd")},
            {"text": "5. Análisis diferencial de abundancia", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/1-full-version/tab3-analisis/tab3-1-analisis-18S/5-analisis-diferencial.qmd")},
            {"text": "6. Diversidad microbiana", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/1-full-version/tab3-analisis/tab3-1-analisis-18S/6-diversidad-microbiana.qmd")},
            {"text": "7. Predicción funcional", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/1-full-version/tab3-analisis/tab3-1-analisis-18S/7-prediccion-funcional.qmd")},
            {"text": "8. Conclusiones y perspectivas", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/1-full-version/tab3-analisis/tab3-1-analisis-18S/8-conclusiones.qmd")}
        ]
    })

def add_ITS_full():
    base_full["project"]["render"].append(
        "resources/1-essential/3-scripts/2-quarto/1-full-version/tab2-resumen/tab2-1-resumen-ITS/resumen.qmd"
    )
    base_full["project"]["render"].extend([
        "resources/1-essential/3-scripts/2-quarto/1-full-version/tab3-analisis/tab3-1-analisis-ITS/0-contexto.qmd",
        "resources/1-essential/3-scripts/2-quarto/1-full-version/tab3-analisis/tab3-1-analisis-ITS/1-revision-inicial.qmd",
        "resources/1-essential/3-scripts/2-quarto/1-full-version/tab3-analisis/tab3-1-analisis-ITS/2-control-calidad.qmd",
        "resources/1-essential/3-scripts/2-quarto/1-full-version/tab3-analisis/tab3-1-analisis-ITS/3-generacion-asvs.qmd",
        "resources/1-essential/3-scripts/2-quarto/1-full-version/tab3-analisis/tab3-1-analisis-ITS/4-taxonomia-filogenia.qmd",
        "resources/1-essential/3-scripts/2-quarto/1-full-version/tab3-analisis/tab3-1-analisis-ITS/5-analisis-diferencial.qmd",
        "resources/1-essential/3-scripts/2-quarto/1-full-version/tab3-analisis/tab3-1-analisis-ITS/6-diversidad-microbiana.qmd",
        "resources/1-essential/3-scripts/2-quarto/1-full-version/tab3-analisis/tab3-1-analisis-ITS/7-prediccion-funcional.qmd",
        "resources/1-essential/3-scripts/2-quarto/1-full-version/tab3-analisis/tab3-1-analisis-ITS/8-conclusiones.qmd"
    ])
    base_full["website"]["navbar"]["right"].append({
        "text": "Resumen ITS",
        "icon": "clipboard-data",
        "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/1-full-version/tab2-resumen/tab2-1-resumen-ITS/resumen.qmd"),
    })
    base_full["website"]["navbar"]["right"].append({
        "text": "Análisis ITS",
        "icon": "bar-chart",
        "menu": [
            {"text": "➤ Introducción contextual", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/1-full-version/tab3-analisis/tab3-1-analisis-ITS/0-contexto.qmd")},
            {"text": "1. Revisión inicial de muestras y metadatos", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/1-full-version/tab3-analisis/tab3-1-analisis-ITS/1-revision-inicial.qmd")},
            {"text": "2. Control de calidad y preprocesamiento", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/1-full-version/tab3-analisis/tab3-1-analisis-ITS/2-control-calidad.qmd")},
            {"text": "3. Generación de ASVs y tabla de abundancia", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/1-full-version/tab3-analisis/tab3-1-analisis-ITS/3-generacion-asvs.qmd")},
            {"text": "4. Asignación taxonómica y filogenia", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/1-full-version/tab3-analisis/tab3-1-analisis-ITS/4-taxonomia-filogenia.qmd")},
            {"text": "5. Análisis diferencial de abundancia", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/1-full-version/tab3-analisis/tab3-1-analisis-ITS/5-analisis-diferencial.qmd")},
            {"text": "6. Diversidad microbiana", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/1-full-version/tab3-analisis/tab3-1-analisis-ITS/6-diversidad-microbiana.qmd")},
            {"text": "7. Predicción funcional", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/1-full-version/tab3-analisis/tab3-1-analisis-ITS/7-prediccion-funcional.qmd")},
            {"text": "8. Conclusiones y perspectivas", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/1-full-version/tab3-analisis/tab3-1-analisis-ITS/8-conclusiones.qmd")}
        ]
    })



#---------------------------------------------------------------------------------------------
# Compact version functions
#---------------------------------------------------------------------------------------------

def add_16S_compact():
    base_compact["project"]["render"].append(
        "resources/1-essential/3-scripts/2-quarto/2-compact-version/tab2-resumen/tab2-1-resumen-16S/resumen.qmd"
    )
    base_compact["project"]["render"].extend([
        "resources/1-essential/3-scripts/2-quarto/2-compact-version/tab3-analisis/tab3-1-analisis-16S/0-contexto.qmd",
        "resources/1-essential/3-scripts/2-quarto/2-compact-version/tab3-analisis/tab3-1-analisis-16S/1-revision-inicial.qmd",
        "resources/1-essential/3-scripts/2-quarto/2-compact-version/tab3-analisis/tab3-1-analisis-16S/2-control-calidad.qmd",
        "resources/1-essential/3-scripts/2-quarto/2-compact-version/tab3-analisis/tab3-1-analisis-16S/3-generacion-asvs.qmd",
        "resources/1-essential/3-scripts/2-quarto/2-compact-version/tab3-analisis/tab3-1-analisis-16S/4-taxonomia-filogenia.qmd",
        "resources/1-essential/3-scripts/2-quarto/2-compact-version/tab3-analisis/tab3-1-analisis-16S/5-analisis-diferencial.qmd",
        "resources/1-essential/3-scripts/2-quarto/2-compact-version/tab3-analisis/tab3-1-analisis-16S/6-diversidad-microbiana.qmd",
        "resources/1-essential/3-scripts/2-quarto/2-compact-version/tab3-analisis/tab3-1-analisis-16S/7-prediccion-funcional.qmd",
        "resources/1-essential/3-scripts/2-quarto/2-compact-version/tab3-analisis/tab3-1-analisis-16S/8-conclusiones.qmd"
    ])
    base_compact["website"]["navbar"]["right"].append({
        "text": "Resumen 16S",
        "icon": "clipboard-data",
        "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/2-compact-version/tab2-resumen/tab2-1-resumen-16S/resumen.qmd"),
    })
    base_compact["website"]["navbar"]["right"].append({
        "text": "Análisis 16S",
        "icon": "bar-chart",
        "menu": [
            {"text": "➤ Introducción contextual", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/2-compact-version/tab3-analisis/tab3-1-analisis-16S/0-contexto.qmd")},
            {"text": "1. Revisión inicial de muestras y metadatos", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/2-compact-version/tab3-analisis/tab3-1-analisis-16S/1-revision-inicial.qmd")},
            {"text": "2. Control de calidad y preprocesamiento", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/2-compact-version/tab3-analisis/tab3-1-analisis-16S/2-control-calidad.qmd")},
            {"text": "3. Generación de ASVs y tabla de abundancia", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/2-compact-version/tab3-analisis/tab3-1-analisis-16S/3-generacion-asvs.qmd")},
            {"text": "4. Asignación taxonómica y filogenia", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/2-compact-version/tab3-analisis/tab3-1-analisis-16S/4-taxonomia-filogenia.qmd")},
            {"text": "5. Análisis diferencial de abundancia", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/2-compact-version/tab3-analisis/tab3-1-analisis-16S/5-analisis-diferencial.qmd")},
            {"text": "6. Diversidad microbiana", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/2-compact-version/tab3-analisis/tab3-1-analisis-16S/6-diversidad-microbiana.qmd")},
            {"text": "7. Predicción funcional", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/2-compact-version/tab3-analisis/tab3-1-analisis-16S/7-prediccion-funcional.qmd")},
            {"text": "8. Conclusiones y perspectivas", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/2-compact-version/tab3-analisis/tab3-1-analisis-16S/8-conclusiones.qmd")}
        ]
    })

def add_18S_compact():
    base_compact["project"]["render"].append(
        "resources/1-essential/3-scripts/2-quarto/2-compact-version/tab2-resumen/tab2-1-resumen-18S/resumen.qmd"
    )
    base_compact["project"]["render"].extend([
        "resources/1-essential/3-scripts/2-quarto/2-compact-version/tab3-analisis/tab3-1-analisis-18S/0-contexto.qmd",
        "resources/1-essential/3-scripts/2-quarto/2-compact-version/tab3-analisis/tab3-1-analisis-18S/1-revision-inicial.qmd",
        "resources/1-essential/3-scripts/2-quarto/2-compact-version/tab3-analisis/tab3-1-analisis-18S/2-control-calidad.qmd",
        "resources/1-essential/3-scripts/2-quarto/2-compact-version/tab3-analisis/tab3-1-analisis-18S/3-generacion-asvs.qmd",
        "resources/1-essential/3-scripts/2-quarto/2-compact-version/tab3-analisis/tab3-1-analisis-18S/4-taxonomia-filogenia.qmd",
        "resources/1-essential/3-scripts/2-quarto/2-compact-version/tab3-analisis/tab3-1-analisis-18S/5-analisis-diferencial.qmd",
        "resources/1-essential/3-scripts/2-quarto/2-compact-version/tab3-analisis/tab3-1-analisis-18S/6-diversidad-microbiana.qmd",
        "resources/1-essential/3-scripts/2-quarto/2-compact-version/tab3-analisis/tab3-1-analisis-18S/7-prediccion-funcional.qmd",
        "resources/1-essential/3-scripts/2-quarto/2-compact-version/tab3-analisis/tab3-1-analisis-18S/8-conclusiones.qmd"
    ])
    base_compact["website"]["navbar"]["right"].append({
        "text": "Resumen 18S",
        "icon": "clipboard-data",
        "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/2-compact-version/tab2-resumen/tab2-1-resumen-ITS/resumen.qmd"),
    })
    base_compact["website"]["navbar"]["right"].append({
        "text": "Análisis 18S",
        "icon": "bar-chart",
        "menu": [
            {"text": "➤ Introducción contextual", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/2-compact-version/tab3-analisis/tab3-1-analisis-18S/0-contexto.qmd")},
            {"text": "1. Revisión inicial de muestras y metadatos", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/2-compact-version/tab3-analisis/tab3-1-analisis-18S/1-revision-inicial.qmd")},
            {"text": "2. Control de calidad y preprocesamiento", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/2-compact-version/tab3-analisis/tab3-1-analisis-18S/2-control-calidad.qmd")},
            {"text": "3. Generación de ASVs y tabla de abundancia", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/2-compact-version/tab3-analisis/tab3-1-analisis-18S/3-generacion-asvs.qmd")},
            {"text": "4. Asignación taxonómica y filogenia", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/2-compact-version/tab3-analisis/tab3-1-analisis-18S/4-taxonomia-filogenia.qmd")},
            {"text": "5. Análisis diferencial de abundancia", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/2-compact-version/tab3-analisis/tab3-1-analisis-18S/5-analisis-diferencial.qmd")},
            {"text": "6. Diversidad microbiana", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/2-compact-version/tab3-analisis/tab3-1-analisis-18S/6-diversidad-microbiana.qmd")},
            {"text": "7. Predicción funcional", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/2-compact-version/tab3-analisis/tab3-1-analisis-18S/7-prediccion-funcional.qmd")},
            {"text": "8. Conclusiones y perspectivas", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/2-compact-version/tab3-analisis/tab3-1-analisis-18S/8-conclusiones.qmd")}
        ]
    })

def add_ITS_compact():
    base_compact["project"]["render"].append(
        "resources/1-essential/3-scripts/2-quarto/2-compact-version/tab2-resumen/tab2-1-resumen-ITS/resumen.qmd"
    )
    base_compact["project"]["render"].extend([
        "resources/1-essential/3-scripts/2-quarto/2-compact-version/tab3-analisis/tab3-1-analisis-ITS/0-contexto.qmd",
        "resources/1-essential/3-scripts/2-quarto/2-compact-version/tab3-analisis/tab3-1-analisis-ITS/1-revision-inicial.qmd",
        "resources/1-essential/3-scripts/2-quarto/2-compact-version/tab3-analisis/tab3-1-analisis-ITS/2-control-calidad.qmd",
        "resources/1-essential/3-scripts/2-quarto/2-compact-version/tab3-analisis/tab3-1-analisis-ITS/3-generacion-asvs.qmd",
        "resources/1-essential/3-scripts/2-quarto/2-compact-version/tab3-analisis/tab3-1-analisis-ITS/4-taxonomia-filogenia.qmd",
        "resources/1-essential/3-scripts/2-quarto/2-compact-version/tab3-analisis/tab3-1-analisis-ITS/5-analisis-diferencial.qmd",
        "resources/1-essential/3-scripts/2-quarto/2-compact-version/tab3-analisis/tab3-1-analisis-ITS/6-diversidad-microbiana.qmd",
        "resources/1-essential/3-scripts/2-quarto/2-compact-version/tab3-analisis/tab3-1-analisis-ITS/7-prediccion-funcional.qmd",
        "resources/1-essential/3-scripts/2-quarto/2-compact-version/tab3-analisis/tab3-1-analisis-ITS/8-conclusiones.qmd"
    ])
    base_compact["website"]["navbar"]["right"].append({
        "text": "Resumen ITS",
        "icon": "clipboard-data",
        "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/2-compact-version/tab2-resumen/tab2-1-resumen-ITS/resumen.qmd"),
    })
    base_compact["website"]["navbar"]["right"].append({
        "text": "Análisis ITS",
        "icon": "bar-chart",
        "menu": [
            {"text": "➤ Introducción contextual", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/2-compact-version/tab3-analisis/tab3-1-analisis-ITS/0-contexto.qmd")},
            {"text": "1. Revisión inicial de muestras y metadatos", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/2-compact-version/tab3-analisis/tab3-1-analisis-ITS/1-revision-inicial.qmd")},
            {"text": "2. Control de calidad y preprocesamiento", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/2-compact-version/tab3-analisis/tab3-1-analisis-ITS/2-control-calidad.qmd")},
            {"text": "3. Generación de ASVs y tabla de abundancia", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/2-compact-version/tab3-analisis/tab3-1-analisis-ITS/3-generacion-asvs.qmd")},
            {"text": "4. Asignación taxonómica y filogenia", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/2-compact-version/tab3-analisis/tab3-1-analisis-ITS/4-taxonomia-filogenia.qmd")},
            {"text": "5. Análisis diferencial de abundancia", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/2-compact-version/tab3-analisis/tab3-1-analisis-ITS/5-analisis-diferencial.qmd")},
            {"text": "6. Diversidad microbiana", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/2-compact-version/tab3-analisis/tab3-1-analisis-ITS/6-diversidad-microbiana.qmd")},
            {"text": "7. Predicción funcional", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/2-compact-version/tab3-analisis/tab3-1-analisis-ITS/7-prediccion-funcional.qmd")},
            {"text": "8. Conclusiones y perspectivas", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-quarto/2-compact-version/tab3-analisis/tab3-1-analisis-ITS/8-conclusiones.qmd")}
        ]
    })






########################################################################################################################
# Inclusión de secciones según el tipo de análisis
########################################################################################################################

# Mapeo analysis_type -> targets
analysis_map = {
    1: ["16S"],
    2: ["18S"],
    3: ["ITS"],
    4: ["16S", "18S"],
    5: ["16S", "ITS"],
    6: ["18S", "ITS"],
    7: ["16S", "18S", "ITS"],
}

# Mapeo funciones disponibles por versión
funciones = {
    "full": {
        "16S": add_16S_full,
        "18S": add_18S_full,
        "ITS": add_ITS_full,
    },
    "compact": {
        "16S": add_16S_compact,
        "18S": add_18S_compact,
        "ITS": add_ITS_compact,
    }
}

# Ejecutar funciones según parámetros recibidos
for target in analysis_map[analysis_type]:
    funciones[report_version][target]()






########################################################################################################################
# Guardado del archivo _quarto.yml con líneas en blanco entre bloques
########################################################################################################################

# Escoger la base correcta
base = base_full if report_version == "full" else base_compact

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
