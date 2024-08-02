<?php
session_start();

// Verificar si el usuario está logueado
if (!isset($_SESSION['user_id'])) {
    // Redirigir al login si no hay sesión iniciada
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
    $position = mysqli_real_escape_string($conn, $_POST['position']);
    $area = mysqli_real_escape_string($conn, $_POST['area']);
    $plant = mysqli_real_escape_string($conn, $_POST['plant']);
    $colony = mysqli_real_escape_string($conn, $_POST['colony']);
    $username = mysqli_real_escape_string($conn, $_POST['username']);
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT);
    $birthdate = mysqli_real_escape_string($conn, $_POST['birthdate']);
    $supervisor_name = mysqli_real_escape_string($conn, $_POST['supervisor_name']);
    $supervisor_reloj_number = mysqli_real_escape_string($conn, $_POST['supervisor_reloj_number']);
    $deparment = mysqli_real_escape_string($conn, $_POST['deparment']);
    $fecha_ingreso = date('Y-m-d'); // Obtiene la fecha actual

    // Verificar si el usuario ya existe
    $query = "SELECT * FROM users WHERE username = '$username'";
    $result = mysqli_query($conn, $query);

    if (mysqli_num_rows($result) > 0) {
        // Actualizar el usuario si ya existe
        $updateQuery = "UPDATE users SET 
            firstname = '$firstname', 
            lastname = '$lastname', 
            position = '$position', 
            area = '$area', 
            plant = '$plant', 
            colony = '$colony', 
            password = '$password', 
            birthdate = '$birthdate', 
            supervisor_name = '$supervisor_name', 
            supervisor_reloj_number = '$supervisor_reloj_number', 
            deparment = '$deparment',
            fecha_ingreso = '$fecha_ingreso'
        WHERE username = '$username'";

        if (mysqli_query($conn, $updateQuery)) {
            echo "<script>alert('Usuario actualizado exitosamente');window.location.href = 'register.php';</script>";
        } else {
            echo "<script>alert('Error al actualizar el usuario: " . mysqli_error($conn) . "');window.location.href = 'register.php';</script>";
        }
    } else {
        // Insertar nuevo usuario
        $insertQuery = "INSERT INTO users (firstname, lastname, colony, position, area, plant, username, password, birthdate, supervisor_name, supervisor_reloj_number, deparment, fecha_ingreso) VALUES ('$firstname', '$lastname', '$colony', '$position', '$area', '$plant', '$username', '$password', '$birthdate', '$supervisor_name', '$supervisor_reloj_number', '$deparment', '$fecha_ingreso')";

        if (mysqli_query($conn, $insertQuery)) {
            echo "<script>alert('Usuario registrado exitosamente');window.location.href = 'register.php';</script>";
        } else {
            echo "<script>alert('Error al registrar al usuario: " . mysqli_error($conn) . "');window.location.href = 'register.php';</script>";
        }
    }
}

mysqli_close($conn);
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <h2>Registro</h2>
        <form id="register-form" class="register-form" action="register.php" method="POST">
            <input type="text" id="firstname" name="firstname" placeholder="Nombres" required>
            <input type="text" id="lastname" name="lastname" placeholder="Apellidos" required>
            <input type="text" id="area" name="area" placeholder="Puesto" required>

            <select id="position" name="position" required>
                <option value="" disabled selected>Tipo de Autorización</option>
                <option value="AB">AB</option>
                <option value="A">A</option>
                <option value="B">B</option>
                <option value="C">C</option>
                <option value="D">D</option>
            </select>

            <select id="plant" name="plant" required>
                <option value="" disabled selected>Planta</option>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="Bodega">Bodega</option>
            </select>

            <select id="deparment" name="deparment" required>
                <option value="" disabled selected>Departamento</option>
                <option value="HUS">HUS</option>
                <option value="HUS II">HUS II</option>
                <option value="HES">HES</option>
            </select>

            <br><br>
            <input type="text" id="colony" name="colony" placeholder="Colonia" required>
            <input type="text" id="username" name="username" placeholder="Número de Reloj" required>
            <input type="password" id="password" name="password" placeholder="Contraseña" required>
            <p>Fecha de nacimiento:<br><br><input type="date" id="birthdate" name="birthdate" required></p>
            <p>Fecha de ingreso:<br><br><input type="date" id="fecha_ingreso" name="fecha_ingreso" required></p>
            <input type="text" id="supervisor_name" name="supervisor_name" placeholder="Nombre del Supervisor" required>
            <input type="text" id="supervisor_reloj_number" name="supervisor_reloj_number" placeholder="Número de Reloj del supervisor" required>

            <button type="submit" name="submit">Registrar</button>
        </form>

        <form action="upload_excel.php" method="post" enctype="multipart/form-data">
            <br><br>
            <h2>Cargar archivo Excel</h2>
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

