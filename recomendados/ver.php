<!DOCTYPE html>
<html>
<head>
    <title>Lista de Empleados</title>
    <link rel="stylesheet" type="text/css" href="estilos.css">
</head>
<body>
    <div class="container">
        <h1>Lista de Empleados</h1>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Puesto</th>
                <th>Supervisor</th>
                <th>Turno</th>
                <th>División</th>
                <th>Número de Locker</th>
                <th>Status</th>
                <th>Acciones</th>
            </tr>
            <?php
                $conn = new mysqli('localhost', 'id22166131_root', 'Hubbell0#', "id22166131_usuarios");
                if ($conn->connect_error) {
                    die("Connection failed: " . $conn->connect_error);
                }
                $sql = "SELECT * FROM empleados";
                $result = $conn->query($sql);
                while($row = $result->fetch_assoc()) {
                    echo "<tr>";
                    echo "<td>" . $row["id"] . "</td>";
                    echo "<td>" . $row["nombre"] . "</td>";
                    echo "<td>" . $row["puesto"] . "</td>";
                    echo "<td>" . $row["supervisor"] . "</td>";
                    echo "<td>" . $row["turno"] . "</td>";
                    echo "<td>" . $row["division"] . "</td>";
                    echo "<td>" . $row["numero_locker"] . "</td>";
                    echo "<td>" . $row["status"] . "</td>";
                    echo "<td><a href='borrar.php?id=" . $row["id"] . "'>Borrar</a></td>";
                    echo "</tr>";
                }
                $conn->close();
            ?>
        </table>
    </div>
</body>
</html>
