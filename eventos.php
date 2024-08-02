<?php
session_start();

// Verificar si el usuario está logueado
if (!isset($_SESSION['user_id'])) {
// Redirigir al login si no hay sesión iniciada
header("Location: index.php");
exit;
}

error_reporting(E_ALL);
ini_set('display_errors', 1);

// Conexión a la base de datos
$host = 'localhost';
$user = 'root';
$password = '';
$database = 'id19951970_localhost';

$conn = mysqli_connect($host, $user, $password, $database);

if (!$conn) {
die("Error de conexión: " . mysqli_connect_error());
}

// Procesamiento del formulario para agregar eventos
if (isset($_POST['add_event'])) {
$event_name = $_POST['event_name'];
$event_date = $_POST['event_date'];
$event_location = $_POST['event_location'];
$event_description = $_POST['event_description'];



// Guardar la imagen en el servidor
$target_dir = "uploads/";
$target_file = $target_dir . basename($_FILES["event_image"]["name"]);
if (move_uploaded_file($_FILES["event_image"]["tmp_name"], $target_file)) {
    $event_image = $target_file;

    // Insertar evento en la base de datos
    $insert_query = "INSERT INTO events (name, date, location, description, image) VALUES (?, ?, ?, ?, ?)";
    $stmt = mysqli_prepare($conn, $insert_query);
    mysqli_stmt_bind_param($stmt, "sssss", $event_name, $event_date, $event_location, $event_description, $event_image);
    $result = mysqli_stmt_execute($stmt);

    if (!$result) {
        die("Error al agregar el evento: " . mysqli_error($conn));
    }
} else {
    die("Error al subir la imagen.");
}
}

// Procesamiento del formulario para borrar eventos
if (isset($_POST['delete_event'])) {
$event_id = $_POST['event_id'];
$query = "SELECT image FROM events WHERE id = ?";
$stmt = mysqli_prepare($conn, $query);
mysqli_stmt_bind_param($stmt, "i", $event_id);
mysqli_stmt_execute($stmt);
mysqli_stmt_bind_result($stmt, $image);
mysqli_stmt_fetch($stmt);
mysqli_stmt_close($stmt);


if ($image && file_exists($image)) {
    unlink($image); // Borrar la imagen del servidor
}

$delete_query = "DELETE FROM events WHERE id = ?";
$stmt = mysqli_prepare($conn, $delete_query);
mysqli_stmt_bind_param($stmt, "i", $event_id);
$result = mysqli_stmt_execute($stmt);

if (!$result) {
    die("Error al borrar el evento: " . mysqli_error($conn));
}
}

// Obtener información del usuario si está en sesión
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
}

// Consultar eventos
$events_result = null;
$query = "SELECT * FROM events";
$events_result = mysqli_query($conn, $query);

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
    <title>Eventos</title>
    <link rel="stylesheet" href="evento.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  
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
                <p>Puesto: <?php echo htmlspecialchars($user['area']); ?></p>
                <p>Tipo de autorización: <?php echo htmlspecialchars($user['position']); ?></p>
                <p>Planta: <?php echo htmlspecialchars($user['plant']); ?></p>
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
            <?php if ($user && $user['position'] == 'A') : ?>
                <button class="show-event-form">Agregar imagen</button>
                <div class="event-form-container">
                    <h1>Agregar Comunicado</h1>
                    <form action="eventos.php" method="POST" enctype="multipart/form-data">
                        <label for="event_name">Nombre:</label>
                        <input type="text" id="event_name" name="event_name" required>
                        <label for="event_date">Fecha:</label>
                        <input type="date" id="event_date" name="event_date" required>
                        <label for="event_location">Lugar:</label>
                        <input type="text" id="event_location" name="event_location" required>
                        <label for="event_description">Descripción:</label>
                        <textarea id="event_description" name="event_description" required></textarea>
                        <label for="event_image">Imagen:</label>
                        <input type="file" id="event_image" name="event_image" accept="image/*" required>
                        <button type="submit" name="add_event">Agregar</button>
                    </form>
                </div>
                <button id="toggle-images">Mostrar/Ocultar Imágenes</button>
            <?php endif; ?>
            <?php if ($events_result && mysqli_num_rows($events_result) > 0) : ?>
                <h1>Comunicados</h1>
                <br>
                <?php if ($user && $user['position'] != 'A') : ?>
                    <div class="non-admin-slider">
                        <?php
                        mysqli_data_seek($events_result, 0);
                        while ($event = mysqli_fetch_assoc($events_result)) :
                            $image_path = htmlspecialchars($event['image']);
                            if (file_exists($image_path)) : ?>
                                <img src="<?php echo $image_path; ?>" alt="<?php echo htmlspecialchars($event['name']); ?>">
                            <?php endif;
                        endwhile; ?>
                    </div>
                <?php else: ?>
                    <div class="admin-images-container">
                        <?php 
                        mysqli_data_seek($events_result, 0); 
                        while ($event = mysqli_fetch_assoc($events_result)) :
                            $image_path = htmlspecialchars($event['image']);
                            if (file_exists($image_path)) : ?>
                                <div class="event-container">
                                    <img class="event-image" src="<?php echo $image_path; ?>" alt="<?php echo htmlspecialchars($event['name']); ?>">
                                    <div class="admin-buttons">
                                        <form action="eventos.php" method="POST" style="display:inline;">
                                            <input type="hidden" name="event_id" value="<?php echo htmlspecialchars($event['id']); ?>">
                                            <button type="submit" name="delete_event">Eliminar</button>
                                        </form>
                                    </div>
                                </div>
                            <?php endif;
                        endwhile; ?>
                    </div>
                <?php endif; ?>
            <?php else : ?>
                <p>No hay eventos disponibles.</p>
            <?php endif; ?>
        </div>
    </div>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const showEventFormButton = document.querySelector('.show-event-form');
            const eventFormContainer = document.querySelector('.event-form-container');
            const toggleImagesButton = document.getElementById('toggle-images');
            const adminImagesContainer = document.querySelector('.admin-images-container');
            const images = document.querySelectorAll('.non-admin-slider img');
            let currentImageIndex = 0;

        if (showEventFormButton) {
            showEventFormButton.addEventListener('click', function() {
                eventFormContainer.style.display = eventFormContainer.style.display === 'none' ? 'block' : 'none';
            });
        }

        if (toggleImagesButton) {
            toggleImagesButton.addEventListener('click', function() {
                if (adminImagesContainer) {
                    adminImagesContainer.style.display = adminImagesContainer.style.display === 'none' ? 'flex' : 'none';
                }
            });
        }

        function showImage(index) {
            images.forEach((img, i) => {
                img.classList.toggle('active', i === index);
            });
        }

        function nextImage() {
            currentImageIndex = (currentImageIndex + 1) % images.length;
            showImage(currentImageIndex);
        }

        if (images.length > 0) {
            showImage(currentImageIndex);
            setInterval(nextImage, 10000);
        }
    });
</script>
</body>
</html>