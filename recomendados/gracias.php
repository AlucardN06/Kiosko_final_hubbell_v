<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agradecimiento</title>
    <!-- Enlace al archivo CSS -->
    <link rel="stylesheet" href="gracias.css">
    <script type="module" src="mapa.js"></script>
</head>
<body>
<?php 
// Recupera los datos del formulario
$nombre = $_GET['nombre'];
$fecha = $_GET['fecha'];
$confirmacion = $_GET['confirmacion'];

// Convierte la fecha a un formato con el mes en palabras
setlocale(LC_TIME, 'es_ES.UTF-8', 'es_ES', 'spanish'); // Establece el idioma a español
$fecha_formateada = strftime("%d de %B de %Y", strtotime($fecha));

// Muestra el mensaje de agradecimiento junto con el número de confirmación
echo "<div class='message-container'>";
echo "<h2>¡Gracias por registrar a tu recomendado:, $nombre!</h2>";
echo "<p>Que se presente el día $fecha_formateada con este comprobante para continuar con su contratación con el siguiente número: $confirmacion a partir de las 6:00 am (con tolerancia de 15 a 20 minutos).</p>";

// Lista de documentos a presentar
echo "<h3>Documentación a presentar en el siguiente orden:</h3>";
echo "<ul>";
echo "<li>Acta de Nacimiento</li>";
echo "<li>Constancia de Situación Fiscal (RFC)</li>";
echo "<li>Comprobante de Estudios (Certificado, no boletas)</li>";
echo "<li>Número de Seguro Social</li>";
echo "<li>Identificación Oficial Vigente (INE)</li>";
echo "<li>Comprobante de Domicilio (No Mayor a 3 Meses)</li>";
echo "<li>Carta de no Antecedentes Penales (No Mayor a 3 Meses)</li>";
echo "<li>CURP</li>";
echo "<li>Correo Electrónico (Con Contraseña)</li>";

echo "</ul>";
echo "<p> Nota: Se le pedirá acceder a su correo electrónico por lo cual necesita su contraseña para acceder.</p>";

echo "</div>";
?>

<div class='message-container'>

    <div style="text-align: center;">
        <!-- Botón para redirigir a Google Maps -->
     
            <button onclick="location.href='/dashboard/index.php'" style="background-color: #FFD100; color: #000; border: none; padding: 10px 20px; font-size: 16px; cursor: pointer; border-radius: 5px;">
                Regresar a login del kiosko
            </button>
        </a>
    </div>
</div>
</body>
</html>
