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
$nombre = htmlspecialchars($_GET['nombre']);
$confirmacion = htmlspecialchars($_GET['confirmacion']);

// Función para capitalizar la primera letra de cada palabra
function capitalizeWords($string) {
    return ucwords(strtolower($string));
}

// Capitalizar el nombre
$nombre = capitalizeWords($nombre);

// Muestra el mensaje de agradecimiento junto con el número de confirmación
echo "<div class='message-container'>";
echo "<h2>¡Gracias por registrar a tu recomendado, $nombre!</h2>";
echo "<p></p>";

echo "</div>"
?>
<div class='message-container'>
    <div style="text-align: center;">
        <!-- Botón para redirigir a la página principal -->
        <button onclick="location.href='/dashboard/departamentos.php'" style="background-color: #FFD100; color: #000; border: none; padding: 10px 20px; font-size: 16px; cursor: pointer; border-radius: 5px;">
                Regresar al kiosko
            </button>
    </div>
</div>
</body>
</html>
