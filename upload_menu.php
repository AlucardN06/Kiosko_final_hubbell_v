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

if (isset($_POST['upload_image'])) {
    $file_name = $_FILES['image_file']['name'];
    $file_tmp = $_FILES['image_file']['tmp_name'];
    $file_path = 'uploads/' . $file_name;

    // Mover el archivo a la carpeta de destino
    if (move_uploaded_file($file_tmp, $file_path)) {
        // Insertar detalles del archivo en la base de datos
        $query = "INSERT INTO menus (file_name, file_path) VALUES ('$file_name', '$file_path')";
        if (mysqli_query($conn, $query)) {
            echo "Archivo subido exitosamente.";
        } else {
            echo "Error al guardar la información del archivo en la base de datos: " . mysqli_error($conn);
        }
    } else {
        echo "Error al subir el archivo.";
    }
}

mysqli_close($conn);

// Redirigir de vuelta a la página principal
header("Location: cafeteria.php");
exit;
?>
