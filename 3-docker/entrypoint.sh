#!/usr/bin/env bash
set -e

echo "
⚙️  [Entrypoint] Realizando ajustes iniciales...
------------------------------------------------"

# Gestionar permisos
chmod -R u+rwX /srv/shiny-server
chown -R shiny:shiny /srv/shiny-server || echo "⚠️ Algunos archivos no pudieron cambiar ownership"
chmod -R u+rwX /project
chown -R shiny:shiny /project || echo "⚠️ Algunos archivos no pudieron cambiar ownership"

# Mensaje de estado
echo "👍 Carpetas y permisos listos. 
⚙️  Arrancando Shiny Server...
⏳ Iniciando el servidor...
"

# Arrancar Shiny Server
exec /usr/bin/shiny-server
