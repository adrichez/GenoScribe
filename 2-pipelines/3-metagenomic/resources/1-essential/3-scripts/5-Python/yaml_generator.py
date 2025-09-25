import sys
from ruamel.yaml import YAML
from ruamel.yaml.scalarstring import DoubleQuotedScalarString, LiteralScalarString

# --- Archivos ---
OUTPUT_YML = "_quarto.yml"

# --- Leer parámetros desde argumentos ---
if len(sys.argv) > 1:
    try:
        tipo_analisis = int(sys.argv[1])
    except ValueError:
        print("❌ El parámetro debe ser un número entero. Ejemplo: python yml_generator.py 4")
        sys.exit(1)
else:
    tipo_analisis = 1  # valor por defecto

# --- Base del YAML ---
base = {
    "project": {
        "type": "website",
        "output-dir": "report",
        "render": [
            "index.qmd"
        ]
    },
    "resources": [
        "resources/**",
        "!resources/1-essential/3-scripts/1-R/",
        "!resources/1-essential/3-scripts/4-Python/"
    ],
    "format": {
        "html": {
            "css": "resources/1-essential/3-scripts/3-CSS/styles.css",
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
            '<link rel="shortcut icon" href="resources/1-essential/1-images/icono/favicon.svg"/>\n'
            '<link rel="icon" type="image/x-icon" href="resources/1-essential/1-images/icono/favicon.ico">'
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
        "ruta_proyecto": "",  
        "tipo_analisis": ""
    },
    "website": {
        "navbar": {
            "left": [
                {"text": "Inicio", "href": DoubleQuotedScalarString("index.qmd")}
            ]
        }
    }
}

# --- Funciones para agregar análisis y resúmenes ---
def add_16S():
    # Render
    base["project"]["render"].append("resources/1-essential/3-scripts/2-Quarto/Tab2-Resumen/Tab2-1-Resumen-16S/resumen.qmd")
    base["project"]["render"].extend([
        "resources/1-essential/3-scripts/2-Quarto/Tab3-Analisis/Tab3-1-Analisis-16S/0-contexto.qmd",
        "resources/1-essential/3-scripts/2-Quarto/Tab3-Analisis/Tab3-1-Analisis-16S/1-revision-inicial.qmd",
        "resources/1-essential/3-scripts/2-Quarto/Tab3-Analisis/Tab3-1-Analisis-16S/2-evaluacion-calidad.qmd",
        "resources/1-essential/3-scripts/2-Quarto/Tab3-Analisis/Tab3-1-Analisis-16S/3-alineamiento.qmd",
        "resources/1-essential/3-scripts/2-Quarto/Tab3-Analisis/Tab3-1-Analisis-16S/4-cuantificacion.qmd",
        "resources/1-essential/3-scripts/2-Quarto/Tab3-Analisis/Tab3-1-Analisis-16S/5-analisis-estadistico.qmd",
        "resources/1-essential/3-scripts/2-Quarto/Tab3-Analisis/Tab3-1-Analisis-16S/6-conclusiones.qmd"
    ])
    # Navbar
    base["website"]["navbar"]["left"].append({
        "text": "Resumen 16S",
        "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-Quarto/Tab2-Resumen/Tab2-1-Resumen-16S/resumen.qmd")
    })
    base["website"]["navbar"]["left"].append({
        "text": "Análisis 16S",
        "menu": [
            {"text": "Introducción contextual", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-Quarto/Tab3-Analisis/Tab3-1-Analisis-16S/0-contexto.qmd")},
            {"text": "1. Revisión inicial de muestras y metadatos", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-Quarto/Tab3-Analisis/Tab3-1-Analisis-16S/1-revision-inicial.qmd")},
            {"text": "2. Evaluación de calidad de las lecturas", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-Quarto/Tab3-Analisis/Tab3-1-Analisis-16S/2-evaluacion-calidad.qmd")},
            {"text": "3. Alineamiento de las lecturas", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-Quarto/Tab3-Analisis/Tab3-1-Analisis-16S/3-alineamiento.qmd")},
            {"text": "4. Cuantificación de la expresión génica", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-Quarto/Tab3-Analisis/Tab3-1-Analisis-16S/4-cuantificacion.qmd")},
            {"text": "5. Análisis estadístico de la expresión génica", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-Quarto/Tab3-Analisis/Tab3-1-Analisis-16S/5-analisis-estadistico.qmd")},
            {"text": "6. Conclusiones y perspectivas", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-Quarto/Tab3-Analisis/Tab3-1-Analisis-16S/6-conclusiones.qmd")}
        ]
    })

def add_18S():
    base["project"]["render"].append("resources/1-essential/3-scripts/2-Quarto/Tab2-Resumen/Tab2-2-Resumen-18S/resumen.qmd")
    base["project"]["render"].append("resources/1-essential/3-scripts/2-Quarto/Tab3-Analisis/Tab3-2-Analisis-18S/0-contexto.qmd")
    base["website"]["navbar"]["left"].append({
        "text": "Resumen 18S",
        "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-Quarto/Tab2-Resumen/Tab2-2-Resumen-18S/resumen.qmd")
    })
    base["website"]["navbar"]["left"].append({
        "text": "Análisis 18S",
        "menu": [
            {"text": "Introducción contextual", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-Quarto/Tab3-Analisis/Tab3-2-Analisis-18S/0-contexto.qmd")}
        ]
    })

def add_ITS():
    base["project"]["render"].append("resources/1-essential/3-scripts/2-Quarto/Tab2-Resumen/Tab2-3-Resumen-ITS/resumen.qmd")
    base["project"]["render"].append("resources/1-essential/3-scripts/2-Quarto/Tab3-Analisis/Tab3-3-Analisis-ITS/0-contexto.qmd")
    base["website"]["navbar"]["left"].append({
        "text": "Resumen ITS",
        "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-Quarto/Tab2-Resumen/Tab2-3-Resumen-ITS/resumen.qmd")
    })
    base["website"]["navbar"]["left"].append({
        "text": "Análisis ITS",
        "menu": [
            {"text": "Introducción contextual", "href": DoubleQuotedScalarString("resources/1-essential/3-scripts/2-Quarto/Tab3-Analisis/Tab3-3-Analisis-ITS/0-contexto.qmd")}
        ]
    })

# --- Incluir análisis según tipo ---
if tipo_analisis in [1,4,5,7]: add_16S()
if tipo_analisis in [2,4,6,7]: add_18S()
if tipo_analisis in [3,5,6,7]: add_ITS()

# --- Guardar con líneas en blanco entre bloques ---
yaml_ruamel = YAML()
yaml_ruamel.indent(sequence=4, offset=2)
yaml_ruamel.preserve_quotes = True

with open(OUTPUT_YML, "w") as f:
    keys = list(base.keys())
    for i, k in enumerate(keys):
        yaml_ruamel.dump({k: base[k]}, f)
        if i < len(keys) - 1:
            f.write("\n")

print(f"✅ _quarto.yml generado para tipo_analisis={tipo_analisis}")
