<?php
// Conexión a la base de datos
$cn = mysqli_connect('localhost', 'id22166131_root', 'Hubbell0#');
mysqli_select_db($cn, 'id22166131_usuarios');

// Obtener el nombre enviado desde el formulario
$nombre = $_POST['nombre'];

// Consulta para verificar si el nombre ya existe en la base de datos
$sql = "SELECT * FROM citas WHERE Nombre = ?";
$stmt = mysqli_prepare($cn, $sql);
mysqli_stmt_bind_param($stmt, 's', $nombre);
mysqli_stmt_execute($stmt);
$result = mysqli_stmt_get_result($stmt);

// Verificar si se encontraron resultados
if (mysqli_num_rows($result) > 0) {
    // Si existe al menos un registro con el mismo nombre, devolver respuesta indicando que el nombre existe
    $response = array('existe' => true);
    echo json_encode($response);
} else {
    // Si no se encontraron resultados, devolver respuesta indicando que el nombre no existe
    $response = array('existe' => false);
    echo json_encode($response);
}

// Cerrar la conexión a la base de datos
mysqli_close($cn);
?>
