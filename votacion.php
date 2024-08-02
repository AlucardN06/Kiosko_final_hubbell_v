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
if (isset($_SESSION['user_id'])) {
    $user_id = $_SESSION['user_id'];
    $query = "SELECT firstname, lastname, position, area, plant FROM users WHERE id = '$user_id'";
    $result = mysqli_query($conn, $query);

    if ($result && mysqli_num_rows($result) > 0) {
        $user = mysqli_fetch_assoc($result);
    } else {
        die("Error al obtener datos del usuario");
    }
} else {
    header("Location: login.php");
    exit;
}

// Verificar si el usuario ya ha votado
$has_voted = false;
$query = "SELECT * FROM votos WHERE usuario_id = $user_id";
$result = mysqli_query($conn, $query);
if ($result && mysqli_num_rows($result) > 0) {
    $has_voted = true;
}

// Procesar el voto
if (isset($_POST['vote']) && !$has_voted) {
    $opcion_id = intval($_POST['opcion_id']);
    $query = "INSERT INTO votos (opcion_id, usuario_id) VALUES ($opcion_id, $user_id)";
    mysqli_query($conn, $query);
    $has_voted = true;
}

// Obtener opciones de votación
$query = "SELECT * FROM votacion_opciones";
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
    <button type="button" onclick="location.href='com.php'" class="user-button">
        Regresar
    </button>
</form>

                <form action="index.php" method="POST">
                        <button type="submit" name="logout" class="user-button">Cerrar sesión</button>
                    </form>
            <?php endif; ?>
        </div>
            </div>
        <div class="right-section">
        <button class="back-button" onclick="location.href='com.php'">
                <i class="fas fa-arrow-left"></i> Regresar
            </button>
            <br>
            <br>
            <h1>Votación</h1>
            <?php if ($has_options) : ?>
                <?php if ($has_voted) : ?>
                    <p>Gracias por tu participación, ya has votado.</p>
                <?php else : ?>
                    <form action="votacion.php" method="POST">
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
                        <button type="submit" name="vote">Votar</button>
                    </form>
                <?php endif; ?>
            <?php else : ?>
                <p>No hay opciones de votación disponibles actualmente. Por favor, espera mientras se añaden opciones para la votación.</p>
            <?php endif; ?>
        </div>
    </div>
</body>
</html>
