<!DOCTYPE html>
<html>
<head>
    <title>Agregar Locker</title>
    <link rel="stylesheet" type="text/css" href="estilos.css">
</head>
<body>
    <div class="container">
        <h1>Agregar Locker</h1>
        <form action="guardar_locker.php" method="POST">
            Número de Locker: <input type="text" name="numero_locker" required><br>
            <input type="submit" value="Agregar">
        </form>
    </div>
</body>
</html>
