<?php
session_start();

// Verificar si el usuario está logueado
if (!isset($_SESSION['user_id'])) {
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
        
        // Verificar si es el cumpleaños del usuario
        $birthdate = date('md', strtotime($user['birthdate']));
        $today = date('md', strtotime('today'));

        if ($birthdate === $today && !isset($_SESSION['birthday_message_shown'])) {
            echo "<script>alert('¡Feliz cumpleaños, " . $user['firstname'] . "! Te deseamos un feliz cumpleaños. Atte: Hubbell RH');</script>";
            $_SESSION['birthday_message_shown'] = true;
        }
    } else {
        die("Error al obtener datos del usuario");
    }
}

// Procesar el formulario para activar/desactivar votación
if (isset($_POST['toggle_votacion']) && $user['position'] == 'A') {
    $query = "UPDATE settings SET votacion_enabled = NOT votacion_enabled";
    mysqli_query($conn, $query);
    header("Location: " . $_SERVER['PHP_SELF']);
    exit();
}

// Procesar la eliminación de registros
if (isset($_POST['delete_all'])) {
    $query = "DELETE FROM checador_practicantes";
    if (mysqli_query($conn, $query)) {
        echo "<script>alert('Todos los registros han sido eliminados correctamente.');</script>";
    } else {
        echo "<script>alert('Error al eliminar los registros: " . mysqli_error($conn) . "');</script>";
    }
    header("Location: " . $_SERVER['PHP_SELF']);
    exit();
}

// Descargar tabla en formato CSV
if (isset($_POST['download_excel'])) {
    // Definir el nombre del archivo
    $fileName = 'checador_practicantes_' . date('Y-m-d') . '.csv';

    // Establecer las cabeceras para la descarga del archivo
    header('Content-Type: text/csv');
    header('Content-Disposition: attachment; filename="' . $fileName . '"');

    // Abrir un archivo en modo de escritura
    $output = fopen('php://output', 'w');

    // Escribir la línea de encabezados
    fputcsv($output, array('id','Número de Reloj', 'Nombre', 'Apellidos', 'Supervisor', 'Escuela', 'Fecha', 'Hora Entrada', 'Hora Salida'));

    // Obtener los datos de la base de datos
    $query = "SELECT * FROM checador_practicantes";
    $result = mysqli_query($conn, $query);

    if ($result && mysqli_num_rows($result) > 0) {
        while ($data = mysqli_fetch_assoc($result)) {
            // Escribir cada fila de datos en el archivo CSV
            fputcsv($output, $data);
        }
    }

    // Cerrar el archivo
    fclose($output);
    exit();
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DO - Practicantes</title>
    <link rel="stylesheet" href="departamentos.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        #orientation-alert {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 2);
            color: white;
            font-size: 24px;
            text-align: center;
            justify-content: center;
            align-items: center;
            z-index: 9999;
            flex-direction: column;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .right-section {
            padding: 20px;
        }
    </style>
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
                <p id="datetime"></p>
                <div class="user-buttons">
                    <form>
                        <button type="button" onclick="location.href='otros.php'" class="user-button">
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
            <h1 class="department-title">Registro de practicantes</h1>
    
            <table>
                <thead>
                    <tr>
                        <th>Número de Reloj</th>
                        <th>Nombre</th>
                        <th>Apellidos</th>
                        <th>Requisitor</th>
                        <th>Escuela</th>
                        <th>Fecha</th>
                        <th>Hora Entrada</th>
                        <th>Hora Salida</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $query = "SELECT * FROM checador_practicantes";
                    $result = mysqli_query($conn, $query);

                    if ($result && mysqli_num_rows($result) > 0) {
                        while ($row = mysqli_fetch_assoc($result)) {
                            echo "<tr>";
                            echo "<td>" . htmlspecialchars($row['numero_reloj']) . "</td>";
                            echo "<td>" . htmlspecialchars($row['nombre']) . "</td>";
                            echo "<td>" . htmlspecialchars($row['apellidos']) . "</td>";
                            echo "<td>" . htmlspecialchars($row['supervisor']) . "</td>";
                            echo "<td>" . htmlspecialchars($row['escuela']) . "</td>";
                            echo "<td>" . htmlspecialchars($row['fecha']) . "</td>";
                            echo "<td>" . htmlspecialchars($row['hora_entrada']) . "</td>";
                            echo "<td>" . htmlspecialchars($row['hora_salida']) . "</td>";
                            echo "</tr>";
                        }
                    } else {
                        echo "<tr><td colspan='8'>No hay registros.</td></tr>";
                    }
                    ?>
                </tbody>
            </table>
            <form method="POST">
                <button type="submit" name="delete_all" class="user-button">Borrar todos los registros</button>
                <button type="submit" name="download_excel" class="user-button">Descargar en Excel</button>
            </form>
        </div>
        
    </div>
</body>
</html>
