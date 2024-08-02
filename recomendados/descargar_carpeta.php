<?php
// Ruta al archivo ZIP
$archivo_zip = '/storage/ssd3/131/22166131/public_html/public_html/public_html.zip';

// Verificar si el archivo existe
if (!file_exists($archivo_zip)) {
    die("El archivo no existe.");
}

// Definir encabezados para la descarga
header('Content-Type: application/zip');
header('Content-Disposition: attachment; filename="' . basename($archivo_zip) . '"');
header('Content-Length: ' . filesize($archivo_zip));

// Leer el archivo y enviar su contenido al navegador
readfile($archivo_zip);
exit;
?>
