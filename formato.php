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
if (isset($_POST['toggle_votacion']) && $user['position'] == 'A') {
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
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bienvenid@ a tu kiosko Hubbell</title>
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
    </script>

<style>
        #orientation-alert {
            display: none; /* Oculto por defecto */
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 2); /* Fondo semi-transparente */
            color: white;
            font-size: 24px;
            text-align: center;
            justify-content: center;
            align-items: center;
            z-index: 9999;
            flex-direction: column;
        }


.icon-container {
    position: relative;
    top:15px;
    display: inline-block;
}

.icon-top {
    position: absolute;
    top: -30px; /* Ajusta la posición vertical del arco */
    left: 50%;
    transform: translateX(-50%);
    display: flex;
    justify-content: center;
    width: 100px; /* Ajusta el ancho según sea necesario */
}

.icon-top i {
    position: absolute;
    font-size: 20px; /* Tamaño de los íconos secundarios */
    color: #f4d900; /* Color de los íconos secundarios */
    background: #000; /* Fondo negro para los íconos secundarios */
    border-radius: 50%;
    padding: 5px;
    box-shadow: 0 0 2px rgba(0, 0, 0, 0.3); /* Sombra sutil */
}

.icon-top .fa-search {
    top: 5px;
    left: 0;
    transform: translate(-50%, -50%) rotate(-30deg);
}

.icon-top .fa-phone {
    top: 5px;
    left: 50%;
    transform: translate(-50%, -50%) rotate(0deg);
}

.icon-top .fa-folder {
    top: 5px;
    right: 0;
    transform: translate(50%, -50%) rotate(30deg);
}



.icon-button div {
    margin-top: 10px;
    font-size: 14px;
}

    </style>
</head>
<body>
    <div id="orientation-alert">
        <div>Por favor, gire su dispositivo  para una mejor experiencia.</div>
    </div>
    <div class="container">
        <div class="left-section user-info">
            <div class="logo">
                <img src="images/Logo.webp" alt="Logo">
            </div>
            <?php if ($user) : ?>
                <h2>Bienvenido, <?php echo htmlspecialchars($user['firstname'] . ' ' . $user['lastname']); ?></h2>
                <p>Puesto: <?php echo htmlspecialchars($user['area']); ?></p>
                <p>Autorización tipo: <?php echo htmlspecialchars($user['position']); ?></p>
                <p>Planta: <?php echo htmlspecialchars($user['plant']); ?></p>
                <p id="datetime"></p> <!-- Contenedor para la fecha y la hora -->
                <div class="user-buttons">
                    <form action="index.php" method="POST">
                        <button type="submit" name="logout" class="user-button">Cerrar sesión</button>
                    </form>
                </div>
            <?php endif; ?>
        </div>
        <div class="right-section">
        <h1 class="department-title">Departamentos de Recursos Humanos</h1>

       
            
            </div>
        </div>
    </div>
</body>
</html>
