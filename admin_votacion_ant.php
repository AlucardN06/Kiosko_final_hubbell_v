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

// Verificar si el usuario es administrador
if ($user['position'] !== 'A') {
    die("Acceso denegado");
}

// Agregar opción
if (isset($_POST['add_option']) && !isset($_SESSION['form_processed'])) {
    $nombre = mysqli_real_escape_string($conn, $_POST['nombre']);
    $anio = intval($_POST['anio']);
    $imagen = 'uploads/' . basename($_FILES['imagen']['name']);
    move_uploaded_file($_FILES['imagen']['tmp_name'], $imagen);

    $query = "INSERT INTO votacion_opciones_nuevo (nombre, imagen, anio) VALUES ('$nombre', '$imagen', $anio)";
    mysqli_query($conn, $query);

    $_SESSION['form_processed'] = true;
    header("Location: admin_votacion_ant.php");
    exit;
}

// Modificar opción
if (isset($_POST['update_option']) && !isset($_SESSION['form_processed'])) {
    $id = intval($_POST['id']);
    $nombre = mysqli_real_escape_string($conn, $_POST['nombre']);
    $anio = intval($_POST['anio']);
    $imagen = 'uploads/' . basename($_FILES['imagen']['name']);
    move_uploaded_file($_FILES['imagen']['tmp_name'], $imagen);

    $query = "UPDATE votacion_opciones_nuevo SET nombre = '$nombre', imagen = '$imagen', anio = $anio WHERE id = $id";
    mysqli_query($conn, $query);

    $_SESSION['form_processed'] = true;
    header("Location: admin_votacion_ant.php");
    exit;
}

// Eliminar opción
if (isset($_POST['delete_option']) && !isset($_SESSION['form_processed'])) {
    $id = intval($_POST['id']);
    $query = "DELETE FROM votacion_opciones_nuevo WHERE id = $id";
    mysqli_query($conn, $query);

    $_SESSION['form_processed'] = true;
    header("Location: admin_votacion_ant.php");
    exit;
}

// Borrar toda la información de las tablas votacion_opciones_nuevo y votos_nuevo
if (isset($_POST['delete_all']) && !isset($_SESSION['form_processed'])) {
    $query_delete_votos = "DELETE FROM votos_nuevo";
    mysqli_query($conn, $query_delete_votos);
    $query_delete_opciones = "DELETE FROM votacion_opciones_nuevo";
    mysqli_query($conn, $query_delete_opciones);

    $_SESSION['form_processed'] = true;
    header("Location: admin_votacion_ant.php");
    exit;
}

// Obtener opciones de votación
$query = "SELECT * FROM votacion_opciones_nuevo";
$opciones_result = mysqli_query($conn, $query);

// Obtener resultados de votación
$query = "
    SELECT vo.nombre, COUNT(v.opcion_id) as votos
    FROM votos_nuevo v
    JOIN votacion_opciones_nuevo vo ON v.opcion_id = vo.id
    GROUP BY v.opcion_id
";
$resultados_result = mysqli_query($conn, $query);

// Obtener detalles de los votos
$query = "
    SELECT u.firstname, u.lastname, u.username, vo.nombre as opcion_nombre
    FROM users u
    JOIN votos_nuevo v ON u.id = v.usuario_id
    JOIN votacion_opciones_nuevo vo ON v.opcion_id = vo.id
";
$detalles_votos_result = mysqli_query($conn, $query);

// Desactivar la bandera de formulario procesado después de que la página se ha cargado completamente
unset($_SESSION['form_processed']);
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Administración de Votaciones</title>
    <link rel="stylesheet" href="votacion.css">
    
    <script>
        function toggleDetails() {
            var detailsTable = document.getElementById("detailsTable");
            if (detailsTable.style.display === "none") {
                detailsTable.style.display = "table";
            } else {
                detailsTable.style.display = "none";
            }
        }

        function downloadExcel() {
            window.location.href = 'download_excel.php';
        }
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
                        <button type="button" onclick="location.href='votaciones_ant.php'" class="user-button">Regresar</button>
                    </form>
                    <form action="index.php" method="POST">
                        <button type="submit" name="logout" class="user-button">Cerrar sesión</button>
                    </form>
                </div>
            <?php endif; ?>
        </div>
        <div class="middle-section">
 
            <h1>Administración de Votaciones</h1>
            <h2>Agregar Opción</h2>
            <form action="admin_votacion_ant.php" method="POST" enctype="multipart/form-data">
                <input type="text" name="nombre" placeholder="Nombre del regalo" required>
                <input type="file" name="imagen" required>
                <select name="anio" required>
                    <option value="" disabled selected>Selecciona los años</option>
                    <?php for ($i = 5; $i <= 100; $i += 5): ?>
                        <option value="<?php echo $i; ?>"><?php echo $i; ?> años</option>
                    <?php endfor; ?>
                </select>
                <button type="submit" name="add_option">Agregar Opción</button>
            </form>

            <h2>Opciones Existentes</h2>
            <table>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Imagen</th>
                    <th>Año</th>
                    <th>Acciones</th>
                </tr>
                <?php while ($row = mysqli_fetch_assoc($opciones_result)) : ?>
                <tr>
                    <td><?php echo $row['id']; ?></td>
                    <td><?php echo $row['nombre']; ?></td>
                    <td><img src="<?php echo $row['imagen']; ?>" alt="<?php echo $row['nombre']; ?>" width="100"></td>
                    <td><?php echo $row['anio']; ?> años</td>
                    <td>
                        <form action="admin_votacion_ant.php" method="POST" enctype="multipart/form-data" style="display:inline-block;">
                            <input type="hidden" name="id" value="<?php echo $row['id']; ?>">
                            <input type="text" name="nombre" value="<?php echo $row['nombre']; ?>" >
                            <input type="file" name="imagen" >
                            <select name="anio" required>
                                <?php for ($i = 5; $i <= 100; $i += 5): ?>
                                    <option value="<?php echo $i; ?>" <?php echo $row['anio'] == $i ? 'selected' : ''; ?>><?php echo $i; ?> años</option>
                                <?php endfor; ?>
                            </select>
                            <button type="submit" name="update_option">Modificar</button>
                        </form>
                        <form action="admin_votacion_ant.php" method="POST" style="display:inline-block;">
                            <input type="hidden" name="id" value="<?php echo $row['id']; ?>">
                            <button type="submit" name="delete_option">Eliminar</button>
                        </form>
                    </td>
                </tr>
                <?php endwhile; ?>
            </table>

            <h2>Resultados de Votación</h2>
            <table>
                <tr>
                    <th>Opción</th>
                    <th>Votos</th>
                </tr>
                <?php while ($row = mysqli_fetch_assoc($resultados_result)) : ?>
                <tr>
                    <td><?php echo $row['nombre']; ?></td>
                    <td><?php echo $row['votos']; ?></td>
                </tr>
                <?php endwhile; ?>
            </table>

            <h2>Detalles de Votos</h2>
            <button onclick="toggleDetails()">Mostrar/Ocultar Detalles de Votos</button>
            <button onclick="downloadExcel()">Descargar Detalles en Excel</button>

            <table id="detailsTable" style="display: none;">
                <tr>
                    <th>Numero de Reloj</th>
                    <th>Nombre del Votante</th>
                    <th>Opción Votada</th>
                </tr>
                <?php while ($row = mysqli_fetch_assoc($detalles_votos_result)) : ?>
                <tr>
                    <td><?php echo $row['username']; ?></td>
                    <td><?php echo $row['firstname'] . ' ' . $row['lastname']; ?></td>
                    <td><?php echo $row['opcion_nombre']; ?></td>
                </tr>
                <?php endwhile; ?>
            </table>

            <form action="admin_votacion_ant.php" method="POST">
                <button type="submit" name="delete_all">Borrar toda la información de las tablas votacion_opciones y votos</button>
            </form>
        </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.3/xlsx.full.min.js"></script>
    <script>
        function downloadExcel() {
            var wb = XLSX.utils.table_to_book(document.getElementById('detailsTable'), {sheet: "Detalles de Votos"});
            XLSX.writeFile(wb, 'detalles_votos.xlsx');
        }
    </script>
</body>
</html>
