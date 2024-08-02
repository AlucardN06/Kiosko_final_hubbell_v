<?php
session_start();

// Conexión a la base de datos
$host = 'localhost';
$user = 'root';
$password = '';
$database = 'id19951970_localhost';

$conn = mysqli_connect($host, $user, $password, $database);

if (!$conn) {
    die("Error de conexión: " . mysqli_connect_error());
}

// Procesamiento del formulario
if (isset($_POST['submit'])) {
    $username = $_POST['username'];
    $password = $_POST['password'];

    $query = "SELECT * FROM users WHERE username = '$username'";
    $result = mysqli_query($conn, $query);

    if ($result && mysqli_num_rows($result) > 0) {
        $user = mysqli_fetch_assoc($result);
        if (password_verify($password, $user['password'])) {
            $_SESSION['user_id'] = $user['id'];
            $_SESSION['username'] = $user['username'];
            header("Location: departamentos.php");
            exit();
        } else {
            $error_msg = "Credenciales inválidas";
        }
    } else {
        $error_msg = "Usuario no encontrado";
    }
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bienvenido(a) a tu Kiosko HUBBELL</title>
    <link rel="stylesheet" href="login.css">
</head>
<body>
  
    <div class="container">
    <div class="logo">
        <img src="images/Logo.webp" alt="Logo">
    </div>
        <h1>Bienvenido(a) a tu Kiosko Hubbell</h1>  
      <p class="parr">Ingresa tu número de reloj y contraseña</p>
        <?php if (isset($error_msg)) { ?>
         
            <p class="error-msg"><?php echo $error_msg; ?></p>
        <?php } ?>
        <form id="login-form" class="login-form" action="index.php" method="POST">
            <input type="text" id="username" name="username" placeholder="Número de Reloj" required>
            <input type="password" id="password" name="password" placeholder="Contraseña" required>
            <button type="submit" name="submit">Login</button>
        </form>
        <a class="forgot-password" onclick="showPasswordRecoveryAlert()">Olvidaste tu contraseña? Click aquí</a>
    </div>
    <div class="bottom-line"></div>
    <script>
        function showPasswordRecoveryAlert() {
            alert("Para recuperación de contraseña acudir a Recursos Humanos con el personal de Adquisición de Talentos para solicitar el cambio de contraseña.");
        }
    </script>
    <script src="konami.js"></script>
</body>
</html>
