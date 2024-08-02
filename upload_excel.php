<?php
// Asegúrate de que estas declaraciones estén al comienzo del archivo
require 'vendor/autoload.php';
use PhpOffice\PhpSpreadsheet\IOFactory;
use PhpOffice\PhpSpreadsheet\Shared\Date;

// Conexión a la base de datos
$host = 'localhost';
$user = 'root';
$password = '';
$database = 'id19951970_localhost';
$conn = mysqli_connect($host, $user, $password, $database);

if (!$conn) {
    die("Error de conexión: " . mysqli_connect_error());
}

function convertDate($dateStr) {
    // Verificar si la fecha es un número (formato de Excel)
    if (is_numeric($dateStr)) {
        try {
            // Convertir número de serie de Excel a un objeto DateTime
            $dateObj = Date::excelToDateTimeObject($dateStr);
            return $dateObj->format('Y-m-d');
        } catch (Exception $e) {
            return false; // Retorna false si no se pudo convertir
        }
    }

    // Otros formatos de fecha
    $dateFormats = ['Y-m-d', 'd/m/Y', 'd-m-Y', 'm/d/Y'];
    foreach ($dateFormats as $format) {
        $parsedDate = DateTime::createFromFormat($format, $dateStr);
        if ($parsedDate && $parsedDate->format($format) === $dateStr) {
            return $parsedDate->format('Y-m-d');
        }
    }
    return false; // Retorna false si no se pudo convertir la fecha
}

// Procesamiento del formulario de registro
if (isset($_POST['submit'])) {
    $firstname = mysqli_real_escape_string($conn, $_POST['firstname']);
    $lastname = mysqli_real_escape_string($conn, $_POST['lastname']);
    $colony = mysqli_real_escape_string($conn, $_POST['colony']);
    $position = mysqli_real_escape_string($conn, $_POST['position']);
    $area = mysqli_real_escape_string($conn, $_POST['area']);
    $plant = mysqli_real_escape_string($conn, $_POST['plant']);
    $username = mysqli_real_escape_string($conn, $_POST['username']);
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT);
    $birthdateStr = mysqli_real_escape_string($conn, $_POST['birthdate']);
    $birthdate = convertDate($birthdateStr);
    if (!$birthdate) {
        echo "<p class='error-msg'>Fecha de nacimiento no válida: $birthdateStr</p>";
        exit;
    }
    $fechaIngresoStr = mysqli_real_escape_string($conn, $_POST['fecha_ingreso']);
    $fecha_ingreso = convertDate($fechaIngresoStr);
    if (!$fecha_ingreso) {
        echo "<p class='error-msg'>Fecha de ingreso no válida: $fechaIngresoStr</p>";
        exit;
    }
    $supervisor_name = mysqli_real_escape_string($conn, $_POST['supervisor_name']);
    $supervisor_reloj_number = mysqli_real_escape_string($conn, $_POST['supervisor_reloj_number']);
    $deparment = mysqli_real_escape_string($conn, $_POST['deparment']);

    // Verificar si el usuario ya existe
    $query = "SELECT * FROM users WHERE username = '$username'";
    $result = mysqli_query($conn, $query);

    if (mysqli_num_rows($result) > 0) {
        // Actualizar el usuario si ya existe
        $updateQuery = "UPDATE users SET firstname = '$firstname', lastname = '$lastname', colony = '$colony', position = '$position', area = '$area', plant = '$plant', password = '$password', birthdate = '$birthdate', supervisor_name = '$supervisor_name', supervisor_reloj_number = '$supervisor_reloj_number', deparment='$deparment', fecha_ingreso='$fecha_ingreso' WHERE username = '$username'";
        if (mysqli_query($conn, $updateQuery)) {
            echo "<p class='success-msg'>Usuario actualizado exitosamente</p>";
        } else {
            echo "<p class='error-msg'>Error al actualizar el usuario: " . mysqli_error($conn) . "</p>";
        }
    } else {
        // Insertar nuevo usuario
        $insertQuery = "INSERT INTO users (firstname, lastname, colony, position, area, plant, username, password, birthdate, supervisor_name, supervisor_reloj_number, deparment, fecha_ingreso) VALUES ('$firstname', '$lastname', '$colony', '$position', '$area', '$plant', '$username', '$password', '$birthdate', '$supervisor_name', '$supervisor_reloj_number', '$deparment', '$fecha_ingreso')";
        if (mysqli_query($conn, $insertQuery)) {
            echo "<p class='success-msg'>Usuario registrado exitosamente</p>";
        } else {
            echo "<p class='error-msg'>Error al registrar el usuario: " . mysqli_error($conn) . "</p>";
        }
    }
}

// Procesamiento del archivo Excel
if (isset($_POST['submit_excel'])) {
    $target_dir = "uploads/";
    $target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
    $uploadOk = 1;
    $fileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));

    // Verificar el tipo de archivo
    if ($fileType != "xls" && $fileType != "xlsx") {
        echo "Solo se permiten archivos XLS y XLSX.";
        $uploadOk = 0;
    }

    // Intentar cargar el archivo
    if ($uploadOk == 1) {
        if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {
            echo "El archivo " . htmlspecialchars(basename($_FILES["fileToUpload"]["name"])) . " ha sido cargado.";
            
            // Procesar el archivo Excel
            $spreadsheet = IOFactory::load($target_file);
            $sheet = $spreadsheet->getActiveSheet();
            
            foreach ($sheet->getRowIterator() as $row) {
                $cellIterator = $row->getCellIterator();
                $cellIterator->setIterateOnlyExistingCells(false);
                $data = [];
                
                foreach ($cellIterator as $cell) {
                    $data[] = $cell->getValue();
                }

                $firstname = mysqli_real_escape_string($conn, $data[0]);
                $lastname = mysqli_real_escape_string($conn, $data[1]);
                $colony = mysqli_real_escape_string($conn, $data[2]);
                $position = mysqli_real_escape_string($conn, $data[3]);
                $area = mysqli_real_escape_string($conn, $data[4]);
                $plant = mysqli_real_escape_string($conn, $data[5]);
                $username = mysqli_real_escape_string($conn, $data[6]);
                $password = password_hash($data[7], PASSWORD_DEFAULT);

                // Verificar y convertir la fecha de nacimiento a formato estándar
                $birthdateStr = $data[8];
                if (is_numeric($birthdateStr)) {
                    // La fecha es un número en formato de Excel
                    $birthdate = Date::excelToDateTimeObject($birthdateStr)->format('Y-m-d');
                } else {
                    $birthdate = convertDate($birthdateStr);
                    if (!$birthdate) {
                        echo "<p class='error-msg'>Fecha de nacimiento no válida: $birthdateStr</p>";
                        continue; // Saltar a la siguiente fila
                    }
                }

                $supervisor_name = mysqli_real_escape_string($conn, $data[9]);
                $supervisor_reloj_number = mysqli_real_escape_string($conn, $data[10]);
                $deparment = mysqli_real_escape_string($conn, $data[11]);

               // Verificar y convertir la fecha de ingreso a formato estándar
        $fechaIngresoStr = $data[12];
        $fecha_ingreso = convertDate($fechaIngresoStr);
        
      
        
        if (!$fecha_ingreso) {
            echo "<p class='error-msg'>Fecha de ingreso no válida: $fechaIngresoStr</p>";
            continue; // Saltar a la siguiente fila
        }

                // Verificar si el usuario ya existe
                $query = "SELECT * FROM users WHERE username = '$username'";
                $result = mysqli_query($conn, $query);

                if (mysqli_num_rows($result) > 0) {
                    // Actualizar el usuario si ya existe
                    $updateQuery = "UPDATE users SET firstname = '$firstname', lastname = '$lastname', colony = '$colony', position = '$position', area = '$area', plant = '$plant', password = '$password', birthdate = '$birthdate', supervisor_name = '$supervisor_name', supervisor_reloj_number = '$supervisor_reloj_number', deparment='$deparment', fecha_ingreso='$fecha_ingreso' WHERE username = '$username'";
                    mysqli_query($conn, $updateQuery);
                } else {
                    // Insertar nuevo usuario
                    $insertQuery = "INSERT INTO users (firstname, lastname, colony, position, area, plant, username, password, birthdate, supervisor_name, supervisor_reloj_number, deparment, fecha_ingreso) VALUES ('$firstname', '$lastname', '$colony', '$position', '$area', '$plant', '$username', '$password', '$birthdate', '$supervisor_name', '$supervisor_reloj_number', '$deparment', '$fecha_ingreso')";
                    mysqli_query($conn, $insertQuery);
                }
            }

            echo "<script>alert('Usuarios registrados exitosamente');window.location.href = 'register.php';</script>";
            exit;  
        } else {
            echo "<script>alert('Error al registrar a los usuarios');</script>";
            exit;
        }
    }
}

mysqli_close($conn);
?>
