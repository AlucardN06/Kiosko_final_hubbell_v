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
            echo "<script>alert('¡Feliz cumpleaños, " . $user['firstname'] . "! Te deseamos un feliz cumpleaños, acude por tu regalo a RH. Atte: Hubbell RH');</script>";
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

// Procesar eliminación de PDF
if (isset($_POST['delete_pdf']) && $user['position'] == 'A') {
    $menu_id = intval($_POST['pdf_id']);
    $query = "SELECT file_path FROM menus WHERE id = $menu_id";
    $result = mysqli_query($conn, $query);

    if ($result && mysqli_num_rows($result) > 0) {
        $menu = mysqli_fetch_assoc($result);
        $file_path = $menu['file_path'];

        // Eliminar el archivo del sistema
        if (file_exists($file_path)) {
            unlink($file_path);
        }

        // Eliminar el registro de la base de datos
        $query = "DELETE FROM menus WHERE id = $menu_id";
        mysqli_query($conn, $query);
    }
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Talent Acquisition</title>
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

        function showModal(imgSrc) {
            const modal = document.getElementById('imageModal');
            const modalImg = document.getElementById('modalImage');
            modalImg.src = imgSrc;
            modal.style.display = 'block';
        }

        function closeModal() {
            document.getElementById('imageModal').style.display = 'none';
        }
    </script>

    <style>
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

        .center-container {
            text-align: center;
        }

        .upload-form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .delete-button {
            background-color: black;
            border: none;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 5px;
        }

        .delete-button {
            background-color: #dc3545;
        }

        .pdf-button:hover {
            background-color: #f4d900;
            color: black;
        }

        .delete-button:hover {
            background-color: #c82333;
        }
        .right-section {
    position: relative; /* Asegura que el botón se posicione relativo a esta sección */
    padding: 20px; /* Ajusta el espaciado si es necesario */
}
        @media (max-width: 768px) {
            .container {
                flex-direction: column;
            }

            .left-section, .right-section {
                width: 100%;
            }

            iframe {
                width: 100%;
                height: 400px;
            }
        }
        
        .center-container {
            text-align: center; /* Centrando el contenido */
        }

        .upload-form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        /* Estilos para el modal */
        #imageModal {
            display: none; /* Oculto por defecto */
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgb(0, 0, 0);
            background-color: rgba(0, 0, 0, 0.9); /* Fondo oscuro */
        }

        #imageModal img {
            margin: auto;
            display: block;
            width: 80%;
            max-width: 700px;
        }

        .close {
            position: absolute;
            top: 15px;
            right: 35px;
            color: #fff;
            font-size: 40px;
            font-weight: bold;
            transition: 0.3s;
        }
        .back-button {
    position:absolute;
    top: 10px;
    left: 2px; /* Cambiado para que el botón esté en el lado izquierdo */
    background-color: #000; /* Fondo negro */
    color: white; /* Letras blancas */
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    font-size: 16px;
   
    transition: background-color 0.3s, color 0.3s; /* Añadido para animar el cambio de color */
}

.back-button i {
    margin-right: 5px;
}

.back-button:hover {
    background-color: #f4d900; /* Fondo amarillo al pasar el cursor */
    color: black; /* Letras negras al pasar el cursor */
}

        .close:hover,
        .close:focus {
            color: #bbb;
            text-decoration: none;
            cursor: pointer;
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
        <div class="right-section center-container">
        <button class="back-button" onclick="location.href='enfermeria.php'">
                <i class="fas fa-arrow-left"></i> Regresar
            </button>
            <?php if ($user['position'] == 'A') : ?>
                <h1>Subir Menú</h1> 
                <form action="upload_menu.php" method="POST" enctype="multipart/form-data" class="upload-form">
                   <input type="file" name="image_file" accept="image/*" required>
                   <button type="submit" name="upload_image" class="user-button">Subir Menú</button>
                </form>
            <?php endif; ?>
            <h1>Menú de cafeteria de la semana</h1>
            <?php
                // Mostrar lista de imágenes disponibles
                $query = "SELECT * FROM menus";
                $result = mysqli_query($conn, $query);

                if ($result && mysqli_num_rows($result) > 0) {
                    while ($row = mysqli_fetch_assoc($result)) {
                        echo '<div>';
                        echo '<img src="' . htmlspecialchars($row['file_path']) . '" alt="' . htmlspecialchars($row['file_name']) . '" style="width:100%; max-width:1200px; height:auto;" onclick="showModal(this.src)">';
                        if ($user['position'] == 'A') {
                            echo '<form action="" method="POST" style="display:inline-block;">';
                            echo '<input type="hidden" name="pdf_id" value="' . $row['id'] . '">';
                            echo '<button type="submit" name="delete_pdf" class="delete-button" onclick="return confirm(\'¿Estás seguro de que deseas eliminar esta imagen?\')">Eliminar</button>';
                            echo '</form>';
                        }
                        echo '</div>';
                        echo '<br>';
                    }
                } else {
                    echo '<p>No hay documentos disponibles.</p>';
                }
            ?>
        </div>
    </div>

    <!-- Modal para la imagen ampliada -->
    <div id="imageModal" onclick="closeModal()">
        <span class="close">&times;</span>
        <img class="modal-content" id="modalImage">
    </div>
</body>
</html>
