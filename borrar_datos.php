<?php
session_start();

// Verificar si el usuario está logueado
if (!isset($_SESSION['user_id'])) {
    header("Location: index.php");
    exit;
}

// Conexión a la base de datos
$host = 'localhost';
$user = 'root';
$password = '';
$database = 'id19951970_localhost';

$conn = mysqli_connect($host, $user, $password, $database);

if (!$conn) {
    die("Error de conexión: " . mysqli_connect_error());
}

// Obtener el nombre de la tabla a borrar
$tabla = isset($_POST['tabla']) ? $_POST['tabla'] : '';

if (!empty($tabla)) {
    // Borrar todos los datos de la tabla
    $query = "DELETE FROM " . mysqli_real_escape_string($conn, $tabla);

    if (mysqli_query($conn, $query)) {
        echo "Datos de la tabla '$tabla' borrados correctamente.";
    } else {
        echo "Error al borrar los datos de la tabla '$tabla': " . mysqli_error($conn);
    }
} else {
    echo "No se especificó la tabla a borrar.";
}

// Cerrar la conexión
mysqli_close($conn);
exit;
?>
