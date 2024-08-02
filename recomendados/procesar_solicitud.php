<?php
// Conexión a la base de datos (reemplaza con tus propios detalles de conexión)
$servername = "localhost";
$username = "id22166131_root";
$password = "Hubbell0#";
$dbname = "id22166131_usuarios";

// Crear conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar conexión
if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
}

// Recibir datos del formulario
$trabajo_previo = $_POST['trabajo_previo'];
$fecha_baja = $_POST['fecha_baja'];
$apellido_paterno = $_POST['apellido_paterno'];
$apellido_materno = $_POST['apellido_materno'];
$nombres = $_POST['nombres'];
$fecha_nacimiento = $_POST['fecha_nacimiento'];
$curp = $_POST['curp'];
$rfc = $_POST['rfc'];
$seguro_social = $_POST['seguro_social'];
$codigo_postal = $_POST['codigo_postal'];
$genero = $_POST['genero'];
$estado_civil = $_POST['estado_civil'];
$idioma_preferido = $_POST['idioma_preferido'];
$numero_hijos = $_POST['numero_hijos'];
$lugar_nacimiento_ciudad = $_POST['lugar_nacimiento_ciudad'];
$lugar_nacimiento_estado = $_POST['lugar_nacimiento_estado'];
$lugar_nacimiento_pais = $_POST['lugar_nacimiento_pais'];
$clinica_imss = $_POST['clinica_imss'];
$correo_electronico = $_POST['correo_electronico'];
$telefono_celular1 = $_POST['telefono_celular1'];
$telefono_celular2 = $_POST['telefono_celular2'];
$direccion_calle = $_POST['direccion_calle'];
$direccion_numero_exterior = $_POST['direccion_numero_exterior'];
$direccion_numero_interior = $_POST['direccion_numero_interior'];
$direccion_colonia = $_POST['direccion_colonia'];
$direccion_ciudad = $_POST['direccion_ciudad'];
$direccion_estado = $_POST['direccion_estado'];
$direccion_codigo_postal = $_POST['direccion_codigo_postal'];
$nivel_estudios = $_POST['nivel_estudios'];
$visibilidad = $_POST['visibilidad'];
$documento_nivel_estudios = $_FILES['documento_nivel_estudios']['name']; // Suponiendo que el campo sea un archivo
$contacto_emergencia1_nombre = $_POST['contacto_emergencia1_nombre'];
$contacto_emergencia1_telefono = $_POST['contacto_emergencia1_telefono'];
$contacto_emergencia1_parentesco = $_POST['contacto_emergencia1_parentesco'];
$contacto_emergencia1_email = $_POST['contacto_emergencia1_email'];
$contacto_emergencia2_nombre = $_POST['contacto_emergencia2_nombre'];
$contacto_emergencia2_telefono = $_POST['contacto_emergencia2_telefono'];
$contacto_emergencia2_parentesco = $_POST['contacto_emergencia2_parentesco'];
$contacto_emergencia2_email = $_POST['contacto_emergencia2_email'];
$declaracion_ajuste_verdad = $_POST['declaracion_ajuste_verdad'];
$nombre_solicitante = $_POST['nombre_solicitante'];

// Consulta SQL para insertar datos en la tabla
$sql = "INSERT INTO solicitudes_empleo (trabajo_previo, fecha_baja, apellido_paterno, apellido_materno, nombres, fecha_nacimiento, curp, rfc, seguro_social, codigo_postal, genero, estado_civil, idioma_preferido, numero_hijos, lugar_nacimiento_ciudad, lugar_nacimiento_estado, lugar_nacimiento_pais, clinica_imss, correo_electronico, telefono_celular1, telefono_celular2, direccion_calle, direccion_numero_exterior, direccion_numero_interior, direccion_colonia, direccion_ciudad, direccion_estado, direccion_codigo_postal, nivel_estudios, visibilidad, documento_nivel_estudios, contacto_emergencia1_nombre, contacto_emergencia1_telefono, contacto_emergencia1_parentesco, contacto_emergencia1_email, contacto_emergencia2_nombre, contacto_emergencia2_telefono, contacto_emergencia2_parentesco, contacto_emergencia2_email, declaracion_ajuste_verdad, nombre_solicitante)
VALUES ('$trabajo_previo', '$fecha_baja', '$apellido_paterno', '$apellido_materno', '$nombres', '$fecha_nacimiento', '$curp', '$rfc', '$seguro_social', '$codigo_postal', '$genero', '$estado_civil', '$idioma_preferido', $numero_hijos, '$lugar_nacimiento_ciudad', '$lugar_nacimiento_estado', '$lugar_nacimiento_pais', '$clinica_imss', '$correo_electronico', '$telefono_celular1', '$telefono_celular2', '$direccion_calle', '$direccion_numero_exterior', '$direccion_numero_interior', '$direccion_colonia', '$direccion_ciudad', '$direccion_estado', '$direccion_codigo_postal', '$nivel_estudios', '$visibilidad', '$documento_nivel_estudios', '$contacto_emergencia1_nombre', '$contacto_emergencia1_telefono', '$contacto_emergencia1_parentesco', '$contacto_emergencia1_email', '$contacto_emergencia2_nombre', '$contacto_emergencia2_telefono', '$contacto_emergencia2_parentesco', '$contacto_emergencia2_email', '$declaracion_ajuste_verdad', '$nombre_solicitante')";

if ($conn->query($sql) === TRUE) {
    echo "Datos insertados correctamente";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

// Cerrar conexión
$conn->close();
?>
