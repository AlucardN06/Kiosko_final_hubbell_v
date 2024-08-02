<?php
session_start();
$nombre = htmlspecialchars($_POST['nombre']);
$correo = filter_var($_POST['mail'], FILTER_SANITIZE_EMAIL);
$telefono = htmlspecialchars($_POST['telefono']);
$genero = htmlspecialchars($_POST['genero']);
$posicion = htmlspecialchars($_POST['posicion']);
$confirmNumber = htmlspecialchars($_POST['confirmNumber']);

include('conexion.php');

// Función para capitalizar la primera letra de cada palabra
function capitalizeWords($string) {
    return ucwords(strtolower($string));
}

// Capitalizar el nombre
$nombre = capitalizeWords($nombre);

// Verificar si ya existe una recomendación con el mismo nombre, correo o teléfono
$stmt_check = $cn->prepare("SELECT * FROM recomendaciones WHERE nombre = ? OR correo = ? OR telefono = ?");
$stmt_check->bind_param("sss", $nombre, $correo, $telefono);
$stmt_check->execute();
$result_check = $stmt_check->get_result();

if ($result_check->num_rows > 0) {
    // Si se encuentra una coincidencia, mostrar una alerta y detener el registro
    echo "<script>alert('No se puede continuar con su registro ya que la persona ya está registrada en nuestra base de datos.'); window.location.href = 'ta.php';</script>";
    exit;
}

$stmt_check->close();

// Utilizar consultas preparadas para prevenir inyecciones SQL
$stmt_insert_recomendacion = $cn->prepare("INSERT INTO recomendaciones (nombre, correo, telefono, genero, posicion, confirmNumber) VALUES (?, ?, ?, ?, ?, ?)");
$stmt_insert_recomendacion->bind_param("ssssss", $nombre, $correo, $telefono, $genero, $posicion, $confirmNumber);

if ($stmt_insert_recomendacion->execute()) {
    header("Location: gracias_recomendados.php?nombre=$nombre&confirmacion=$confirmNumber");
    exit;
} else {
    die("Error al registrar en recomendaciones: " . $stmt_insert_recomendacion->error);
}

$stmt_insert_recomendacion->close();
$cn->close();
?>
