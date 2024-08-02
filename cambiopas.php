<?php
session_start();

// Verificar si el usuario está logueado
if (!isset($_SESSION['user_id'])) {
    // Redirigir al login si no hay sesión iniciada
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

// Obtener información del usuario si está en sesión
$user = null;
if (isset($_SESSION['user_id'])) {
    $user_id = $_SESSION['user_id'];
    $query = "SELECT firstname, lastname, position, area, plant, birthdate FROM users WHERE id = '$user_id'";
    $result = mysqli_query($conn, $query);

    if ($result && mysqli_num_rows($result) > 0) {
        $user = mysqli_fetch_assoc($result);
        
        // Verificar si es el cumpleaños del usuario y si el mensaje aún no se ha mostrado
        $birthdate = date('md', strtotime($user['birthdate']));
        $today = date('md', strtotime('today'));

        if ($birthdate === $today && !isset($_SESSION['birthday_message_shown'])) {
            echo "<script>alert('¡Feliz cumpleaños, " . $user['firstname'] . "! Te deseamos un feliz cumpleaños. Atte: Hubbell RH');</script>";
            $_SESSION['birthday_message_shown'] = true; // Marcamos el mensaje como mostrado
        }
    } else {
        die("Error al obtener datos del usuario");
    }
} else {
    // Redirigir al login si no hay sesión iniciada
    header("Location: login.php");
    exit;
}

// Procesar el formulario para activar/desactivar votación
if (isset($_POST['toggle_votacion']) && $user['position'] == 'Administrativo') {
    $query = "UPDATE settings SET votacion_enabled = NOT votacion_enabled";
    mysqli_query($conn, $query);
}

// Obtener el estado actual del botón de votación
$query = "SELECT votacion_enabled FROM settings LIMIT 1";
$result = mysqli_query($conn, $query);
$votacion_enabled = $result && mysqli_num_rows($result) > 0 ? mysqli_fetch_assoc($result)['votacion_enabled'] : 0;

// Cerrar sesión
if (isset($_POST['logout'])) {
    session_destroy();
    header("Location: index.php");
    exit;
}

// Procesar el formulario de cambio de contraseña
if (isset($_POST['change_password'])) {
    $current_password = $_POST['current_password'];
    $new_password = $_POST['new_password'];
    $confirm_password = $_POST['confirm_password'];

    // Validar que las contraseñas coincidan
    if ($new_password !== $confirm_password) {
        echo "<script>alert('Las nuevas contraseñas no coinciden.');</script>";
    } else {
        // Obtener la contraseña actual del usuario
        $query = "SELECT password FROM users WHERE id = '$user_id'";
        $result = mysqli_query($conn, $query);
        $row = mysqli_fetch_assoc($result);

        // Verificar que la contraseña actual sea correcta
        if (password_verify($current_password, $row['password'])) {
            // Encriptar la nueva contraseña
            $new_password_hashed = password_hash($new_password, PASSWORD_DEFAULT);

            // Actualizar la contraseña en la base de datos
            $update_query = "UPDATE users SET password = '$new_password_hashed' WHERE id = '$user_id'";
            if (mysqli_query($conn, $update_query)) {
                echo "<script>alert('Contraseña cambiada exitosamente.');</script>";
            } else {
                echo "<script>alert('Error al cambiar la contraseña: " . mysqli_error($conn) . "');</script>";
            }
        } else {
            echo "<script>alert('La contraseña actual es incorrecta.');</script>";
        }
    }
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Talent Adquisition</title>
    <link rel="stylesheet" href="departamentos.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css" rel="stylesheet">

    <script>
        function updateDateTime() {
            const now = new Date();
            const dateString = now.toLocaleDateString();
            const timeString = now.toLocaleTimeString();
            document.getElementById('datetime').textContent = `Fecha: ${dateString}, Hora: ${timeString}`;
        }

        setInterval(updateDateTime, 1000); // Actualiza cada segundo

        window.onload = updateDateTime; // Llama a la función al cargar la página

        function checkOrientation() {
            if (window.innerHeight > window.innerWidth) {
                // Si está en portrait, mostrar un mensaje
                document.getElementById('orientation-alert').style.display = 'flex';
            } else {
                // Si está en landscape, ocultar el mensaje
                document.getElementById('orientation-alert').style.display = 'none';
            }
        }

        // Ejecutar la función al cargar la página
        window.onload = checkOrientation;

        // Detectar cambios en la orientación
        window.addEventListener('orientationchange', checkOrientation);
        window.addEventListener('resize', checkOrientation);

        function togglePasswordVisibility(id) {
            var passwordInput = document.getElementById(id);
            var icon = document.querySelector(`#${id} + .toggle-password`);
            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
                icon.classList.remove('fa-eye');
                icon.classList.add('fa-eye-slash');
            } else {
                passwordInput.type = 'password';
                icon.classList.remove('fa-eye-slash');
                icon.classList.add('fa-eye');
            }
        }
    </script>


<style>
        #orientation-alert {
            display: none; /* Oculto por defecto */
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5); /* Fondo semi-transparente */
            color: white;
            font-size: 24px;
            text-align: center;
            justify-content: center;
            align-items: center;
            z-index: 9999;
            flex-direction: column;
        }
        .change-password-form {
            max-width: 400px;
            margin: auto;
            padding: 30px;
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: #f9f9f9;
        }
        .change-password-form h2 {
            text-align: center;
            margin-bottom: 10px;
        }
        .change-password-form .form-group {
            margin-bottom: 15px;
            position: relative;
        }
        .change-password-form .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        .change-password-form .form-group input {
            width: 100%;
            padding: 8px;
            padding-right: 35px; /* Espacio para el ícono */
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        .change-password-form .form-group .toggle-password {
            position: absolute;
            right: 10px;
            top: 62%;
            transform: translateY(-50%);
            cursor: pointer;
        }
        .change-password-form button {
            width: 100%;
            padding: 10px;
            background-color: #000000;
            border: none;
            border-radius: 5px;
            color: white;
            font-size: 16px;
        }
        .change-password-form button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div id="orientation-alert">
        <div>Por favor, gire su dispositivo para una mejor experiencia.</div>
    </div>
    <div class="container">
        <div class="left-section user-info">
            <div class="logo">
                <img src="images/Logo.webp" alt="Logo">
            </div>
            <?php if ($user) : ?>
                <h2>Bienvenido, <?php echo htmlspecialchars($user['firstname'] . ' ' . $user['lastname']); ?></h2>
                <p>Puesto: <?php echo htmlspecialchars($user['area']); ?></p>
                <p>Tipo de autorización: <?php echo htmlspecialchars($user['position']); ?></p>
                <p>Planta: <?php echo htmlspecialchars($user['plant']); ?></p>
                <p id="datetime"></p> <!-- Contenedor para la fecha y la hora -->
                <div class="user-buttons">
                    <form>
                        <button type="button" onclick="location.href='otros.php'" class="user-button">Regresar</button>
                    </form>
                    <form action="index.php" method="POST">
                        <button type="submit" name="logout" class="user-button">Cerrar sesión</button>
                    </form>
                </div>
            <?php endif; ?>
        </div>
        <div class="right-section">
        <button class="back-button" onclick="location.href='otros.php'">
                <i class="fas fa-arrow-left"></i> Regresar
            </button>
            <br>
            <br>
            <div class="change-password-form">
                <h1>Cambiar Contraseña</h1>
                <form action="" method="POST">
                    <div class="form-group">
                        <label for="current_password">Contraseña Actual:</label>
                        <input type="password" name="current_password" id="current_password" required>
                        <i class="fas fa-eye toggle-password" onclick="togglePasswordVisibility('current_password')"></i>
                    </div>
                    <div class="form-group">
                        <label for="new_password">Nueva Contraseña:</label>
                        <input type="password" name="new_password" id="new_password" required>
                        <i class="fas fa-eye toggle-password" onclick="togglePasswordVisibility('new_password')"></i>
                    </div>
                    <div class="form-group">
                        <label for="confirm_password">Confirmar Nueva Contraseña:</label>
                        <input type="password" name="confirm_password" id="confirm_password" required>
                        <i class="fas fa-eye toggle-password" onclick="togglePasswordVisibility('confirm_password')"></i>
                    </div>
                    <button type="submit" name="change_password">Cambiar Contraseña</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
