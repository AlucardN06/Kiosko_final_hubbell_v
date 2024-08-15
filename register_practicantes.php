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

// Establecer el juego de caracteres a utf8mb4
mysqli_set_charset($conn, "utf8mb4");

// Procesamiento del formulario de registro
if (isset($_POST['submit'])) {
    $firstname = mysqli_real_escape_string($conn, $_POST['firstname']);
    $lastname = mysqli_real_escape_string($conn, $_POST['lastname']);
    $fecha_ingreso = mysqli_real_escape_string($conn, $_POST['fecha_ingreso']);
    $requisitor = mysqli_real_escape_string($conn, $_POST['requisitor']);
    $escuela = mysqli_real_escape_string($conn, $_POST['escuela']);

    // Insertar nuevo practicante
    $insertQuery = "INSERT INTO practicantes (firstname, lastname, fecha_ingreso, requisitor, escuela) VALUES ('$firstname', '$lastname', '$fecha_ingreso', '$requisitor', '$escuela')";

    if (mysqli_query($conn, $insertQuery)) {
        echo "<script>alert('Practicante registrado exitosamente');window.location.href = 'register_practicante.php';</script>";
    } else {
        echo "<script>alert('Error al registrar al practicante: " . mysqli_error($conn) . "');window.location.href = 'register_practicante.php';</script>";
    }
}

mysqli_close($conn);
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Practicantes</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <h2>Registro de Practicantes</h2>
        <form id="register-form" class="register-form" action="register_practicante.php" method="POST">
            <input type="text" id="firstname" name="firstname" placeholder="Nombres" required>
            <input type="text" id="lastname" name="lastname" placeholder="Apellidos" required>
            <p>Fecha de ingreso:<br><br><input type="date" id="fecha_ingreso" name="fecha_ingreso" required></p>
            <input type="text" id="requisitor" name="requisitor" placeholder="Requisitor" required>
            <input type="text" id="escuela" name="escuela" placeholder="Escuela" required>

            <button type="submit" name="submit">Registrar Practicante</button>
        </form>

        <form action="upload_excel_practicantes.php" method="post" enctype="multipart/form-data">
            <br><br>
            <h2>Cargar archivo Excel para Practicantes</h2>
            <p><input type="file" name="fileToUpload" id="fileToUpload" accept=".xlsx, .xls"></p>
            <br><br><br>
            <button type="submit" name="submit_excel">Cargar Excel</button>
        </form>

        <br><br><br>
        <button type="button" onclick="location.href='ta.php'" class="user-button">Regresar</button>
    </div>

    <script>
        window.onload = function() {
            if (window.history.replaceState) {
                window.history.replaceState(null, null, window.location.href);
            }
        };
    </script>
</body>
</html>
