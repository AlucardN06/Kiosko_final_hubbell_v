<?php
// Conexión a la base de datos (reemplaza los valores con los de tu configuración)
$servername = "localhost";
$username = "id22166131_root";
$password = "Hubbell0#";
$dbname = "id22166131_usuarios";

// Crear conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar conexión
if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
}

// Obtener los datos del formulario de inicio de sesión
$username = $_POST['username'];
$password = $_POST['password'];

// Consulta SQL para verificar las credenciales
$sql = "SELECT * FROM admin_users WHERE username='$username' AND password='$password'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Inicio de sesión exitoso
    session_start();
    $_SESSION['username'] = $username;
    header("Location: admin_panel.php"); // Redirige a la página de inicio de sesión exitosa
} else {
    // Credenciales incorrectas
    echo "Usuario o contraseña incorrectos";
}

$conn->close();
?>
