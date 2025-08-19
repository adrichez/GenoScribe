#!/bin/bash
set -eo pipefail

RUTA_PROYECTO="$1"
NOMBRE_EXPERIMENTO="$2"

cd "$(dirname "$0")"

echo "
🚀 [RNA-Seq Pipeline] Lanzando pipeline...
------------------------------------------"

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
echo "⏳ Ejecutando Nextflow...
"

nextflow run main.nf -resume \
  --ruta_proyecto "$RUTA_PROYECTO" \
  --nombre_experimento "$NOMBRE_EXPERIMENTO"

echo "🎉 [RNA-Seq Pipeline] Ejecución del pipeline finalizado.
"
