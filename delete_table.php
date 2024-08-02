<?php
session_start();

// Verificar si el usuario está logueado
if (!isset($_SESSION['user_id'])) {
    http_response_code(403);
    echo "No autorizado";
    exit;
}

// Conexión a la base de datos
$host = 'localhost';
$user = 'root';
$password = '';
$database = 'id19951970_localhost';

$conn = mysqli_connect($host, $user, $password, $database);

if (!$conn) {
    http_response_code(500);
    echo "Error de conexión: " . mysqli_connect_error();
    exit;
}

// Verificar si se recibió la fecha de la propuesta
if (isset($_POST['proposal_date'])) {
    $proposal_date = mysqli_real_escape_string($conn, $_POST['proposal_date']);

    // Eliminar las aprobaciones asociadas a esta propuesta
    $delete_approvals_query = "DELETE FROM approvals WHERE proposal_date = '$proposal_date'";
    if (!mysqli_query($conn, $delete_approvals_query)) {
        http_response_code(500);
        echo "Error al eliminar aprobaciones: " . mysqli_error($conn);
        exit;
    }

    // Eliminar la propuesta
    $delete_proposal_query = "DELETE FROM operators WHERE proposal_date = '$proposal_date'";
    if (!mysqli_query($conn, $delete_proposal_query)) {
        http_response_code(500);
        echo "Error al eliminar propuesta: " . mysqli_error($conn);
        exit;
    }

    echo "Propuesta y aprobaciones eliminadas correctamente.";
} else {
    http_response_code(400);
    echo "Fecha de propuesta no proporcionada.";
}
?>
