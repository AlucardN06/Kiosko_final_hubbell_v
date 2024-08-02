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

// Obtener registros de la tabla extravios
$query = "SELECT id, numero_reloj, nombre, fecha_hora, costo FROM extravios";
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
                ->setTitle("Registros de Extravíos")
                ->setSubject("Registros de Extravíos")
                ->setDescription("Registros de Extravíos generados desde el sistema.")
                ->setKeywords("excel php phpexcel extravíos")
                ->setCategory("Datos de Extravíos");

    // Agregar datos al documento
    $objPHPExcel->setActiveSheetIndex(0);
    $sheet = $objPHPExcel->getActiveSheet();
    $sheet->setCellValue('A1', 'ID');
    $sheet->setCellValue('B1', 'Número de Reloj');
    $sheet->setCellValue('C1', 'Nombre');
    $sheet->setCellValue('D1', 'Fecha y Hora');
    $sheet->setCellValue('E1', 'Costo');

    $row = 2;
    while ($rowData = mysqli_fetch_assoc($result)) {
        $sheet->setCellValue('A' . $row, $rowData['id']);
        $sheet->setCellValue('B' . $row, $rowData['numero_reloj']);
        $sheet->setCellValue('C' . $row, $rowData['nombre']);
        $sheet->setCellValue('D' . $row, $rowData['fecha_hora']);
        $sheet->setCellValue('E' . $row, $rowData['costo']);
        $row++;
    }

    // Establecer formato
    $sheet->getStyle('A1:E1')->getFont()->setBold(true);
    $sheet->getStyle('A1:E' . ($row - 1))->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_LEFT);

    // Establecer tamaño automático de columnas
    foreach(range('A', 'E') as $columnID) {
        $sheet->getColumnDimension($columnID)->setAutoSize(true);
    }

    // Configurar encabezados HTTP para descarga
    header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
    header('Content-Disposition: attachment;filename="extravios.xlsx"');
    header('Cache-Control: max-age=0');

    // Escribir el archivo Excel
    $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
    $objWriter->save('php://output');

    // Limpiar memoria
    $objPHPExcel->__destruct();
    exit;
} else {
    die("No hay registros de extravíos para exportar.");
}
?>
