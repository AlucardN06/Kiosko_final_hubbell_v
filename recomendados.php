<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registra a tu recomendado</title>
    <link rel="stylesheet" href="recomendados.css">
</head>
<body>
    <h1>Registra a tu recomendado</h1>
    <p>Completa los siguientes campos con la información de tu recomendado.</p>
    <div class="form-container">
        <form id="appointmentForm" action="consulta_recomendado.php" method="POST">
            <div class="form-group">
                <label for="nombre">Nombre Completo de la persona a recomendar:</label>
                <input name="nombre" type="text" id="nombre" placeholder="Nombre Completo" minlength="17" required>
            </div>
            <div class="form-group">
                <label for="mail">Correo Electrónico:</label>
                <input name="mail" type="email" id="mail" placeholder="Correo Electrónico" required>
            </div>
            <div class="form-group">
                <label for="telefono">Número de Teléfono:</label>
                <input name="telefono" type="text" id="telefono" pattern="\d{10}" placeholder="656123456789" required>
            </div>
            <div class="form-group">
                <label for="genero">Género:</label>
                <select name="genero" id="genero" required>
                    <option value="" disabled selected>Seleccione una opción</option>
                    <option value="Masculino">Masculino</option>
                    <option value="Femenino">Femenino</option>
                    <option value="Prefiero no decirlo">Prefiero no decirlo</option>
                </select>
            </div>
            <div class="form-group">
            <label for="posicion">Posición y Turno:</label>
<select name="posicion" id="posicion" required>
    <option value="" disabled selected>Seleccione una posición</option>
    <?php
$cn = mysqli_connect('localhost', 'root', '', 'id19951970_localhost');

if (!$cn) {
    die("Error de conexión: " . mysqli_connect_error());
}

$sql_posiciones = "SELECT position, shifts, number_of_vacancies FROM vacancies WHERE status = 'Disponibles'";
$result_posiciones = mysqli_query($cn, $sql_posiciones);

if ($result_posiciones && mysqli_num_rows($result_posiciones) > 0) {
    while ($row_posicion = mysqli_fetch_assoc($result_posiciones)) {
        $position = $row_posicion["position"];

        // Verificar si la posición comienza con "operador" en cualquier caso
        if (stripos($position, 'operador') === 0) {
            continue; // Saltar al siguiente registro si la posición comienza con "operador"
        }

        echo "<option value='" . $position . " - " . $row_posicion["shifts"] . "'>" . $position . " turno: " . $row_posicion["shifts"] . " --- Número de vacantes: " . $row_posicion["number_of_vacancies"] . "</option>";
    }
} else {
    echo "<option value='' disabled>No hay posiciones disponibles</option>";
}

mysqli_free_result($result_posiciones);
mysqli_close($cn);
?>
</select>

                <br><br>
            </div>
            <button type="submit" id="scheduleButton">Enviar Recomendacion</button>
            <button id="adminButton" onclick="window.location.href='vacantes.php';">Regresar</button>

        </form>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.0/xlsx.full.min.js"></script>
    <script src="app.js"></script>
    <script>
    document.getElementById('appointmentForm').addEventListener('submit', function(event) {
        var confirmacion = confirm("Notifica a tu recomendado que verifique el correo electronico que registraste para tener notificaciones de su aplicacion.");
        if (!confirmacion) {
            event.preventDefault();
        } else {
            var randomNumber = Math.floor(Math.random() * 1000000) + 1;
            document.getElementById('confirmNumber').value = randomNumber;
        }
    });
    </script>
</body>
</html>
