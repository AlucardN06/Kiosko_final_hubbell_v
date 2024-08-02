<?php
$numero_locker = $_POST['numero_locker'];

$conn = new mysqli('localhost', 'id22166131_root', 'Hubbell0#', "id22166131_usuarios");
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "INSERT INTO lockers (numero_locker, status) VALUES ('$numero_locker', 'disponible')";

if ($conn->query($sql) === TRUE) {
    echo "Locker agregado exitosamente";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
