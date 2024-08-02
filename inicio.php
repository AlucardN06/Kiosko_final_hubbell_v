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
    <title>Bienvenido</title>
    <link rel="stylesheet" href="inicio.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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
    </script>
</head>
<body>
    <div class="container">
        <div class="left-section user-info">
            <div class="logo">
                <img src="images/Logo.webp" alt="Logo">
            </div>
            <?php if ($user) : ?>
                <h2>Bienvenido, <?php echo htmlspecialchars($user['firstname'] . ' ' . $user['lastname']); ?></h2>
                <p>Área: <?php echo htmlspecialchars($user['area']); ?></p>
                <p>Puesto: <?php echo htmlspecialchars($user['position']); ?></p>
                <p>Número de planta: <?php echo htmlspecialchars($user['plant']); ?></p>
                <p id="datetime"></p> <!-- Contenedor para la fecha y la hora -->
                <div class="user-buttons">
                    <form action="index.php" method="POST">
                        <button type="submit" name="logout" class="user-button">Cerrar sesión</button>
                    </form>
                    <?php if ($user['position'] == 'Administrativo') : ?>
                        <form action="inicio.php" method="POST">
                            <button type="submit" name="toggle_votacion" class="user-button">
                                <?php echo $votacion_enabled ? 'Desactivar Votación' : 'Activar Votación'; ?>
                            </button>
                        </form>
                    <?php endif; ?>
                </div>
            <?php endif; ?>
        </div>
        <div class="right-section">
            <div class="button-grid">
                <?php if ($user['position'] !== 'Operador') : ?>
                    <button onclick="location.href='dashboard.php'">
                        <i class="fas fa-clock"></i>
                        <div>Tiempo Extra</div>
                    </button>
                <?php endif; ?>
                <button onclick="location.href='eventos.php'">
                    <i class="bi-balloon"></i>
                    <div>Eventos</div>
                </button>
                <?php if ($user['position'] == 'Administrativo' || $votacion_enabled) : ?>
                    <button onclick="location.href='votacion.php'">
                        <i class="fas fa-vote-yea"></i>
                        <div>Votación</div>
                    </button>
                <?php endif; ?>
                <?php if ($user['position'] == 'Administrativo') : ?>
                    <button onclick="location.href='admin_votacion.php'">
                        <i class="fas fa-poll"></i>
                        <div>Administrar Votaciones</div>
                    </button>
                <?php endif; ?>
                <button onclick="location.href='vacantes.php'">
                    <i class="bi-person-lines-fill"></i>
                    <div>Vacantes</div>
                </button>
                <?php if ($user['position'] == 'Administrativo') : ?>
                    <button onclick="location.href='tiempo_extra_aprobado.php'">
                        <i class="fas fa-check-circle"></i>
                        <div>Tiempo extra aprobado</div>
                    </button>
                <?php endif; ?>
                <button>Opción 7</button>
                <button onclick="window.open('https://www.fonacot.gob.mx/login.aspx', '_blank')">
                    <i class="fas fa-hand-holding-heart"></i>
                    <div>Fonacot</div>
                </button>
                <button onclick="window.open('https://micuenta.infonavit.org.mx/', '_blank')">
                    <i class="bi-house-door-fill"></i>
                    <div>Infonavit</div>
                </button>
                <button onclick="window.open(='https://portal.masorden.com/', '_blank')">
                    <i class="fas fa-file-invoice-dollar"></i>
                    <div>Mas Orden</div>
                </button>
            </div>
        </div>
    </div>
</body>
</html>
