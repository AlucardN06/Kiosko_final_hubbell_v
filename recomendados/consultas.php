<?php
// Inicia la sesión
if (!isset($_SESSION)) {
    session_start();
}


// Verifica si el usuario está autenticado como administrador
if (!isset($_SESSION['admin_logged_in']) || $_SESSION['admin_logged_in'] !== true) {
    // Si no está autenticado, redirige a la página de inicio de sesión del administrador
    header("Location: admin_login.php");
    exit;
}

// Conexión a la base de datos
$cn = mysqli_connect('localhost', 'id22166131_root', 'Hubbell0#');
mysqli_select_db($cn, 'id22166131_usuarios');

// Procesar la acción del formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST['agregar_fecha'])) {
        $fecha_nueva = $_POST['fecha_nueva'];
        $sql_insert = "INSERT INTO fechas_disponibles (Fecha) VALUES ('$fecha_nueva')";
        mysqli_query($cn, $sql_insert);
    } elseif (isset($_POST['eliminar_fecha'])) {
        $fecha_seleccionada = $_POST['fecha_disponible'];
        $sql_delete = "DELETE FROM fechas_disponibles WHERE Fecha = '$fecha_seleccionada'";
        mysqli_query($cn, $sql_delete);
    } elseif (isset($_POST['modificar_fecha'])) {
        $fecha_seleccionada = $_POST['fecha_disponible'];
        $fecha_nueva = $_POST['fecha_nueva'];
        $sql_update = "UPDATE fechas_disponibles SET Fecha = '$fecha_nueva' WHERE Fecha = '$fecha_seleccionada'";
        mysqli_query($cn, $sql_update);
    }
}

// Consulta para obtener las fechas disponibles
$sql_fechas = "SELECT * FROM fechas_disponibles";
$result_fechas = mysqli_query($cn, $sql_fechas);

// Consulta para obtener los registros de citas
$sql_citas = "SELECT * FROM citas";
$result_citas = mysqli_query($cn, $sql_citas);

// Mostrar las fechas disponibles y permitir agregar, modificar y eliminar fechas
echo "<h3>Administrar Fechas Disponibles</h3>";
echo "<form action='' method='POST'>";
echo "<select name='fecha_disponible'>";
while ($row_fecha = mysqli_fetch_assoc($result_fechas)) {
    echo "<option value='" . $row_fecha["Fecha"] . "'>" . $row_fecha["Fecha"] . "</option>";
}
echo "</select>";
echo "<input type='date' name='fecha_nueva' placeholder='Nueva Fecha'>";
echo "<button type='submit' name='agregar_fecha'>Agregar Fecha</button>";
echo "<button type='submit' name='modificar_fecha'>Modificar Fecha</button>";
echo "<button type='submit' name='eliminar_fecha'>Eliminar Fecha</button>";
echo "</form>";

// Mostrar los registros de citas
if (mysqli_num_rows($result_citas) > 0) {
    echo "<h3>Registros de Citas</h3>";
    echo "<table>";
    echo "<tr><th>ID</th><th>Nombre</th><th>Correo</th><th>Fecha</th><th>Confirmación</th></tr>";
    while ($row = mysqli_fetch_assoc($result_citas)) {
        echo "<tr>";
        echo "<td>" . $row["Id"] . "</td>";
        echo "<td>" . $row["Nombre"] . "</td>";
        echo "<td>" . $row["Correo"] . "</td>";
        echo "<td>" . $row["Fecha"] . "</td>";
        echo "<td>" . $row["Confirmacion"] . "</td>";
        echo "</tr>";
    }
    echo "</table>";
} else {
    echo "<p>No se encontraron registros de citas.</p>";
}

// Cerrar la conexión a la base de datos
mysqli_close($cn);
?>
