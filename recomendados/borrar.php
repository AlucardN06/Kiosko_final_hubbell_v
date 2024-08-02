<?php
$id = $_GET['id'];

$conn = new mysqli('localhost', 'id22166131_root', 'Hubbell0#', "id22166131_usuarios");
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql_get_locker = "SELECT numero_locker FROM empleados WHERE id=$id";
$result = $conn->query($sql_get_locker);
$row = $result->fetch_assoc();
$numero_locker = $row['numero_locker'];

$sql = "DELETE FROM empleados WHERE id=$id";

if ($conn->query($sql) === TRUE) {
    $sql_update_locker = "UPDATE lockers SET status='disponible' WHERE numero_locker='$numero_locker'";
    $conn->query($sql_update_locker);
    echo "Registro eliminado exitosamente";
} else {
    echo "Error: " . $conn->error;
}

$conn->close();
?>
