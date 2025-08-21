#!/usr/bin/env bash
set -e

echo ""
echo "⚙️  [Entrypoint] Realizando ajustes iniciales..."
echo "------------------------------------------------"

# Gestionar permisos
chmod -R u+rwX /srv/shiny-server
chown -R shiny:shiny /srv/shiny-server || echo "⚠️ Algunos archivos no pudieron cambiar ownership"
chmod -R u+rwX /project
chown -R shiny:shiny /project || echo "⚠️ Algunos archivos no pudieron cambiar ownership"

# Mensaje de estado
echo "👍 Carpetas y permisos listos."
echo "⚙️  Arrancando Shiny Server..."
echo "⏳ Iniciando el servidor..."
echo ""

# Arrancar Shiny Server
exec /usr/bin/shiny-server
