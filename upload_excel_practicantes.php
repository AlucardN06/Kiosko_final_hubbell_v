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
    if (is_numeric($dateStr)) {
        try {
            $dateObj = Date::excelToDateTimeObject($dateStr);
            return $dateObj->format('Y-m-d');
        } catch (Exception $e) {
            return false;
        }
    }

    $dateFormats = ['Y-m-d', 'd/m/Y', 'd-m-Y', 'm/d/Y'];
    foreach ($dateFormats as $format) {
        $parsedDate = DateTime::createFromFormat($format, $dateStr);
        if ($parsedDate && $parsedDate->format($format) === $dateStr) {
            return $parsedDate->format('Y-m-d');
        }
    }
    return false;
}

// Procesamiento del archivo Excel
if (isset($_POST['submit_excel'])) {
    $file = $_FILES['fileToUpload']['tmp_name'];

    if (!empty($file)) {
        $spreadsheet = IOFactory::load($file);
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
            $fechaIngresoStr = $data[2];
            $fecha_ingreso = convertDate($fechaIngresoStr);
            if (!$fecha_ingreso) {
                echo "<p class='error-msg'>Fecha de ingreso no válida: $fechaIngresoStr</p>";
                continue;
            }
            $requisitor = mysqli_real_escape_string($conn, $data[3]);
            $escuela = mysqli_real_escape_string($conn, $data[4]);
            $reloj_number = mysqli_real_escape_string($conn, $data[5]);

            $query = "SELECT * FROM practicantes WHERE reloj_number = '$reloj_number'";
            $result = mysqli_query($conn, $query);

            if (mysqli_num_rows($result) > 0) {
                $updateQuery = "UPDATE practicantes SET firstname = '$firstname', lastname = '$lastname', fecha_ingreso = '$fecha_ingreso', requisitor = '$requisitor', escuela = '$escuela' WHERE reloj_number = '$reloj_number'";
                if (mysqli_query($conn, $updateQuery)) {
                    echo "<p class='success-msg'>Practicante actualizado exitosamente</p>";
                } else {
                    echo "<p class='error-msg'>Error al actualizar el practicante: " . mysqli_error($conn) . "</p>";
                }
            } else {
                $insertQuery = "INSERT INTO practicantes (firstname, lastname, fecha_ingreso, requisitor, escuela, reloj_number) VALUES ('$firstname', '$lastname', '$fecha_ingreso', '$requisitor', '$escuela', '$reloj_number')";
                if (mysqli_query($conn, $insertQuery)) {
                    echo "<p class='success-msg'>Practicante registrado exitosamente</p>";
                } else {
                    echo "<p class='error-msg'>Error al registrar el practicante: " . mysqli_error($conn) . "</p>";
                }
            }
        }

        mysqli_close($conn);
        echo "<script>alert('Archivo Excel procesado exitosamente');window.location.href = 'register_practicantes.php';</script>";
    } else {
        echo "<script>alert('Por favor selecciona un archivo Excel');window.location.href = 'register_practicantes.php';</script>";
    }
}
?>
