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
    $query = "SELECT firstname, username,lastname, position, area, plant, birthdate FROM users WHERE id = '$user_id'";
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

if (isset($_POST['update_pendiente'])) {
    $id = $_POST['id'];
    $pendiente = $_POST['pendiente'];
    $tabla = $_POST['tabla'];

    $query = "UPDATE $tabla SET pendiente = '$pendiente' WHERE id = '$id'";
    if (mysqli_query($conn, $query)) {
        echo "<script>alert('El estado de pendiente ha sido actualizado.');</script>";
    } else {
        echo "<script>alert('Error al actualizar el estado de pendiente: " . mysqli_error($conn) . "');</script>";
    }
}


  // Procesar los formularios
if (isset($_POST['borrar_tabla'])) {
    $tabla = $_POST['borrar_tabla'];

    // Verificar si la tabla existe antes de truncarla
    $check_query = "SHOW TABLES LIKE '$tabla'";
    $check_result = mysqli_query($conn, $check_query);

    if (mysqli_num_rows($check_result) == 1) {
        // Asegurar que la consulta de truncado esté asignada a la variable $query
        $query = "TRUNCATE TABLE $tabla";  // Esta línea es la corrección

        if (mysqli_query($conn, $query)) {
            echo "<script>alert('Todos los datos de la tabla $tabla han sido borrados.');</script>";
        } else {
            echo "<script>alert('Error al borrar los datos: " . mysqli_error($conn) . "');</script>";
        }
    } else {
        echo "<script>alert('La tabla $tabla no existe.');</script>";
    }
}  elseif (isset($_POST['borrar_fila'])) {
            $tabla = $_POST['tabla'];
            $id = $_POST['id'];
            $query = "DELETE FROM $tabla WHERE id = $id";
            if (mysqli_query($conn, $query)) {
                echo "<script>alert('El registro ha sido borrado.');</script>";
            } else {
                echo "<script>alert('Error al borrar el registro: " . mysqli_error($conn) . "');</script>";
            }
        } elseif ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $numero_reloj = $_POST['numero_reloj'];
            $tipo = $_POST['tipo'];
            
            // Verificar si el usuario tiene autorización tipo A o si el número de reloj coincide con su username
            if ($user['position'] !== 'A' && $numero_reloj !== $user['username']) {
                echo "<script>alert('No puede pedir el gafete de otra persona.');window.location.href = 'sodexo.php';</script>";
            } else {
                // Verificar si ya existe un registro de extravío o reposición para el número de reloj en el día actual
                $today = date('Y-m-d');
                $query = "SELECT id FROM extravios_sodexo WHERE numero_reloj = '$numero_reloj' AND DATE(fecha_hora) = '$today'
                          UNION
                          SELECT id FROM reposiciones_sodexo WHERE numero_reloj = '$numero_reloj' AND DATE(fecha_hora) = '$today'";
                $result = mysqli_query($conn, $query);
                
                if ($result && mysqli_num_rows($result) > 0) {
                    echo "<script>alert('Solo se permite un envío por día. Ya ha realizado una solicitud hoy.');window.location.href = 'sodexo.php';</script>";
                } else {
                    // Obtener el nombre de la persona con el número de reloj
                    $query = "SELECT firstname, lastname FROM users WHERE username = '$numero_reloj'";
                    $result = mysqli_query($conn, $query);
                    $nombre = '';
                    $motivo=$_POST['motivo'];
                    
                    if ($result && mysqli_num_rows($result) > 0) {
                        $row = mysqli_fetch_assoc($result);
                        $nombre = $row['firstname'] . ' ' . $row['lastname'];
                    }
                    
                    if ($tipo === 'extravio') {
                        $query = "INSERT INTO extravios_sodexo (numero_reloj, nombre, motivo, pendiente) VALUES ('$numero_reloj', '$nombre', 'Vencimiento', 1)";
                        if (mysqli_query($conn, $query)) {
                            $_SESSION['message'] = "Preséntese en el área de RH en 15 dias para recoger su tarjeta sodexo.";
                        } else {
                            echo "<script>alert('Error al guardar los datos: " . mysqli_error($conn) . "');</script>";
                        }
                    } elseif ($tipo === 'reposicion') {
                        $query = "INSERT INTO reposiciones_sodexo (numero_reloj, nombre, motivo, pendiente) VALUES ('$numero_reloj', '$nombre', '$motivo', 1)";
                        if (mysqli_query($conn, $query)) {
                            $_SESSION['message'] = "Preséntese en RH en 15 dias para recoger su tarjeta sodexo.";
                        } else {
                            echo "<script>alert('Error al guardar los datos: " . mysqli_error($conn) . "');</script>";
                        }
                    }
                // Redirigir para evitar reenvío del formulario al recargar la página
                    header("Location: " . $_SERVER['PHP_SELF']);
                    exit;
                }
            }    
        }
        
// Mostrar mensajes almacenados en la sesión
if (isset($_SESSION['message'])) {
    echo "<script>alert('" . $_SESSION['message'] . "');</script>";
    unset($_SESSION['message']);
}
if (isset($_SESSION['error'])) {
    echo "<script>alert('" . $_SESSION['error'] . "');</script>";
    unset($_SESSION['error']);
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
    <title>Gafetes</title>
    <link rel="stylesheet" href="departamentos.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Gotham';
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }

     
    
        .admin-button {
            display: none; /* Ocultar botones de administración por defecto */
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        table, th, td {
            border: 1px solid #000;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #000;
            color: #fff;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #f4d900;
        }

        .download-button, .delete-button {
            display: inline-block;
            width: 200px;
            padding: 10px;
            margin: 10px auto;
            color: #fff;
            background-color: #000;
            border: none;
            cursor: pointer;
            text-align: center;
            font-size: 16px;
            font-family:'Gotham';
        }

        .download-button:hover, .delete-button:hover {
            background-color: #f4d900;
        }
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.3/xlsx.full.min.js"></script>
    <script>
        function updateDateTime() {
            const now = new Date();
            const dateString = now.toLocaleDateString();
            const timeString = now.toLocaleTimeString();
            document.getElementById('datetime').textContent = `Fecha: ${dateString}, Hora: ${timeString}`;
        }

        setInterval(updateDateTime, 1000); // Actualiza cada segundo

        window.onload = updateDateTime; // Llama a la función al cargar la página

        function downloadExcel(tableId, fileName) {
            var table = document.getElementById(tableId);
            var wb = XLSX.utils.table_to_book(table, {sheet:"Sheet 1"});
            XLSX.writeFile(wb, fileName);
        }

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

        function confirmarBorrado(tabla) {
            if (confirm('¿Está seguro que desea borrar todos los datos de la tabla ' + tabla + '?')) {
                // Realizar la petición AJAX para borrar los datos
                var xhr = new XMLHttpRequest();
                xhr.open('POST', '');
                xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                xhr.onload = function() {
                    if (xhr.status === 200) {
                        alert('Los datos han sido borrados correctamente.');
                        // Aquí puedes recargar la página o actualizar la tabla
                        location.reload(); // Ejemplo de recarga de página
                    } else {
                        alert('Error al borrar los datos.');
                    }
                };
                xhr.send('borrar_tabla=' + tabla);
            }
        }

        function confirmarBorradoFila(tabla, id) {
            if (confirm('¿Está seguro que desea borrar este registro?')) {
                // Realizar la petición AJAX para borrar el registro
                var xhr = new XMLHttpRequest();
                xhr.open('POST', '');
                xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                xhr.onload = function() {
                    if (xhr.status === 200) {
                        alert('El registro ha sido borrado correctamente.');
                        // Aquí puedes recargar la página o actualizar la tabla
                        location.reload(); // Ejemplo de recarga de página
                    } else {
                        alert('Error al borrar el registro.');
                    }
                };
                xhr.send('borrar_fila=1&tabla=' + tabla + '&id=' + id);
            }
        }

        document.addEventListener('DOMContentLoaded', function() {
            const extravioButton = document.getElementById('extravioButton');
            const reposicionButton = document.getElementById('reposicionButton');
            const extravioForm = document.getElementById('extravioForm');
            const reposicionForm = document.getElementById('reposicionForm');

            extravioButton.addEventListener('click', function() {
                if (extravioForm.style.display === 'block') {
                    extravioForm.style.display = 'none';
                } else {
                    extravioForm.style.display = 'block';
                    reposicionForm.style.display = 'none';
                }
            });

            reposicionButton.addEventListener('click', function() {
                if (reposicionForm.style.display === 'block') {
                    reposicionForm.style.display = 'none';
                } else {
                    reposicionForm.style.display = 'block';
                    extravioForm.style.display = 'none';
                }
            });
        });
        function confirmarCambio(selectElement) {
        if (confirm('¿Está seguro que desea cambiar el estado de pendiente? Esta acción no se puede deshacer.')) {
            selectElement.form.submit();
        } else {
            selectElement.value = selectElement.defaultValue; // Revertir el valor del select
        }
    }
    </script>
</head>
<body>
    <div id="orientation-alert" style="display: none; justify-content: center; align-items: center; height: 100vh; background-color: #000; color: #fff; text-align: center;">
        <p>Por favor, gira tu dispositivo para usar la aplicación.</p>
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
                        <button type="button" onclick="location.href='laborales.php'" class="user-button">
                            Regresar
                        </button>
                    </form>
                    <form action="index.php" method="POST">
                        <button type="submit" name="logout" class="user-button">Cerrar sesión</button>
                    </form>
                </div>
            <?php endif; ?>
        </div>
        <div class="right-section" >
        <button class="back-button" onclick="location.href='laborales.php'">
                <i class="fas fa-arrow-left"></i> Regresar
            </button>
            <br>
            <br>
        <h1>Formulario para reposición de tarjeta sodexo</h1>
<br>

<div class="button-container">
        <div >
            <div class="button-grid">

            <button id="extravioButton" >  <i class="fas fa-exclamation-circle icon-large"></i><br><div>Vencimiento de Tarjeta Sodexo</div>        
            </button>
           
            <button id="reposicionButton"  ><i class="fas fa-sync-alt icon-large"></i><br><div>Reposición de Tarjeta Sodexo</div></button>
            </div>
           <br>
           <BR>

            <form id="extravioForm" action="" method="POST" style="display: none;">
            <input type="hidden" name="tipo" value="extravio">
            <h3 for="numero_reloj_extravio">Número de Reloj para para solicitar tarjeta por vencimiento:</h3>
                <input type="text" id="numero_reloj_extravio" name="numero_reloj" required>
                <div > 

                <button type="submit" class="envio">Enviar</button>
                </div>
            </form>
            <form id="reposicionForm" action="" method="POST" style="display: none;">
                <input type="hidden" name="tipo" value="reposicion">

                <h3 for="numero_reloj_reposicion">Número de Reloj para solicitar repuesto:</h3>
                <input type="text" id="numero_reloj_reposicion" name="numero_reloj" required>
                <br>
                <h3 for="numero_reloj_reposicion">Motivo:</h3>
                <input type="text" id="numero_reloj_reposicion" name="motivo" required>
                <p>Nota: Los motivos pueden ser Daño de la tarjeta, Daño del chip, Extravío.</p>
                 <div >
                <button type="submit" class="envio">Enviar</button>
                </div>
               </form>
         </div>    
</div>
            <?php if ($user && $user['position'] == 'A') : ?>
                

                <h1>Solicitudes de Tarjetas Sodexo Vencidas</h1>
<table id="extravios_sodexo_Table">
    <thead>
        <tr>
            <th>ID</th>
            <th>Número de Reloj</th>
            <th>Nombre</th>
            <th>Motivo</th>
            <th>Fecha y Hora de la solicitud</th>
            <th>Pendiente</th>
            <th>Acciones</th>
        </tr>
    </thead>
    <tbody>
        <?php
        $query = "SELECT * FROM extravios_sodexo";
        $result = mysqli_query($conn, $query);

        if ($result && mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                echo "<tr>
                        <td>{$row['id']}</td>
                        <td>{$row['numero_reloj']}</td>
                        <td>{$row['nombre']}</td>
                        <td>{$row['motivo']}</td>
                        <td>{$row['fecha_hora']}</td>
                        <td>
                            <form method='POST' action=''>
                                <input type='hidden' name='id' value='{$row['id']}'>
                                <input type='hidden' name='tabla' value='extravios_sodexo'>
                             <select name='pendiente' onchange='confirmarCambio(this)'>
                                  <option value='1'" . ($row['pendiente'] == 1 ? ' selected' : '') . ">Si</option>
                                  <option value='0'" . ($row['pendiente'] == 0 ? ' selected' : '') . ">No</option>
                             </select>

                                <input type='hidden' name='update_pendiente' value='1'>
                            </form>
                        </td>
                        <td><button class='envio' onclick=\"confirmarBorradoFila('extravios_sodexo', {$row['id']})\">Borrar</button></td>
                      </tr>";
            }
        } else {
            echo "<tr><td colspan='6'>No hay datos disponibles</td></tr>";
        }
        ?>
    </tbody>
</table>
<button class="download-button" onclick="downloadExcel('extravios_sodexo_Table', 'extravios_sodexo.xlsx')">Descargar como Excel</button>
<button class="delete-button" onclick="confirmarBorrado('extravios_sodexo')">Borrar Todos los Datos</button>

<h1>Solicitudes de Reposiciones de Tarjetas Sodexo</h1>
<table id="reposiciones_sodexo_Table">
    <thead>
        <tr>
            <th>ID</th>
            <th>Número de Reloj</th>
            <th>Nombre</th>
            <th>Motivo</th>
            <th>Fecha y Hora de la solicitud</th>
            <th>Pendiente</th>
            <th>Acciones</th>
        </tr>
    </thead>
    <tbody>
        <?php
        $query = "SELECT * FROM reposiciones_sodexo";
        $result = mysqli_query($conn, $query);

        if ($result && mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                echo "<tr>
                        <td>{$row['id']}</td>
                        <td>{$row['numero_reloj']}</td>
                        <td>{$row['nombre']}</td>
                        <td>{$row['motivo']}</td>
                        <td>{$row['fecha_hora']}</td>
                        <td>
                            <form method='POST' action=''>
                                <input type='hidden' name='id' value='{$row['id']}'>
                                <input type='hidden' name='tabla' value='reposiciones_sodexo'>
                                <select name='pendiente' onchange='confirmarCambio(this)'>
                                      <option value='1'" . ($row['pendiente'] == 1 ? ' selected' : '') . ">Si</option>
                                      <option value='0'" . ($row['pendiente'] == 0 ? ' selected' : '') . ">No</option>
                                </select>

                                <input type='hidden' name='update_pendiente' value='1'>
                            </form>
                        </td>
                        <td><button class='envio' onclick=\"confirmarBorradoFila('reposiciones_sodexo', {$row['id']})\">Borrar</button></td>
                      </tr>";
            }
        } else {
            echo "<tr><td colspan='6'>No hay datos disponibles</td></tr>";
        }
        ?>
    </tbody>
</table>
<button class="download-button" onclick="downloadExcel('reposiciones_sodexo_Table', 'reposiciones_sodexo.xlsx')">Descargar como Excel</button>
<button class="delete-button" onclick="confirmarBorrado('reposiciones_sodexo')">Borrar Todos los Datos</button>

        </div>
        <?php endif;?>
    </div>
</body>
</html>
