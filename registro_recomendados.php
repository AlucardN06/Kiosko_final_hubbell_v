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
        $birthdate = date('md', strtotime($user['birthdate']));
        $today = date('md', strtotime('today'));

        if ($birthdate === $today && !isset($_SESSION['birthday_message_shown'])) {
            echo "<script>alert('¡Feliz cumpleaños, " . $user['firstname'] . "! Te deseamos un feliz cumpleaños. Atte: Hubbell RH');</script>";
            $_SESSION['birthday_message_shown'] = true;
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

// Obtener datos de la tabla recomendaciones
$query_recomendaciones = "SELECT * FROM recomendaciones";
$result_recomendaciones = mysqli_query($conn, $query_recomendaciones);

// Obtener datos de la tabla citas
$query_citas = "SELECT * FROM citas";
$result_citas = mysqli_query($conn, $query_citas);

// Cerrar sesión
if (isset($_POST['logout'])) {
    session_destroy();
    header("Location: index.php");
    exit;
}

// Eliminar todas las recomendaciones
if (isset($_POST['delete_all_recomendaciones'])) {
    $query = "DELETE FROM recomendaciones";
    mysqli_query($conn, $query);
    header("Location: " . $_SERVER['PHP_SELF']);
    exit;
}

// Eliminar una recomendación específica
if (isset($_POST['delete_recomendacion'])) {
    $id = $_POST['delete_recomendacion'];
    $query = "DELETE FROM recomendaciones WHERE id = '$id'";
    mysqli_query($conn, $query);
    header("Location: " . $_SERVER['PHP_SELF']);
    exit;
}

// Eliminar todas las citas
if (isset($_POST['delete_all_citas'])) {
    $query = "DELETE FROM citas";
    mysqli_query($conn, $query);
    header("Location: " . $_SERVER['PHP_SELF']);
    exit;
}

// Eliminar una cita específica
if (isset($_POST['delete_cita'])) {
    $id = $_POST['delete_cita'];
    $query = "DELETE FROM citas WHERE id = '$id'";
    mysqli_query($conn, $query);
    header("Location: " . $_SERVER['PHP_SELF']);
    exit;
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bienvenid@ a tu kiosko Hubbell</title>
    <link rel="stylesheet" href="departamentos.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.0/xlsx.full.min.js"></script>
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
                document.getElementById('orientation-alert').style.display = 'flex';
            } else {
                document.getElementById('orientation-alert').style.display = 'none';
            }
        }

        window.onload = checkOrientation;
        window.addEventListener('orientationchange', checkOrientation);
        window.addEventListener('resize', checkOrientation);

        function exportTableToExcel(tableID, filename = '') {
            var downloadLink;
            var dataType = 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';
            var tableSelect = document.getElementById(tableID);
            var tableHTML = tableSelect.outerHTML.replace(/ /g, '%20');

            filename = filename ? filename + '.xls' : 'excel_data.xls';
            downloadLink = document.createElement("a");
            document.body.appendChild(downloadLink);

            if (navigator.msSaveOrOpenBlob) {
                var blob = new Blob(['\ufeff', tableHTML], {
                    type: dataType
                });
                navigator.msSaveOrOpenBlob(blob, filename);
            } else {
                downloadLink.href = 'data:' + dataType + ', ' + tableHTML;
                downloadLink.download = filename;
                downloadLink.click();
            }
        }
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

        .icon-container {
            position: relative;
            top: 15px;
            display: inline-block;
        }

        .icon-top {
            position: absolute;
            top: -30px;
            left: 50%;
            transform: translateX(-50%);
            display: flex;
            justify-content: center;
            width: 100px;
        }

        .icon-top i {
            position: absolute;
            font-size: 20px;
            color: #f4d900;
            background: #000;
            border-radius: 50%;
            padding: 5px;
            box-shadow: 0 0 2px rgba(0, 0, 0, 0.3);
        }

        .icon-top .fa-search {
            top: 5px;
            left: 0;
            transform: translate(-50%, -50%) rotate(-30deg);
        }

        .icon-top .fa-phone {
            top: 5px;
            left: 50%;
            transform: translate(-50%, -50%) rotate(0deg);
        }

        .icon-top .fa-folder {
            top: 5px;
            right: 0;
            transform: translate(50%, -50%) rotate(30deg);
        }

        .icon-button div {
            margin-top: 10px;
            font-size: 14px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table, th, td {
            border: 1px solid black;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #f4d900; /* Amarillo */
    font-family: 'Gotham';

    color: #000000; /* Negro */        }

        @media screen and (max-width: 768px) {
            table, thead, tbody, th, td, tr {
                display: block;
            }

            th, td {
                padding: 10px;
                text-align: right;
                border: none;
                position: relative;
                padding-left: 50%;
                white-space: normal;
                
            }

            th::before, td::before {
                position: absolute;
                left: 10px;
                width: 45%;
                  background-color: #f4d900; /* Amarillo */
    font-family: 'Gotham';

    color: #000000; /* Negro */
                white-space: nowrap;
                text-align: left;
                font-weight: bold;
            }

            thead tr {
                display: none;
            }

            tbody tr {
                border: solid 1px #ccc;
                margin-bottom: 5px;
                padding: 5px;
            }
        }

        .btn-green {
            background-color: green;
            color: white;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 10px 2px;
            cursor: pointer;
            border-radius: 5px;
            font-family:'Gotham';
        }

        .btn-red {
            background-color: red;
            color: white;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 10px 2px;
            cursor: pointer;
            border-radius: 5px;
            font-family:'Gotham';

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
                <p>Autorización tipo: <?php echo htmlspecialchars($user['position']); ?></p>
                <p>Planta: <?php echo htmlspecialchars($user['plant']); ?></p>
                <p id="datetime"></p>
                <div class="user-buttons">
                    <form>    
                        <button type="button" onclick="location.href='ta.php'" class="user-button">Regresar</button>
                    </form>
                    <form action="index.php" method="POST">
                        <button type="submit" name="logout" class="user-button">Cerrar sesión</button>
                    </form>
                </div>
            <?php endif; ?>
        </div>
        <div class="right-section">
            <h1 class="department-title">Registros</h1>

            <h2 class="b_ol">Recomendaciones Indirectas</h2>
        
            <table id="tabla_recomendaciones">
                <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Correo</th>
                        <th>Teléfono</th>
                        <th>Género</th>
                        <th>Posición</th>
                        <th>Acción</th>
                    </tr>
                </thead>
                <tbody>
                    <?php if (mysqli_num_rows($result_recomendaciones) > 0) : ?>
                        <?php while ($row = mysqli_fetch_assoc($result_recomendaciones)) : ?>
                            <tr>
                                <td><?php echo htmlspecialchars($row['nombre']); ?></td>
                                <td><?php echo htmlspecialchars($row['correo']); ?></td>
                                <td><?php echo htmlspecialchars($row['telefono']); ?></td>
                                <td><?php echo htmlspecialchars($row['genero']); ?></td>
                                <td><?php echo htmlspecialchars($row['posicion']); ?></td>
                                <td>
                                    <form method="POST" action="" style="display:inline;">
                                        <button type="submit" name="delete_recomendacion" value="<?php echo $row['id']; ?>" class="btn-red">Eliminar</button>
                                    </form>
                                </td>
                            </tr>
                        <?php endwhile; ?>
                    <?php else : ?>
                        <tr>
                            <td colspan="6">No hay datos disponibles</td>
                        </tr>
                    <?php endif; ?>
                </tbody>
            </table>

            <form method="POST" action="">
                <button type="submit" name="delete_all_recomendaciones" class="btn-red">Eliminar todos los datos</button>
            </form>
            <form method="POST" action="export_excel.php">
            <button type="submit" class="btn-green">Descargar Excel</button>

            </form>

            <h2 class="b_ol">Recomendaciones Directos</h2>
      
            <table id="tabla_citas">
                <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Género</th>
                        <th>Correo</th>                        
                        <th>Teléfono</th>
                        <th>Fecha</th>
                        <th>Confirmación</th>
                        <th>Posición</th>
                        <th>Acción</th>
                    </tr>
                </thead>
                <tbody>
                    <?php if (mysqli_num_rows($result_citas) > 0) : ?>
                        <?php while ($row = mysqli_fetch_assoc($result_citas)) : ?>
                            <tr>
                                <td><?php echo htmlspecialchars($row['Nombre']); ?></td>
                                <td><?php echo htmlspecialchars($row['Genero']); ?></td>
                                <td><?php echo htmlspecialchars($row['Correo']); ?></td>
                                <td><?php echo htmlspecialchars($row['Telefono']); ?></td>
                                <td><?php echo htmlspecialchars($row['Fecha']); ?></td>
                                <td><?php echo htmlspecialchars($row['Confirmacion']); ?></td>
                                <td><?php echo htmlspecialchars($row['Posicion']); ?></td>
                                <td>
                                    <form method="POST" action="" style="display:inline;">
                                        <button type="submit" name="delete_cita" value="<?php echo $row['Id']; ?>" class="btn-red">Eliminar</button>
                                    </form>
                                </td>
                            </tr>
                        <?php endwhile; ?>
                    <?php else : ?>
                        <tr>
                            <td colspan="9">No hay datos disponibles</td>
                        </tr>
                    <?php endif; ?>
                </tbody>
            </table>

            <form method="POST" action="">
                <button type="submit" name="delete_all_citas" class="btn-red">Eliminar todos los datos</button>
            </form >
            <form action="export_citas.php" method="POST" >
            <button type="submit" class="btn-green">Descargar Excel</button>

            </form>
        </div>
    </div>
</body>
</html>

<?php
mysqli_free_result($result_recomendaciones);
mysqli_free_result($result_citas);
mysqli_close($conn);
?>
