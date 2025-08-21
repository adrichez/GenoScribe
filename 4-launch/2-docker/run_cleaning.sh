#!/usr/bin/env bash
set -e

# Nombre del contenedor
PROYECTO_BASENAME="genoscribe"
CONTAINER_NAME="genoscribe_container"
MAX_RETRIES=5
RETRY_DELAY=1

echo "
🚀 Iniciando el contenedor $CONTAINER_NAME...
-------------------------------------------------------"

# Verificar si el contenedor ya está en ejecución
if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
    echo "✅ El contenedor ya está en ejecución.
    "
    echo "$CONTAINER_NAME running"
    
# Verificar si el contenedor existe pero está detenido
elif [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then
    echo "⚠️  El contenedor existe pero está detenido.
⚙️  Iniciándolo...
"
    docker start $CONTAINER_NAME

    # Bucle para esperar hasta que el contenedor esté en estado "running"
    RETRIES=0
    while [ ! "$(docker ps -q -f name=$CONTAINER_NAME)" ] && [ $RETRIES -lt $MAX_RETRIES ]; do
        echo "⏳ Esperando a que el contenedor esté listo..."
        sleep $RETRY_DELAY
        RETRIES=$((RETRIES+1))
    done

    # Si el bucle termina y el contenedor no está running, mostramos un error
    if [ ! "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
        echo "❌ No se pudo iniciar el contenedor $CONTAINER_NAME a tiempo."
        echo "Por favor, revisa los logs del contenedor con 'docker logs $CONTAINER_NAME'."
        exit 1
    fi
else
    # El contenedor no existe
    echo "❌ El contenedor $CONTAINER_NAME no existe."
    echo "Por favor, crea el contenedor con 'docker create' o 'docker run' primero."
    exit 1
fi

echo "
⏳ Abriendo la terminal bash en el contenedor...
✅ Todo listo para trabajar en el contenedor.
"
docker exec -it $CONTAINER_NAME bash -c "./$PROYECTO_BASENAME/4-launch/1-local/run_cleaning.sh"
