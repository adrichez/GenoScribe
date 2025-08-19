#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
# PROCESAR RPKM
#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

args <- commandArgs(trailingOnly = TRUE)
ruta_proyecto <- args[1]
nombre_experimento <- args[2]
directorio_salida <- args[3]

# Construir ruta al archivo .xls
archivo_rpkm <- file.path(ruta_proyecto, "Resultados", nombre_experimento, paste0(nombre_experimento, "_RPKM.xls"))

# Verificar si el archivo existe
if (!file.exists(archivo_rpkm)) {
  stop(paste("No se encuentra el archivo:", archivo_rpkm))
}

# Leer matriz
matriz <- read.table(archivo_rpkm, header = TRUE, fill = TRUE, stringsAsFactors = FALSE)
rownames(matriz) <- matriz[[1]]
matriz <- matriz[, -1]

# Crear directorio de salida si no existe
if (!dir.exists(directorio_salida)) {
  dir.create(directorio_salida, recursive = TRUE)
}

# Ruta final para el TXT
archivo_txt <- file.path(directorio_salida, paste0(nombre_experimento, "_RPKM.txt"))
write.table(matriz, file = archivo_txt, sep = "\t", quote = TRUE, row.names = TRUE)