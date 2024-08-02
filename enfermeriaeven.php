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

// Procesar el formulario para eliminar un registro
if (isset($_POST['delete_record'])) {
    $record_id = $_POST['record_id'];
    $query = "DELETE FROM registro_citas WHERE id = '$record_id'";
    mysqli_query($conn, $query);
}

// Procesar el formulario para eliminar todos los registros
if (isset($_POST['delete_all'])) {
    $query = "DELETE FROM registro_citas";
    mysqli_query($conn, $query);
}

// Procesar el formulario para descargar los datos en Excel
if (isset($_POST['download_excel'])) {
    header('Content-Type: application/vnd.ms-excel');
    header('Content-Disposition: attachment; filename="registro_citas.xls"');

    $query = "SELECT firstname, lastname, username, area, plant, Supervisor_name, department, fecha, razon FROM registro_citas";
    $result = mysqli_query($conn, $query);

    echo "Firstname\tLastname\tUsername\tArea\tPlant\tSupervisor_name\tDepartment\tFecha\tRazon\n";
    while ($row = mysqli_fetch_assoc($result)) {
        echo $row['firstname'] . "\t" . $row['lastname'] . "\t" . $row['username'] . "\t" . $row['area'] . "\t" . $row['plant'] . "\t" . $row['Supervisor_name'] . "\t" . $row['department'] . "\t" . $row['fecha'] . "\t" . $row['razon'] . "\n";
    }
    exit;
}

// Obtener los datos de la tabla registro_citas
$query = "SELECT id, firstname, lastname, username, area, plant, Supervisor_name, department, fecha, razon FROM registro_citas";
$result = mysqli_query($conn, $query);

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
    <title>Registro de Citas</title>
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
       
        .formu {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        label {
            font-weight: bold;
        }

        input, select, button {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        form button {
            background-color: #28a745;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
.dele{
   background-color: #dc3545;
            color: #fff;
}
.dele:hover{
    background-color:darkred;
    color:#fff;
}
        button:hover {
            background-color: #218838;
        }

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

        table {
width: 100%;
border-collapse: collapse;
margin-bottom: 20px;
}

table, th, td {
border: 1px solid #ddd;
margin-top:10%;
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
        .delete-button {
            background-color: #dc3545;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 5px 10px;
            cursor: pointer;
        }

        .delete-button:hover {
            background-color: #c82333;
        }

        .action-buttons {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
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
            <h1>Registro de Eventos de Enfermería</h1>

            <table>
                <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Apellidos</th>
                        <th>Número de reloj</th>
                        <th>Puesto</th>
                        <th>Planta</th>
                        <th>Supervisor</th>
                        <th>Area</th>
                        <th>Fecha</th>
                        <th>Evento</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <?php
                   $query= "SELECT * FROM registro_citas";
                    $registro_citas = mysqli_query($conn, $query);
                    $has_data = mysqli_num_rows($registro_citas) > 0;
                ?>
                <tbody>
                <?php if ($has_data): ?>

                    <?php while ($row = mysqli_fetch_assoc($result)) : ?>
                        <tr>
                            <td><?php echo htmlspecialchars($row['firstname']); ?></td>
                            <td><?php echo htmlspecialchars($row['lastname']); ?></td>
                            <td><?php echo htmlspecialchars($row['username']); ?></td>
                            <td><?php echo htmlspecialchars($row['area']); ?></td>
                            <td><?php echo htmlspecialchars($row['plant']); ?></td>
                            <td><?php echo htmlspecialchars($row['Supervisor_name']); ?></td>
                            <td><?php echo htmlspecialchars($row['department']); ?></td>
                            <td><?php echo htmlspecialchars($row['fecha']); ?></td>
                            <td><?php echo htmlspecialchars($row['razon']); ?></td>
                            <td>
                                <form action="" method="POST">
                                    <input type="hidden" name="record_id" value="<?php echo $row['id']; ?>">
                                    <button type="submit" name="delete_record" class="delete-button">Eliminar</button>
                                </form>
                            </td>
                        </tr>
                    <?php endwhile; ?>
                    <?php else: ?>
                        <tr>
                            <td colspan="4">No hay ningun registro.</td>
                        </tr>
                    <?php endif; ?>
                </tbody>
            </table>

            <div class="action-buttons">
                <form action="" method="POST">
                    <button type="submit" name="download_excel">Descargar en Excel</button>
                </form>
                <form action="" method="POST">
                    <button type="submit" class="dele" name="delete_all">Borrar todos los datos</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
