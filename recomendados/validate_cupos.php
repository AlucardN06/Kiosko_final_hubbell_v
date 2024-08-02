<?php
// Conexión a la base de datos
$host = 'localhost';
$user = 'id22166131_root';
$password = 'Hubbell0#';
$database = 'id22166131_usuarios';

$conn = mysqli_connect($host, $user, $password, $database);

if (!$conn) {
    die("Error de conexión: " . mysqli_connect_error());
}

$input = json_decode(file_get_contents('php://input'), true);
$fecha = $input['fecha'];

// Consulta para contar los registros existentes para la fecha seleccionada
$sql_count = "SELECT COUNT(*) AS registrados FROM citas WHERE Fecha = '$fecha'";
$result_count = mysqli_query($conn, $sql_count);
$row_count = mysqli_fetch_assoc($result_count);

echo json_encode(['success' => true, 'registrados' => $row_count['registrados']]);

mysqli_close($conn);
?>
