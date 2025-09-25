#!/bin/bash

# ------------------------------
# Mini Chat RAG – Launch Script Mejorado
# ------------------------------

# Configuración
PORT=8000

# Colores para terminal
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
BLUE="\033[0;34m"
RESET="\033[0m"

# Directorio donde está este script
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
# Directorio raíz del informe (usando ../../../.. como antes)
REPORT_DIR="$SCRIPT_DIR/../../../.."
# URL para abrir en navegador
URL="http://localhost:$PORT"

# Mensajes iniciales
echo -e ""
echo -e "${GREEN}🚀 Mini Chat RAG – Iniciando...${RESET}"

# Comprobar Python3
if ! command -v python3 &> /dev/null
then
    echo -e "${YELLOW}❌ Python3 no está instalado.${RESET}"
    exit 1
fi

echo -e "${GREEN}✅ Python3 detectado: $(python3 --version)${RESET}"

# Abrir navegador según SO
OS="$(uname)"
echo -e "${BLUE}🌐 Intentando abrir el navegador en ${URL}...${RESET}"
if [[ "$OS" == "Darwin" ]]; then
    open "$URL"
elif [[ "$OS" == "Linux" ]]; then
    xdg-open "$URL" 2>/dev/null || echo -e "${YELLOW}Abre $URL manualmente${RESET}"
else
    echo -e "${YELLOW}Abre $URL manualmente${RESET}"
fi

# Levantar servidor HTTP desde el directorio del informe
echo -e "${BLUE}⏳ Levantando servidor en puerto ${PORT} desde ${REPORT_DIR}...${RESET}"
echo -e "${YELLOW}⌨️ Presiona Ctrl+C para detener el servidor${RESET}"
echo -e ""

cd "$REPORT_DIR" || exit

# Ejecutar Python HTTP server
python3 -m http.server "$PORT"
