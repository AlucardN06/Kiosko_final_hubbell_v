<?php
session_start();

// Verificar si el usuario está logueado
if (!isset($_SESSION['username'])) {
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
    echo "<script>alert('Error de conexión: " . mysqli_connect_error() . "');window.location.href = 'dashboard.php';</script>";
    exit;
}

// Obtener información del usuario si está en sesión
$user = null;
if (isset($_SESSION['username'])) {
    $username = $_SESSION['username'];
    $query = "SELECT id, firstname, lastname, position, area, plant, username FROM users WHERE username = '$username'";
    $result = mysqli_query($conn, $query);

    if ($result && mysqli_num_rows($result) > 0) {
        $user = mysqli_fetch_assoc($result);
        $user_id = $user['id']; // Obtener user_id para futuras consultas
    } else {
        die("Error al obtener datos del usuario");
    }
}

// Eliminar suplencias expiradas
$query = "DELETE FROM temporary_approvals WHERE expiration_time <= NOW()";
if (!mysqli_query($conn, $query)) {
    die("Error al eliminar las suplencias expiradas: " . mysqli_error($conn));
}

// Obtener IDs de usuarios para los cuales el usuario actual es suplente
$current_suplencias_query = "SELECT approve_user_id FROM temporary_approvals WHERE user_id = '$user_id' AND expiration_time > NOW()";
$current_suplencias_result = mysqli_query($conn, $current_suplencias_query);
$current_suplencias = [];
while ($row = mysqli_fetch_assoc($current_suplencias_result)) {
    $current_suplencias[] = $row['approve_user_id'];
}

// Consulta para obtener los usuarios con posición tipo C o A, excluyendo los ya seleccionados como suplentes por otros usuarios
$query = "
    SELECT u.* 
    FROM users u
    LEFT JOIN temporary_approvals ta ON u.id = ta.approve_user_id AND ta.expiration_time > NOW()
    WHERE u.position IN ('C', 'A') 
    AND (ta.user_id = '$user_id' OR ta.approve_user_id IS NULL)
";
$usersC_result = mysqli_query($conn, $query);

// Obtener suplencias actuales del usuario logueado
$query = "SELECT approve_user_id FROM temporary_approvals WHERE user_id = '$user_id' AND expiration_time > NOW()";
$current_approvals_result = mysqli_query($conn, $query);
$current_approvals = [];
if ($current_approvals_result) {
    while ($row = mysqli_fetch_assoc($current_approvals_result)) {
        $current_approvals[] = $row['approve_user_id'];
    }
}

// Permiso para aprobar propuestas como suplente por días
if ($user && $user['position'] == 'AB' && isset($_POST['approve_long'])) {
    $approve_user_id = $_POST['approve_user_id'];
    $days = $_POST['days'];
    $current_time = time();
    $expiration_time = $current_time + ($days * 24 * 60 * 60); // Calcula el tiempo de expiración en días

    if (in_array($approve_user_id, $current_suplencias)) {
        echo "<script>alert('Ya eres suplente para este usuario. No puedes agregar suplencia nuevamente.');</script>";
    } else {
        $query = "INSERT INTO temporary_approvals (user_id, approve_user_id, expiration_time, username) 
                  VALUES ('$user_id', '$approve_user_id', FROM_UNIXTIME($expiration_time), '$username')";
        if (!mysqli_query($conn, $query)) {
            die("Error al conceder permiso temporal largo: " . mysqli_error($conn));
        } else {
            echo "<script>alert('Suplencia otorgada correctamente');window.location.href = 'suplentes.php';</script>";
        }
    }
}

// Permiso para quitar suplencia
if ($user && $user['position'] == 'AB' && isset($_GET['remove'])) {
    $remove_user_id = $_GET['remove'];

    // Verificar si el usuario otorgó la suplencia que intenta quitar
    $query = "SELECT * FROM temporary_approvals WHERE user_id = '$user_id' AND approve_user_id = '$remove_user_id'";
    $result = mysqli_query($conn, $query);
    
    if (mysqli_num_rows($result) > 0) {
        $query = "DELETE FROM temporary_approvals WHERE user_id = '$user_id' AND approve_user_id = '$remove_user_id'";
        if (!mysqli_query($conn, $query)) {
            die("Error al quitar la suplencia: " . mysqli_error($conn));
        } else {
            echo "<script>alert('Suplencia eliminada correctamente');window.location.href = 'suplentes.php';</script>";
        }
    } else {
        echo "<script>alert('No tienes permiso para quitar esta suplencia.');</script>";
    }
}
?>
<link rel="stylesheet" href="dashboard.css">

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <style>
        .table-container {
            display: none;
        }
        .reject-reason {
            display: none;
        }
        .confirm-reject-btn {
            display: none;
        }
        #searchInput {
            margin-bottom: 10px;
        }
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.3/xlsx.full.min.js"></script>
    <script>
        function toggleVisibility(containerId, button) {
            var container = document.getElementById(containerId);
            if (container.style.display === 'none' || container.style.display === '') {
                container.style.display = 'block';
                button.textContent = button.textContent.replace('Mostrar', 'Ocultar');
            } else {
                container.style.display = 'none';
                button.textContent = button.textContent.replace('Ocultar', 'Mostrar');
            }
        }

        function searchTable() {
            var input, filter, table, tr, td, i, j, txtValue;
            input = document.getElementById("searchInput");
            filter = input.value.toUpperCase();
            table = document.getElementById("usersCTable");
            tr = table.getElementsByTagName("tr");
            for (i = 1; i < tr.length; i++) {
                tr[i].style.display = "none";
                td = tr[i].getElementsByTagName("td");
                for (j = 0; j < td.length; j++) {
                    if (td[j]) {
                        txtValue = td[j].textContent || td[j].innerText;
                        if (txtValue.toUpperCase().indexOf(filter) > -1) {
                            tr[i].style.display = "";
                            break;
                        }
                    }
                }
            }
        }

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

        function confirmAddSuplencia() {
            return confirm('¿Estás seguro de que deseas agregar esta suplencia?');
        }

        function confirmRemoveSuplencia() {
            return confirm('¿Estás seguro de que deseas quitar esta suplencia?');
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
            background-color: rgba(0, 0, 0, 0.7); /* Fondo semi-transparente */
            color: white;
            font-size: 24px;
            text-align: center;
            justify-content: center;
            align-items: center;
            z-index: 9999; /* Asegura que se muestre por encima de otros elementos */
        }
    </style>
</head>
<body>
    <div id="orientation-alert">
        Por favor, gira tu dispositivo para usar la aplicación en modo horizontal.
    </div>
    <div class="container">
        <div class="left-section user-info">
            <div class="logo">
                <img src="images/Logo.webp" alt="Logo">
            </div>
            <?php if ($user): ?>
                <h2>Bienvenido, <?php echo htmlspecialchars($user['firstname'] . ' ' . $user['lastname']); ?></h2>
                <p>Puesto: <?php echo htmlspecialchars($user['area']); ?></p>
                <p>Autorización tipo: <?php echo htmlspecialchars($user['position']); ?></p>
                <p>Planta: <?php echo htmlspecialchars($user['plant']); ?></p>
                <p id="datetime"></p>
                <div class="user-buttons">
                    <form>
                        <button type="button" onclick="location.href='departamentos.php'" class="user-button">
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
            <?php if ($user && $user['position'] == 'AB') : ?>
                <h1>Personal suplente</h1>
                <button onclick="toggleVisibility('usersCTableContainer', this)">Mostrar Personal suplente</button>
                <div id="usersCTableContainer" class="table-container">
                    <input type="text" id="searchInput" onkeyup="searchTable()" placeholder="Buscar en la tabla...">
                    <table id="usersCTable" class="proposal-table">
                        <thead>
                            <tr>
                                <th>Nombre</th>
                                <th>Apellido</th>
                                <th>Área</th>
                                <th>Planta</th>
                                <th>Username</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php if ($usersC_result && mysqli_num_rows($usersC_result) > 0) : ?>
                                <?php while ($userC = mysqli_fetch_assoc($usersC_result)) : ?>
                                    <tr>
                                        <td><?php echo htmlspecialchars($userC['firstname']); ?></td>
                                        <td><?php echo htmlspecialchars($userC['lastname']); ?></td>
                                        <td><?php echo htmlspecialchars($userC['area']); ?></td>
                                        <td><?php echo htmlspecialchars($userC['plant']); ?></td>
                                        <td><?php echo htmlspecialchars($userC['username']); ?></td>
                                        <td>
                                            <?php if (in_array($userC['id'], $current_suplencias)) : ?>
                                                <!-- Mostrar al usuario que ya está suplente -->
                                                Ya es suplente
                                                <?php if ($userC['id'] !== $user_id) : ?>
                                                    <!-- Mostrar botón solo si no es el propio usuario -->
                                                    <a href="?remove=<?php echo htmlspecialchars($userC['id']); ?>" onclick="return confirmRemoveSuplencia()">Quitar suplencia</a>
                                                <?php endif; ?>
                                            <?php elseif (!in_array($userC['id'], $current_approvals)) : ?>
                                                <!-- Mostrar formulario para agregar suplencia larga -->
                                                <form method="POST" onsubmit="return confirmAddSuplencia()">
                                                    <input type="hidden" name="approve_user_id" value="<?php echo htmlspecialchars($userC['id']); ?>">
                                                    <br>
                                                    <input type="number" name="days" min="1" placeholder="Días de suplencia" required>
                                                    <br>
                                                    <p></p>
                                                    <button type="submit" name="approve_long">Aprobar suplencia larga</button>
                                                </form>
                                            <?php endif; ?>
                                        </td>
                                    </tr>
                                <?php endwhile; ?>
                            <?php else : ?>
                                <!-- Mostrar mensaje si no hay personal con posición tipo C -->
                                <tr>
                                    <td colspan="6">No hay personal con posición tipo C.</td>
                                </tr>
                            <?php endif; ?>
                        </tbody>
                    </table>
                </div>
            <?php endif; ?>
            <!-- Resto del contenido del dashboard -->
        </div>
    </div>
</body>
</html>
