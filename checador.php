<?php
session_start();
date_default_timezone_set('America/Mexico_City');



// Conexión a la base de datos
$host = 'localhost';
$user = 'root';
$password = '';
$database = 'id19951970_localhost';

$conn = mysqli_connect($host, $user, $password, $database);

if (!$conn) {
    die("Error de conexión: " . mysqli_connect_error());
}




// Procesar el escaneo del código para el checador
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['numero_reloj'])) {
    $numero_reloj = mysqli_real_escape_string($conn, $_POST['numero_reloj']);
    $fecha = date('Y-m-d');
    $hora_actual = date('H:i:s');

    // Verificar si ya hay una entrada para hoy
    $query = "SELECT * FROM checador_practicantes WHERE numero_reloj = '$numero_reloj' AND fecha = '$fecha'";
    $result = mysqli_query($conn, $query);

    if (mysqli_num_rows($result) == 0) {
        // Si no hay registro para hoy, registrar la entrada
        $practicanteQuery = "SELECT firstname, lastname, requisitor, escuela FROM practicantes WHERE reloj_number = '$numero_reloj'";
        $practicanteResult = mysqli_query($conn, $practicanteQuery);

        if (mysqli_num_rows($practicanteResult) > 0) {
            $practicante = mysqli_fetch_assoc($practicanteResult);
            $nombre = $practicante['firstname'];
            $apellidos = $practicante['lastname'];
            $supervisor = $practicante['requisitor'];
            $escuela = $practicante['escuela'];

            $insertQuery = "INSERT INTO checador_practicantes (numero_reloj, nombre, apellidos, supervisor, escuela, fecha, hora_entrada) 
                            VALUES ('$numero_reloj', '$nombre', '$apellidos', '$supervisor', '$escuela', '$fecha', '$hora_actual')";
            if (mysqli_query($conn, $insertQuery)) {
                echo "<script>alert('Entrada registrada correctamente.'); window.location.href = 'checador.php';</script>";
            } else {
                echo "<script>alert('Error al registrar la entrada: " . mysqli_error($conn) . "');</script>";
            }
        } else {
            echo "<script>alert('No se encontró un practicante con el número de reloj proporcionado.');</script>";
        }
    } else {
        // Si ya hay una entrada, comprobar si ya se ha registrado la salida
        $checador = mysqli_fetch_assoc($result);
        if (is_null($checador['hora_salida'])) {
            // Si no hay hora de salida registrada, actualizar la salida
            $updateQuery = "UPDATE checador_practicantes SET hora_salida = '$hora_actual' 
                            WHERE numero_reloj = '$numero_reloj' AND fecha = '$fecha'";
            if (mysqli_query($conn, $updateQuery)) {
                echo "<script>alert('Salida registrada correctamente.'); window.location.href = 'checador.php';</script></script>";
            } else {
                echo "<script>alert('Error al registrar la salida: " . mysqli_error($conn) . "');</script>";
            }
        } else {
            // Si ya se registró una salida, mostrar mensaje de error
            echo "<script>alert('Ya está registrada su hora de salida para hoy.');</script>";
        }
    }
}

mysqli_close($conn);
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DO</title>
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
  
                <h2>Bienvenido,Practicante</h2>
                <p id="datetime"></p> <!-- Contenedor para la fecha y la hora -->
                <div class="user-buttons">
                    <form>
                        <button type="button" onclick="location.href='index.php'" class="user-button">Regresar</button>
                    </form>
              
                </div>
       
        </div>
        <div class="right-section">
            <h1 class="department-title">Checador de entrada para practicantes</h1>
            <form action="" method="POST" id="checadorForm">
                <input type="text" id="numero_reloj" name="numero_reloj" placeholder="Escanea tu número de reloj" autofocus required>
            </form>
        </div>
    </div>
</body>
</html>
