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

// Verificar si el usuario está en sesión
$user = null;
$tiempo_trabajo_anios = 0; // Variable para almacenar el tiempo de trabajo en años

if (isset($_SESSION['user_id'])) {
    $user_id = $_SESSION['user_id'];
    $query = "SELECT firstname, lastname, position, area, plant, fecha_ingreso FROM users WHERE id = '$user_id'";
    $result = mysqli_query($conn, $query);

    if ($result && mysqli_num_rows($result) > 0) {
        $user = mysqli_fetch_assoc($result);
        
        // Calcular tiempo de trabajo en años y meses
        $fecha_ingreso = new DateTime($user['fecha_ingreso']);
        $fecha_actual = new DateTime();
        $interval = $fecha_ingreso->diff($fecha_actual);
        $tiempo_trabajo_anios = $interval->y;
        $meses_trabajo = $interval->m;

        // Calcular si en los meses restantes del año (hasta noviembre) alcanzará un año adicional
        $meses_restantes = 12 - $fecha_actual->format('m'); // Considerando hasta noviembre
        if ($meses_trabajo + $meses_restantes >= 12) {
            $tiempo_trabajo_anios += 1;
        }

        // Calcular el próximo múltiplo de 5 años
        $proximo_anio_regalo = ceil($tiempo_trabajo_anios / 5) * 5;
    } else {
        die("Error al obtener datos del usuario");
    }
} else {
    header("Location: login.php");
    exit;
}

// Verificar si el usuario ya ha votado
$has_voted = false;
$query = "SELECT * FROM votos_nuevo WHERE usuario_id = $user_id";
$result = mysqli_query($conn, $query);
if ($result && mysqli_num_rows($result) > 0) {
    $has_voted = true;
}

if (isset($_POST['vote_ant']) && !$has_voted) {
    $opcion_id = intval($_POST['opcion_id']);

    // Verificar si el opcion_id es válido
    $query = "SELECT id FROM votacion_opciones_nuevo WHERE id = $opcion_id";
    $result = mysqli_query($conn, $query);

    if ($result && mysqli_num_rows($result) > 0) {
        // El ID es válido, proceder con la inserción
        $query = "INSERT INTO votos_nuevo (opcion_id, usuario_id) VALUES ($opcion_id, $user_id)";
        mysqli_query($conn, $query);
        $has_voted = true;
    } else {
        // El ID no es válido
        die("Error: La opción seleccionada no es válida.");
    }
}

// Obtener opciones de votación que coincidan con los años trabajados del usuario
$query = "SELECT * FROM votacion_opciones_nuevo WHERE anio = $proximo_anio_regalo";
$opciones_result = mysqli_query($conn, $query);

// Verificar si hay opciones de votación disponibles
$has_options = $opciones_result && mysqli_num_rows($opciones_result) > 0;
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Votación</title>
    <link rel="stylesheet" href="vstyle.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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
                    <form>
                        <button type="button" onclick="location.href='votaciones_ant.php'" class="user-button">
                            Regresar
                        </button>
                    </form>
                    <form action="index.php" method="POST">
                        <button type="submit" name="logout" class="user-button">Cerrar sesión</button>
                    </form>
                </div>
            <?php endif; ?>
        </div>
        <div class="right-section">
            <button class="back-button" onclick="location.href='votaciones_ant.php'">
                <i class="fas fa-arrow-left"></i> Regresar
            </button>
            <br>
            <br>
            <h1>Votación</h1>
            <?php if ($has_options) : ?>
                <?php if ($has_voted) : ?>
                    <p>Gracias por tu participación, ya has votado.</p>
                <?php else : ?>
                    <form action="votacion_ant.php" method="POST">
                        <div class="options-container">
                            <?php while ($row = mysqli_fetch_assoc($opciones_result)) : ?>
                            <div class="option">
                                <label>
                                    <img src="<?php echo $row['imagen']; ?>" alt="<?php echo $row['nombre']; ?>">
                                    <div>
                                        <input type="radio" name="opcion_id" value="<?php echo $row['id']; ?>" required>
                                        <?php echo $row['nombre']; ?>
                                    </div>
                                </label>
                            </div>
                            <?php endwhile; ?>
                        </div>
                        <button type="submit" name="vote_ant">Votar</button>
                    </form>
                <?php endif; ?>
            <?php else : ?>
                <p>No hay opciones de votación disponibles actualmente o no tienes la antigüedad suficiente para votar por un regalo. Por favor, espera mientras se añaden opciones para la votación o espera a que cumplas con los años de antigüedad.</p>
            <?php endif; ?>
        </div>
    </div>
</body>
</html>
