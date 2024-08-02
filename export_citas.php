<?php
require 'vendor/autoload.php';

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

// Conexión a la base de datos
$host = 'localhost';
$user = 'root';
$password = '';
$database = 'id19951970_localhost';

$conn = mysqli_connect($host, $user, $password, $database);

if (!$conn) {
    die("Error de conexión: " . mysqli_connect_error());
}

// Crear nuevo objeto Spreadsheet
$spreadsheet = new Spreadsheet();
$sheet = $spreadsheet->getActiveSheet();

// Obtener datos de la tabla citas
$query_citas = "SELECT * FROM citas";
$result_citas = mysqli_query($conn, $query_citas);

// Escribir encabezados para citas
$sheet->setCellValue('A1', 'ID');
$sheet->setCellValue('B1', 'Nombre');
$sheet->setCellValue('C1', 'Genero');
$sheet->setCellValue('D1', 'Correo');
$sheet->setCellValue('E1', 'Telefono');
$sheet->setCellValue('F1', 'Fecha');
$sheet->setCellValue('G1', 'Confirmación');
$sheet->setCellValue('H1', 'Posición');



// Escribir datos de citas
$rowNumber = 2;
while ($row = mysqli_fetch_assoc($result_citas)) {
    $sheet->setCellValue('A' . $rowNumber, $row['Id']);
    $sheet->setCellValue('B' . $rowNumber, $row['Nombre']);
    $sheet->setCellValue('C' . $rowNumber, $row['Genero']);
    $sheet->setCellValue('D' . $rowNumber, $row['Correo']);
    $sheet->setCellValue('E' . $rowNumber, $row['Telefono']);
    $sheet->setCellValue('F' . $rowNumber, $row['Fecha']);
    $sheet->setCellValue('G' . $rowNumber, $row['Confirmacion']);
    $sheet->setCellValue('H' . $rowNumber, $row['Posicion']);
    $rowNumber++;
}

// Crear escritor para guardar el archivo
$writer = new Xlsx($spreadsheet);

// Enviar el archivo al navegador para su descarga
header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
header('Content-Disposition: attachment; filename="citas.xlsx"');
$writer->save('php://output');

// Liberar recursos
mysqli_free_result($result_citas);
mysqli_close($conn);
exit;
?>
