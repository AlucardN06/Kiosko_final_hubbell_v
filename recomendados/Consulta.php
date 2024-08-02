<?php
session_start();
$nombre = htmlspecialchars($_POST['nombre']);
$correo = filter_var($_POST['mail'], FILTER_SANITIZE_EMAIL);
$fecha = htmlspecialchars($_POST['fecha']);
$genero = htmlspecialchars($_POST['genero']);
$confirmNumber = htmlspecialchars($_POST['confirmNumber']);
$telefono = htmlspecialchars($_POST['telefono']); // Se agrega el campo de teléfono
$posicion = htmlspecialchars($_POST['posicion']); // Se agrega el campo de posición

include('conexion.php');

// Función para capitalizar la primera letra de cada palabra
function capitalizeWords($string) {
    return ucwords(strtolower($string));
}

// Capitalizar el nombre
$nombre = capitalizeWords($nombre);

// Utilizar consultas preparadas para prevenir inyecciones SQL
$stmt_cupos = $cn->prepare("SELECT Cupos FROM fechas_disponibles WHERE Fecha = ?");
$stmt_cupos->bind_param("s", $fecha);
$stmt_cupos->execute();
$result_cupos = $stmt_cupos->get_result();

if ($result_cupos->num_rows > 0) {
    $row_cupos = $result_cupos->fetch_assoc();
    $cupos_disponibles = $row_cupos['Cupos'];

    $stmt_citas_exist = $cn->prepare("SELECT COUNT(*) AS citas_exist FROM citas WHERE Fecha = ?");
    $stmt_citas_exist->bind_param("s", $fecha);
    $stmt_citas_exist->execute();
    $result_citas_exist = $stmt_citas_exist->get_result();

    if ($result_citas_exist->num_rows > 0) {
        $row_citas_exist = $result_citas_exist->fetch_assoc();
        $citas_exist = $row_citas_exist['citas_exist'];

        if ($citas_exist < $cupos_disponibles) {
            $stmt_insert = $cn->prepare("INSERT INTO citas (Nombre, Correo, Genero, Fecha, Confirmacion, Telefono, Posicion) VALUES (?, ?, ?, ?, ?, ?, ?)");
            $stmt_insert->bind_param("sssssss", $nombre, $correo, $genero, $fecha, $confirmNumber, $telefono, $posicion);
            if ($stmt_insert->execute()) {
                header("Location: gracias.php?nombre=$nombre&fecha=$fecha&confirmacion=$confirmNumber");
                exit;
            } else {
                die("Error al registrar: " . $stmt_insert->error);
            }
        } else {
            header("Location: error_cupos.php");
            exit;
        }
    } else {
        die("Error al contar citas existentes: " . $stmt_citas_exist->error);
    }
} else {
    die("No se encontraron cupos disponibles para la fecha seleccionada.");
}

$stmt_cupos->close();
$stmt_citas_exist->close();
$cn->close();
?>
