<?php
$cn = mysqli_connect('localhost', 'id22166131_root', 'Hubbell0#');
mysqli_select_db($cn, 'id22166131_usuarios');

// Consulta para obtener las fechas disponibles
$sql_fechas = "SELECT * FROM fechas_disponibles";
$result_fechas = mysqli_query($cn, $sql_fechas);

if (mysqli_num_rows($result_fechas) > 0) {
    echo "<h3>Administrar Fechas Disponibles</h3>";
    echo "<form action='administrar_fechas.php' method='POST'>";
    echo "<select name='fecha_disponible'>";
    while ($row_fecha = mysqli_fetch_assoc($result_fechas)) {
        echo "<option value='" . $row_fecha["Fecha"] . "'>" . $row_fecha["Fecha"] . "</option>";
    }
    echo "</select>";
    echo "<button type='submit' name='agregar_fecha'>Agregar Fecha</button>";
    echo "<button type='submit' name='eliminar_fecha'>Eliminar Fecha</button>";
    echo "</form>";
} else {
    echo "<p>No se encontraron fechas disponibles.</p>";
}

mysqli_close($cn);
?>
