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
    $query = "SELECT firstname, lastname, username, area, plant, deparment, position, birthdate FROM users WHERE id = '$user_id'";
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

// Procesar el formulario para agregar una nueva fecha y cupo
if (isset($_POST['add_date'])) {
    $fecha = $_POST['fecha'];
    $cupos = $_POST['cupos'];
    $razon = $_POST['razon'];

    $query = "INSERT INTO citas_cupos (Fecha, Cupos, Razon) VALUES ('$fecha', '$cupos', '$razon')";
    if (mysqli_query($conn, $query)) {
        echo "<script>alert('Fecha y cupos agregados exitosamente');</script>";
    } else {
        echo "<script>alert('Error al agregar fecha y cupos');</script>";
    }
    header("Location: enfermeria_admin.php");
    exit;
}

// Procesar el formulario para actualizar cupos
if (isset($_POST['update_date'])) {
    $id = $_POST['id'];
    $cupos = $_POST['cupos'];

    $query = "UPDATE citas_cupos SET Cupos = '$cupos' WHERE id = '$id'";
    if (mysqli_query($conn, $query)) {
        echo "<script>alert('Cupos actualizados exitosamente');</script>";
    } else {
        echo "<script>alert('Error al actualizar los cupos');</script>";
    }
    header("Location: enfermeria_admin.php");
    exit;
}

// Procesar el formulario para eliminar una fecha
if (isset($_POST['delete_date'])) {
    $id = $_POST['id'];

    $query = "DELETE FROM citas_cupos WHERE id = '$id'";
    if (mysqli_query($conn, $query)) {
        echo "<script>alert('Fecha eliminada exitosamente');</script>";
    } else {
        echo "<script>alert('Error al eliminar la fecha');</script>";
    }
    header("Location: enfermeria_admin.php");
    exit;
}

// Obtener el estado actual del botón de votación
$query = "SELECT votacion_enabled FROM settings LIMIT 1";
$result = mysqli_query($conn, $query);
$votacion_enabled = $result && mysqli_num_rows($result) > 0 ? mysqli_fetch_assoc($result)['votacion_enabled'] : 0;

// Obtener todas las fechas y cupos
$query = "SELECT * FROM citas_cupos";
$fechas_cupos = mysqli_query($conn, $query);

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

form button {
padding: 10px;
margin-bottom: 10px;
border-radius: 5px;
border: 1px solid #ccc;
font-size: 16px;
}

form button {
background-color: black;
border: none;
color: white;
cursor: pointer;
transition: background-color 0.3s;
}

form button:hover {
background-color: #f4d900;
color:black;
}

table {
width: 100%;
border-collapse: collapse;
margin-bottom: 20px;
}

table, th, td {
border: 1px solid #ddd;
}

th, td {
padding: 10px;
text-align: center;
}

th {
background-color: black;
}

thead {
background-color: #007bff;
color: white;
}

tbody tr:nth-child(even) {
background-color: #f2f2f2;
}

tbody tr:hover {
background-color: #ddd;
border: 1px solid black;

}

input[type="number"] {
width: 80px;
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
                <p>Tipo de autorización: <?php echo htmlspecialchars($user['position']); ?></p>
                <p>Planta: <?php echo htmlspecialchars($user['plant']); ?></p>
                <p id="datetime"></p> <!-- Contenedor para la fecha y la hora -->
                <div class="user-buttons">
                <form>
    <button type="button" onclick="location.href='enfermeria.php'" class="user-button">
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
            <h2 class="b_ol">Agregar Fecha y Cupos</h2>
            <form action="enfermeria_admin.php" method="POST">
                <label for="fecha">Fecha:</label>
                <input type="date" id="fecha" name="fecha" required>
                
                <label for="cupos">Cupos:</label>
                <input type="number" id="cupos" name="cupos" required>
                
                <label for="razon">Razón:</label>
                <input type="text" id="razon" name="razon" required>

                <button type="submit" name="add_date">Agregar</button>
            </form>
            <h2 class="b_ol">Fechas y Cupos Existentes</h2>
            <table>
                <thead>
                    <tr>
                        <th>Fecha</th>
                        <th>Cupos</th>
                        <th>Evento</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                <?php
// Obtener todas las fechas y cupos
$query = "SELECT * FROM citas_cupos";
$fechas_cupos_result = mysqli_query($conn, $query);

// Verificar si hay datos
$has_data = mysqli_num_rows($fechas_cupos_result) > 0;
?>
                <?php if ($has_data): ?>
                        <?php while ($row = mysqli_fetch_assoc($fechas_cupos_result)) : ?>
                            <tr>
                                <td><?php echo htmlspecialchars($row['fecha']); ?></td>
                                <td>
                                    <form action="enfermeria_admin.php" method="POST" style="display: inline;">
                                        <input type="hidden" name="id" value="<?php echo $row['id']; ?>">
                                        <input type="number" name="cupos" value="<?php echo htmlspecialchars($row['cupos']); ?>" required>
                                        <button type="submit" name="update_date">Actualizar</button>
                                    </form>
                                </td>
                                <td><?php echo htmlspecialchars($row['razon']); ?></td>
                                <td>
                                    <form action="enfermeria_admin.php" method="POST" style="display: inline;">
                                        <input type="hidden" name="id" value="<?php echo $row['id']; ?>">
                                        <button type="submit" name="delete_date">Eliminar</button>
                                    </form>
                                </td>
                            </tr>
                        <?php endwhile; ?>
                    <?php else: ?>
                        <tr>
                            <td colspan="4">No hay fechas registradas.</td>
                        </tr>
                    <?php endif; ?>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
