<!DOCTYPE html>
<html>
<head>
    <title>Registrar Empleado</title>
    <link rel="stylesheet" type="text/css" href="estilos.css">
</head>
<body>
    <div class="container">
        <h1>Registrar Empleado</h1>
        <form action="guardar.php" method="POST">
            Nombre: <input type="text" name="nombre" required><br>
            Puesto: <input type="text" name="puesto" required><br>
            Supervisor: <input type="text" name="supervisor" required><br>
            Turno: 
            <select name="turno" required>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="AA">AA</option>
                <option value="BB">BB</option>
                <option value="CC">CC</option>
                <option value="DD">DD</option>
                <option value="Sábado/Domingo">Sábado/Domingo</option>
            </select><br>
            División: <input type="text" name="division" required><br>
            Número de Locker: 
            <select name="numero_locker">
                <?php
                    $conn = new mysqli('localhost', 'id22166131_root', 'Hubbell0#', "id22166131_usuarios");
                    if ($conn->connect_error) {
                        die("Connection failed: " . $conn->connect_error);
                    }
                    $sql = "SELECT numero_locker FROM lockers WHERE status='disponible'";
                    $result = $conn->query($sql);
                    while($row = $result->fetch_assoc()) {
                        echo "<option value='". $row["numero_locker"] ."'>". $row["numero_locker"] ."</option>";
                    }
                    $conn->close();
                ?>
            </select><br>
            Status: 
            <select name="status" required>
                <option value="Disponible">Disponible</option>
                <option value="No disponible">No disponible</option>
            </select><br>
            <input type="submit" value="Registrar">
        </form>
    </div>
</body>
</html>
