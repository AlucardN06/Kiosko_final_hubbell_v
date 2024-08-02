<?php
session_start();
require_once "conexion.php"; // Incluir el archivo de conexión a la base de datos

$error_message = ""; // Inicializar la variable de mensaje de error

// Función para limpiar y validar datos de entrada
function validar_entrada($dato) {
    $dato = trim($dato); // Eliminar espacios en blanco al inicio y al final
    $dato = stripslashes($dato); // Eliminar barras invertidas escapadas
    $dato = htmlspecialchars($dato); // Convertir caracteres especiales en entidades HTML
    return $dato;
}

if (isset($_SESSION['logged_in']) && $_SESSION['logged_in'] === true) {
    header("Location: admin_panel.php");
    exit;
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Validar y obtener los datos del formulario
    $username = validar_entrada($_POST['username']);
    $password = validar_entrada($_POST['password']);

    // Consulta SQL para verificar las credenciales de manera segura
    $sql = "SELECT * FROM admin_users WHERE username = ? AND password = ?";
    
    if ($stmt = $cn->prepare($sql)) {
        // Bind variables
        $stmt->bind_param("ss", $param_username, $param_password);
        
        // Establecer parámetros
        $param_username = $username;
        $param_password = $password;
        
        // Intentar ejecutar la consulta preparada
        if ($stmt->execute()) {
            // Almacenar el resultado
            $stmt->store_result();
            
            // Verificar si el usuario y la contraseña existen
            if ($stmt->num_rows == 1) {
                $_SESSION['logged_in'] = true; // Establecer la sesión iniciada correctamente
                header("Location: admin_panel.php");
                exit;
            } else {
                $error_message = "Usuario o contraseña incorrectos."; // Mensaje de error
            }
        } else {
            $error_message = "Oops! Algo salió mal. Por favor, inténtalo de nuevo más tarde."; // Mensaje de error
        }

        // Cerrar la consulta preparada
        $stmt->close();
    }

    // Cerrar la conexión a la base de datos
    $cn->close();
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iniciar Sesión - Administrador</title>
    <link rel="stylesheet" href="adminlo.css">
    <style>
        .error {
            color: red;
        }
    </style>
</head>
<body>
  <div class="logo-container">
        <img src="Images/X.webp" alt="Logo">
    </div>
    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post" id="login-form">
  
     
    <h1>Inicio de Sesión</h1>
    <span class="error"><?php echo htmlspecialchars($error_message); ?></span><br> <!-- Mostrar mensaje de error -->
    
        <label for="username">Usuario:</label>
        <input type="text" name="username" id="username" required><br>
        <label for="password">Contraseña:</label>
        <input type="password" name="password" id="password" required><br>
       
        <button type="submit">Iniciar Sesión</button>
    </form>
</body>
</html>
