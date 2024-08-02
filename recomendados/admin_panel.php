<?php
session_start();

// Conexión a la base de datos
$host = 'localhost';
$user = 'root';
$password = '';
$database = 'id22166131_usuarios';

$conn = mysqli_connect($host, $user, $password, $database);

if (!$conn) {
    die("Error de conexión: " . mysqli_connect_error());
}

if (!isset($_SESSION['logged_in']) || $_SESSION['logged_in'] !== true) {
    header("Location: admin_login.php");
    exit;
}

$alert_message = "";
$alert_type = "";

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if (isset($_POST['add_date'])) {
        $fecha = $_POST['fecha'];
        $cupos = $_POST['cupos'];
        $posicion = $_POST['posicion']; // Nueva variable

        $sql_check_date = "SELECT * FROM fechas_disponibles WHERE Fecha = '$fecha' AND Posicion = '$posicion'";
        $result_check_date = mysqli_query($conn, $sql_check_date);

        if (mysqli_num_rows($result_check_date) == 0) {
            $sql_add = "INSERT INTO fechas_disponibles (Fecha, Cupos, Posicion) VALUES ('$fecha', '$cupos', '$posicion')";
            mysqli_query($conn, $sql_add);
            $alert_message = "Fecha agregada exitosamente.";
            $alert_type = "success";
        } else {
            $alert_message = "La fecha para la posición ya existe. Inserta una nueva fecha o posición.";
            $alert_type = "error";
        }
    }

    if (isset($_POST['update_date'])) {
        $id = $_POST['id'];
        $fecha = $_POST['fecha'];
        $cupos = $_POST['cupos'];
        $posicion = $_POST['posicion']; // Nueva variable
        $sql_update = "UPDATE fechas_disponibles SET Fecha='$fecha', Cupos='$cupos', Posicion='$posicion' WHERE Id='$id'";
        mysqli_query($conn, $sql_update);
    }

    if (isset($_POST['delete_date'])) {
        $id = $_POST['id'];
        $sql_delete = "DELETE FROM fechas_disponibles WHERE Id='$id'";
        mysqli_query($conn, $sql_delete);
    }

    if (isset($_POST['delete_all'])) {
        $sql_delete_all = "DELETE FROM citas";
        mysqli_query($conn, $sql_delete_all);
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panel de Administración</title>
    <link rel="stylesheet" href="adpanel.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.16.9/xlsx.full.min.js"></script>
    <script>
    function downloadExcel() {
        var wb = XLSX.utils.table_to_book(document.getElementById('detailsTable'), {sheet: "Detalles de Citas"});
        XLSX.writeFile(wb, 'detalles_citas.xlsx');
    }

    function showConfirmation(message, type) {
        if (confirm(message)) {
            console.log('Usuario hizo clic en OK');
        } else {
            console.log('Usuario hizo clic en Cancelar');
        }
    }

    <?php if ($alert_message): ?>
    window.onload = function() {
        showConfirmation("<?php echo $alert_message; ?>", "<?php echo $alert_type; ?>");
    }
    <?php endif; ?>
    </script>
</head>
<body>
    <div class="container">
        <div class="logo-container">
            <img src="Images/X.webp" alt="Logo">
        </div>
        <h1>Bienvenido al Panel de Administración</h1>
        <form action="logout.php" method="POST">
            <button type="submit">Cerrar Sesión</button>
        </form>
    </div>
     
    <div class="table-container">
        <?php
        $sql_citas = "SELECT * FROM citas";
        $result_citas = mysqli_query($conn, $sql_citas);

        if (mysqli_num_rows($result_citas) > 0) {
            echo "<h3>Registros de Citas</h3>";
            echo "<table id='detailsTable'>";
            echo "<tr><th>ID</th><th>Nombre</th><th>Correo</th><th>Género</th><th>Fecha</th><th>Teléfono</th><th>Posición</th><th>Confirmación</th></tr>";
            while ($row = mysqli_fetch_assoc($result_citas)) {
                echo "<tr>";
                echo "<td>" . $row["Id"] . "</td>";
                echo "<td>" . $row["Nombre"] . "</td>";
                echo "<td>" . $row["Correo"] . "</td>";
                echo "<td>" . $row["Genero"] . "</td>";
                echo "<td>" . $row["Fecha"] . "</td>";
                echo "<td>" . $row["Telefono"] . "</td>";
                echo "<td>" . $row["Posicion"] . "</td>";
                echo "<td>" . $row["Confirmacion"] . "</td>";
                echo "</tr>";
            }
            echo "</table>";
        } else {
            echo "<p>No se encontraron registros de citas.</p>";
        }
        ?>
    </div>

    <div class="button-container">
        <button onclick="downloadExcel()">Descargar Tabla en Excel</button>
    </div>

    <div class="button-container">
        <form action="admin_panel.php" method="POST">
            <button type="submit" name="delete_all">Borrar toda la información de la tabla de citas</button>
        </form>
    </div>

    <div class="form-container">
        <h3>Agregar Fecha Disponible</h3>
        <form action="admin_panel.php" method="POST">
            <input type="date" name="fecha" required>
            <input type="number" name="cupos" placeholder="Cupos" required>
            <input type="text" name="posicion" placeholder="Posición" required> <!-- Nuevo campo para posición -->
            <button type="submit" name="add_date">Agregar Fecha</button>
        </form>
    </div>

    <div class="table-container">
        <h3>Fechas Disponibles</h3>
        <?php
        $sql_fechas = "SELECT * FROM fechas_disponibles";
        $result_fechas = mysqli_query($conn, $sql_fechas);

        if (mysqli_num_rows($result_fechas) > 0) {
            echo "<table>";
            echo "<tr><th>ID</th><th>Fecha</th><th>Cupos</th><th>Posición</th><th>Acciones</th></tr>";
            while ($row_fecha = mysqli_fetch_assoc($result_fechas)) {
                echo "<tr>";
                echo "<td>" . $row_fecha["Id"] . "</td>";
                echo "<td>" . $row_fecha["Fecha"] . "</td>";
                echo "<td>" . $row_fecha["Cupos"] . "</td>";
                echo "<td>" . $row_fecha["Posicion"] . "</td>";
                echo "<td>
                    <form action='admin_panel.php' method='POST' style='display:inline-block;'>
                        <input type='hidden' name='id' value='" . $row_fecha["Id"] . "'>
                        <input type='date' name='fecha' value='" . $row_fecha["Fecha"] . "' required>
                        <input type='number' name='cupos' value='" . $row_fecha["Cupos"] . "' required>
                        <input type='text' name='posicion'placeholder='Posición' value='" . $row_fecha["Posicion"] . "' required> <!-- Nuevo campo para posición -->
                        <button type='submit' name='update_date'>Modificar</button>
                    </form>
                    <form action='admin_panel.php' method='POST' style='display:inline-block;'>
                        <input type='hidden' name='id' value='" . $row_fecha["Id"] . "'>
                        <button type='submit' name='delete_date'>Eliminar</button>
                    </form>
                </td>";
                echo "</tr>";
            }
            echo "</table>";
        } else {
            echo "<p>No se encontraron fechas disponibles.</p>";
        }
        ?>
    </div>
</body>
</html>
