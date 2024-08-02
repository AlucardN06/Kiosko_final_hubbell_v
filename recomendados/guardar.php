<?php
$nombre = $_POST['nombre'];
$puesto = $_POST['puesto'];
$supervisor = $_POST['supervisor'];
$turno = $_POST['turno'];
$division = $_POST['division'];
$numero_locker = $_POST['numero_locker'];
$status = $_POST['status'];

$conn = new mysqli('localhost', 'id22166131_root', 'Hubbell0#', "id22166131_usuarios");
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "INSERT INTO empleados (nombre, puesto, supervisor, turno, division, numero_locker, status)
VALUES ('$nombre', '$puesto', '$supervisor', '$turno', '$division', '$numero_locker', '$status')";

if ($conn->query($sql) === TRUE) {
    $sql_update_locker = "UPDATE lockers SET status='ocupado' WHERE numero_locker='$numero_locker'";
    $conn->query($sql_update_locker);
    echo "Registro guardado exitosamente";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
