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
    $query = "SELECT firstname, lastname, username, area, plant, deparment, Supervisor_name, position, birthdate FROM users WHERE id = '$user_id'";
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

// Procesar el formulario para buscar usuario y registrar cita
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['register_cita'])) {
    $numero_reloj = $_POST['numero_reloj'];
    $cita_cupo_id = $_POST['cita_cupo_id'];

    // Validar que el usuario logueado es el mismo que intenta registrarse o que tiene posición 'A'
    if ($numero_reloj === $user['username'] || $user['position'] === 'A') {
        // Buscar usuario por número de reloj (username)
        $query = "SELECT firstname, lastname, username, area, plant, deparment, Supervisor_name FROM users WHERE username = '$numero_reloj'";
        $result = mysqli_query($conn, $query);

        if ($result && mysqli_num_rows($result) > 0) {
            $usuario = mysqli_fetch_assoc($result);

            // Obtener datos de la cita
            $query = "SELECT fecha, cupos, razon FROM citas_cupos WHERE id = '$cita_cupo_id'";
            $result = mysqli_query($conn, $query);
            $cita = mysqli_fetch_assoc($result);

            // Verificar si el usuario ya está registrado para esta fecha y razón
            $query = "SELECT * FROM registro_citas WHERE username = '{$usuario['username']}' AND fecha = '{$cita['fecha']}' AND razon = '{$cita['razon']}'";
            $result = mysqli_query($conn, $query);

            if (mysqli_num_rows($result) > 0) {
                echo "<script>alert('Ya está registrado para esta fecha y razón.');</script>";
            } else {
                if ($cita['cupos'] > 0) {
                    // Insertar registro en la tabla registro_citas
                    $query = "INSERT INTO registro_citas (firstname, lastname, username, area, plant, department, Supervisor_name, fecha, razon) 
                              VALUES ('{$usuario['firstname']}', '{$usuario['lastname']}', '{$usuario['username']}', '{$usuario['area']}', '{$usuario['plant']}', '{$usuario['deparment']}', '{$usuario['Supervisor_name']}', '{$cita['fecha']}', '{$cita['razon']}')";

                    if (mysqli_query($conn, $query)) {
                        // Reducir cupos disponibles
                        $query = "UPDATE citas_cupos SET cupos = cupos - 1 WHERE id = '$cita_cupo_id'";
                        mysqli_query($conn, $query);
                        echo "<script>alert('Cita registrada exitosamente');</script>";
                    } else {
                        echo "<script>alert('Error al registrar la cita');</script>";
                    }
                } else {
                    echo "<script>alert('No hay cupos disponibles para esta fecha y razón');</script>";
                }
            }
        } else {
            echo "<script>alert('Usuario no encontrado');</script>";
        }
    } else {
        echo "<script>alert('No puede registrar a otra persona que no sea usted');</script>";
    }
}

// Obtener las citas disponibles
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    $query = "SELECT id, fecha, cupos, razon FROM citas_cupos WHERE cupos > 0";
    $citas_result = mysqli_query($conn, $query);
}

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
            margin-top:10%
        }

       form label {
            font-weight: bold;
        }

        form input, select, button {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        form button {
            background-color: black;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        form button:hover {
            background-color: #f4d900;
            color: black;
        }

        #orientation-alert {
            display: none; /* Oculto por defecto */
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.8); /* Fondo semi-transparente */
            color: white;
            font-size: 24px;
            text-align: center;
            justify-content: center;
            align-items: center;
            z-index: 9999;
            flex-direction: column;
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
                        <button type="button" onclick="location.href='enfermeria.php'" class="user-button">Regresar</button>
                    </form>
                    <form action="index.php" method="POST">
                        <button type="submit" name="logout" class="user-button">Cerrar sesión</button>
                    </form>
                </div>
            <?php endif; ?>
        </div>
        <div class="right-section">
        <button class="back-button" onclick="location.href='enfermeria.php'">
                <i class="fas fa-arrow-left"></i> Regresar
            </button>
            <br>
            <br>
            <h1>Registro Eventos de Enfermeria</h1>
            <form action="enfermeria_register.php" method="POST" class="formu">
                <label for="numero_reloj">Número de Reloj:</label>
                <input type="text" id="numero_reloj" name="numero_reloj" required>

                <label for="cita_cupo_id">Fecha y Cupo Disponibles:</label>
                <select id="cita_cupo_id" name="cita_cupo_id" required>
                    <option value="" disabled selected>Seleccione una fecha y evento</option>
                    <?php if (isset($citas_result)) : ?>
                        <?php while ($cita = mysqli_fetch_assoc($citas_result)) : ?>
                            <option value="<?php echo $cita['id']; ?>">
                                <?php echo htmlspecialchars($cita['fecha'] . " - " . $cita['cupos'] . " cupos disponibles - " . $cita['razon']); ?>
                            </option>
                        <?php endwhile; ?>
                    <?php endif; ?>
                </select>

                <button type="submit" name="register_cita">Registrar Cita</button>
            </form>
        </div>
    </div>
</body>
</html>
