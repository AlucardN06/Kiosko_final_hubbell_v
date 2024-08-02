<?php
session_start();

// Verificar si el usuario está logueado
if (!isset($_SESSION['user_id'])) {
    header("Location: index.php");
    exit;
}

// Conexión a la base de datos
$host = 'localhost';
$user = 'root';
$password = '';
$database = 'id19951970_localhost';

$conn = mysqli_connect($host, $user, $password, $database);

if (!$conn) {
    die("Error de conexión: " . mysqli_connect_error());
}

// Obtener registros de la tabla reposiciones
$query = "SELECT id, numero_reloj, nombre FROM reposiciones";
$result = mysqli_query($conn, $query);

if ($result && mysqli_num_rows($result) > 0) {
    // Incluir la librería PHPExcel
    require_once 'Classes/PHPExcel.php';

    // Crear nuevo objeto PHPExcel
    $objPHPExcel = new PHPExcel();

    // Definir propiedades del documento
    $objPHPExcel->getProperties()
                ->setCreator("Tu Nombre")
                ->setLastModifiedBy("Tu Nombre")
                ->setTitle("Registros de Reposiciones")
                ->setSubject("Registros de Reposiciones")
                ->setDescription("Registros de Reposiciones generados desde el sistema.")
                ->setKeywords("excel php phpexcel reposiciones")
                ->setCategory("Datos de Reposiciones");

    // Agregar datos al documento
    $objPHPExcel->setActiveSheetIndex(0);
    $sheet = $objPHPExcel->getActiveSheet();
    $sheet->setCellValue('A1', 'ID');
    $sheet->setCellValue('B1', 'Número de Reloj');
    $sheet->setCellValue('C1', 'Nombre');

    $row = 2;
    while ($rowData = mysqli_fetch_assoc($result)) {
        $sheet->setCellValue('A' . $row, $rowData['id']);
        $sheet->setCellValue('B' . $row, $rowData['numero_reloj']);
        $sheet->setCellValue('C' . $row, $rowData['nombre']);
        $row++;
    }

    // Establecer formato
    $sheet->getStyle('A1:C1')->getFont()->setBold(true);
    $sheet->getStyle('A1:C' . ($row - 1))->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_LEFT);

    // Establecer tamaño automático de columnas
    foreach(range('A', 'C') as $columnID) {
        $sheet->getColumnDimension($columnID)->setAutoSize(true);
    }

    // Configurar encabezados HTTP para descarga
    header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
    header('Content-Disposition: attachment;filename="reposiciones.xlsx"');
    header('Cache-Control: max-age=0');

    // Escribir el archivo Excel
    $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
    $objWriter->save('php://output');

    // Limpiar memoria
    $objPHPExcel->__destruct();
    exit;
} else {
    die("No hay registros de reposiciones para exportar.");
}
?>
