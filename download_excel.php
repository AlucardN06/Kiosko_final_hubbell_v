<?php
session_start();
require 'vendor/autoload.php';

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

// Conexión a la base de datos
$host = 'localhost'; // Cambia esto a los valores proporcionados por 000webhost
$user = 'root'; // Cambia esto a los valores proporcionados por 000webhost
$password = ''; // Cambia esto a los valores proporcionados por 000webhost
$database = 'id19951970_localhost'; // Cambia esto a los valores proporcionados por 000webhost

$conn = mysqli_connect($host, $user, $password, $database);

if (!$conn) {
    die("Error de conexión: " . mysqli_connect_error());
}

// Obtener detalles de los votos
$query = "
    SELECT u.firstname, u.lastname, vo.nombre as opcion_nombre
    FROM votos v
    JOIN users u ON v.user_id = u.id
    JOIN votacion_opciones vo ON v.opcion_id = vo.id
";
$result = mysqli_query($conn, $query);

$spreadsheet = new Spreadsheet();
$sheet = $spreadsheet->getActiveSheet();
$sheet->setCellValue('A1', 'Nombre del Votante');
$sheet->setCellValue('B1', 'Opción Votada');

$rowNumber = 2;
while ($row = mysqli_fetch_assoc($result)) {
    $sheet->setCellValue('A' . $rowNumber, $row['firstname'] . ' ' . $row['lastname']);
    $sheet->setCellValue('B' . $rowNumber, $row['opcion_nombre']);
    $rowNumber++;
}

$writer = new Xlsx($spreadsheet);
$filename = 'detalles_votos.xlsx';

header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
header('Content-Disposition: attachment; filename="' . urlencode($filename) . '"');
$writer->save('php://output');
