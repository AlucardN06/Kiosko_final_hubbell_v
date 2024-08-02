<?php
session_start();

// Verificar si el usuario está logueado
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
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
    header("Location: login.php");
    exit;
}

// Procesar el formulario de cambio de contraseña
if (isset($_POST['change_password'])) {
    $user_id = $_POST['user_id'];
    $new_password = password_hash($_POST['new_password'], PASSWORD_DEFAULT);

    $query = "UPDATE users SET password = '$new_password' WHERE id = '$user_id'";
    if (mysqli_query($conn, $query)) {
        echo "<script>alert('Contraseña actualizada correctamente');</script>";
    } else {
        echo "<script>alert('Error al actualizar la contraseña');</script>";
    }
}

// Procesar el formulario de eliminación de usuario
if (isset($_POST['delete_user'])) {
    $user_id = $_POST['user_id'];

    $query = "DELETE FROM users WHERE id = '$user_id'";
    if (mysqli_query($conn, $query)) {
        echo "<script>alert('Usuario eliminado correctamente');</script>";
    } else {
        echo "<script>alert('Error al eliminar el usuario');</script>";
    }
}

// Buscar usuarios
$search_query = "";
if (isset($_POST['search'])) {
    $search_query = $_POST['search_query'];
}

$query = "SELECT id, firstname, lastname, password, username FROM users WHERE firstname LIKE '%$search_query%' OR lastname LIKE '%$search_query%' OR username LIKE '%$search_query%'";
$users_result = mysqli_query($conn, $query);

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

        setInterval(updateDateTime, 1000);

        window.onload = updateDateTime;

        function checkOrientation() {
            if (window.innerHeight > window.innerWidth) {
                document.getElementById('orientation-alert').style.display = 'flex';
            } else {
                document.getElementById('orientation-alert').style.display = 'none';
            }
        }

        window.onload = checkOrientation;
        window.addEventListener('orientationchange', checkOrientation);
        window.addEventListener('resize', checkOrientation);
    </script>
    <style>
        #orientation-alert {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.8);
            color: white;
            font-size: 24px;
            text-align: center;
            justify-content: center;
            align-items: center;
            z-index: 9999;
            flex-direction: column;
        }
        .search-container {
            margin: 20px 0;
        }
        .user-table {
            width: 100%;
            border-collapse: collapse;
        }
        .user-table th, .user-table td {
            border: 1px solid #ddd;
            padding: 8px;
        }
        .user-table th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: left;
            background-color: #000000;
            color: white;
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
                <p>Área: <?php echo htmlspecialchars($user['area']); ?></p>
                <p>Puesto: <?php echo htmlspecialchars($user['position']); ?></p>
                <p>Número de planta: <?php echo htmlspecialchars($user['plant']); ?></p>
                <p id="datetime"></p>
                <div class="user-buttons">
                    <form>
                        <button type="button" onclick="location.href='ta.php'" class="user-button">
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
            <h1>Visualizador de Usuarios</h1>
            <div class="search-container">
                <form action="usuarios.php" method="POST">
                    <input type="text" name="search_query" placeholder="Buscar por nombre o número de reloj" value="<?php echo htmlspecialchars($search_query); ?>">
                    <button type="submit" name="search">Buscar</button>
                </form>
            </div>
            <table class="user-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Apellido</th>    
                        <th>Número de reloj</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <?php if ($users_result && mysqli_num_rows($users_result) > 0) : ?>
                        <?php while ($user_row = mysqli_fetch_assoc($users_result)) : ?>
                            <tr>
                                <td><?php echo htmlspecialchars($user_row['id']); ?></td>
                                <td><?php echo htmlspecialchars($user_row['firstname']); ?></td>
                                <td><?php echo htmlspecialchars($user_row['lastname']); ?></td>
                                <td><?php echo htmlspecialchars($user_row['username']); ?></td>
                                <td>
                                    <form action="usuarios.php" method="POST" style="display:inline-block;">
                                        <input type="hidden" name="user_id" value="<?php echo htmlspecialchars($user_row['id']); ?>">
                                        <input type="password" name="new_password" placeholder="Nueva contraseña" required>
                                        <button type="submit" name="change_password">Cambiar</button>
                                    </form>
                                    <form action="usuarios.php" method="POST" style="display:inline-block; margin-left: 10px;">
                                        <input type="hidden" name="user_id" value="<?php echo htmlspecialchars($user_row['id']); ?>">
                                        <button type="submit" name="delete_user" onclick="return confirm('¿Estás seguro de que deseas eliminar este usuario?');">Eliminar</button>
                                    </form>
                                </td>
                            </tr>
                        <?php endwhile; ?>
                    <?php else : ?>
                        <tr>
                            <td colspan="6">No se encontraron usuarios</td>
                        </tr>
                    <?php endif; ?>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
