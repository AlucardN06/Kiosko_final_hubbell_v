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

// Obtener datos de la tabla recomendaciones
$query_recomendaciones = "SELECT * FROM recomendaciones";
$result_recomendaciones = mysqli_query($conn, $query_recomendaciones);

// Escribir encabezados para recomendaciones
$sheet->setCellValue('A1', 'Nombre');
$sheet->setCellValue('B1', 'Correo');
$sheet->setCellValue('C1', 'Teléfono');
$sheet->setCellValue('D1', 'Género');
$sheet->setCellValue('E1', 'Posición');

// Escribir datos de recomendaciones
$rowNumber = 2;
while ($row = mysqli_fetch_assoc($result_recomendaciones)) {
    $sheet->setCellValue('A' . $rowNumber, $row['nombre']);
    $sheet->setCellValue('B' . $rowNumber, $row['correo']);
    $sheet->setCellValue('C' . $rowNumber, $row['telefono']);
    $sheet->setCellValue('D' . $rowNumber, $row['genero']);
    $sheet->setCellValue('E' . $rowNumber, $row['posicion']);
    $rowNumber++;
}

// Crear escritor para guardar el archivo
$writer = new Xlsx($spreadsheet);

// Enviar el archivo al navegador para su descarga
header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
header('Content-Disposition: attachment; filename="recomendaciones.xlsx"');
$writer->save('php://output');

// Liberar recursos
mysqli_free_result($result_recomendaciones);
mysqli_close($conn);
exit;
?>
