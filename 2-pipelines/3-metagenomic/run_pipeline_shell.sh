#!/bin/bash
set -eo pipefail

RUTA_PROYECTO="$1"
NOMBRE_EXPERIMENTO="$2"
RUTA_LOCAL_REPORTS="$3"

PROYECTO_BASENAME="genoscribe"
RUTA_PIPELINE="$(pwd)/2-pipelines/1-bulk-rna-seq"
NOMBRE_PIPELINE=$(basename "$RUTA_PIPELINE")
RUTA_COPY_REPORTS="$(pwd)/1-app/www/reports/$NOMBRE_PIPELINE"

cd "$(dirname "$0")"

echo "------------------------------------------"
echo "🚀 [RNA-Seq Pipeline] Lanzando pipeline..."
echo "------------------------------------------"
echo ""
echo "🏗️  Trabajando con los siguientes datos:"
echo "-------------------------------------"
echo "📂 Datos de usuario: $RUTA_PROYECTO"
echo "📖 Nombre del experimento: $NOMBRE_EXPERIMENTO"
echo "📂 Carpeta de reportes: $RUTA_COPY_REPORTS"
echo ""
echo "🐍 Ajustando entornos..."
echo "------------------------"

# Activar conda
if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
  source "$HOME/miniconda3/etc/profile.d/conda.sh"
  echo "✅ Conda encontrado y activado."
elif [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
  source "/opt/miniconda3/etc/profile.d/conda.sh"
  echo "✅ Conda encontrado y activado."
else
  echo "❌ No se encontró Conda."
  exit 1
fi

# Activar entorno
conda activate bulk-rna-seq
echo "✅ Entorno 'bulk-rna-seq' activado."

# Ejecutar Nextflow
echo "⏳ Ejecutando Nextflow..."
echo ""
echo ""

nextflow run main.nf -resume \
  --ruta_proyecto "$RUTA_PROYECTO" \
  --nombre_experimento "$NOMBRE_EXPERIMENTO"

echo ""
echo "🎉 Ejecución del pipeline finalizada."

# Crear carpeta si no existe
mkdir -p "$RUTA_COPY_REPORTS"

# Copiar resultados
if [ -d "report" ]; then
  echo "📂 Copiando resultados a $RUTA_COPY_REPORTS..."
  cp -r report/* "$RUTA_COPY_REPORTS/"
  echo "✅ Resultados copiados correctamente."
  echo "📂 Puede visualizar el informe generado en la ruta local: $RUTA_LOCAL_REPORTS"
  echo ""
else
  echo "⚠️  Carpeta 'report' no encontrada. No se copió ningún archivo."
  echo ""
fi
