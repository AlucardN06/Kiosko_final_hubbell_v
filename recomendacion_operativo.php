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
        <form id="appointmentForm" action="Consulta.php" method="POST">
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
                <label for="posicion">Posición:</label>
                <select name="posicion" id="posicion" required>
                    <option value="" disabled selected>Seleccione una posición</option>
                    <?php
                   $cn = mysqli_connect('localhost', 'root', '');
                   mysqli_select_db($cn, 'id19951970_localhost');

                    $sql_posiciones = "SELECT DISTINCT Posicion FROM fechas_disponibles";
                    $result_posiciones = mysqli_query($cn, $sql_posiciones);

                    while ($row_posicion = mysqli_fetch_assoc($result_posiciones)) {
                        echo "<option value='" . $row_posicion["Posicion"] . "'>" . $row_posicion["Posicion"] . "</option>";
                    }

                    mysqli_close($cn);
                    ?>
                </select>
            </div>
            <div class="form-group">
                <label for="fechaCita">Fecha de la Cita:</label>
                <select name="fecha" id="fechaCita" required>
                    <option value="" disabled selected>Seleccione una fecha</option>
                    <?php
                    // Conexión a la base de datos
                    $cn = mysqli_connect('localhost', 'root', '');
                    mysqli_select_db($cn, 'id19951970_localhost');

                    // Consulta para obtener las fechas disponibles
                    $sql_fechas = "SELECT Fecha, Cupos FROM fechas_disponibles";
                    $result_fechas = mysqli_query($cn, $sql_fechas);

                    // Mostrar las fechas disponibles como opciones de selección
                    while ($row_fecha = mysqli_fetch_assoc($result_fechas)) {
                        echo "<option value='" . $row_fecha["Fecha"] . "' data-cupos='" . $row_fecha["Cupos"] . "'>" . $row_fecha["Fecha"] . " (Cupos: " . $row_fecha["Cupos"] . ")</option>";
                    }

                    // Cerrar la conexión a la base de datos
                    mysqli_close($cn);
                    ?>
                </select>
            </div>

            <input type="hidden" name="confirmNumber" id="confirmNumber">

            <h3>Documentos con los que se debe presentar el recomendado:</h3>
            <div id="documentos" class="form-group">
               
                <label for="documento1">*Carta De No Antecedentes Penales (No Mayor A Tres Meses)</label><br>
                <label for="documento2">*Acta De Nacimiento</label><br>
                <label for="documento3">*Comprobante De Domicilio (No Mayor A Tres Meses)</label><br>
                <label for="documento4">*CURP</label><br>
                <label for="documento5">*Número De Seguro Social</label><br>
                <label for="documento6">*RFC (Constancia De Situación Fiscal)</label><br>
                <label for="documento7">*Credencial De Elector (Vigente)</label><br>
                <label for="documento8">*Comprobante de Estudios (Certificado, Titulo)</label><br>
                
            </div>
            <button type="submit" id="scheduleButton" >Agendar Cita</button>
        </form>
        <br><br>
        <button id="adminButton" onclick="window.location.href='vacantes.php';">Regresar</button>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.0/xlsx.full.min.js"></script>
    <script src="app.js"></script>
    <script>
    // Función para verificar si todos los documentos están marcados
   // function verificarDocumentos() {
  //      var documentos = document.querySelectorAll('#documentos input[type="checkbox"]');
     //   for (var i = 0; i < documentos.length; i++) {
    //        if (!documentos[i].checked) {
     //           return false;
       //     }
     //   }
     //   return true;
   // }

    // Función para habilitar o deshabilitar el botón de agregar cita
    ///function actualizarEstadoBoton() {
     ///   var botonAgendar = document.getElementById('scheduleButton');
      ///  botonAgendar.disabled = !verificarDocumentos();
  //  }

    // Agregar event listener a los checkboxes para actualizar el estado del botón
   /// var checkboxes = document.querySelectorAll('#documentos input[type="checkbox"]');
 ///   for (var i = 0; i < checkboxes.length; i++) {
 ///       checkboxes[i].addEventListener('change', actualizarEstadoBoton);
 //   }

    // Agregar event listener al formulario para mostrar mensaje de confirmación
    document.getElementById('appointmentForm').addEventListener('submit', function(event) {
        var confirmacion = confirm("La persona recomendada debe contar con toda la documentacion anterior, en caso de no tener toda la documentacion su contratacion puede ser rechazada,¿Estas seguro de registrarlo?>");
        if (!confirmacion) {
            event.preventDefault();
        } else {
            // Generar un número aleatorio y asignarlo al campo de confirmación
            var randomNumber = Math.floor(Math.random() * 1000000) + 1; // Número aleatorio entre 1 y 1000000
            document.getElementById('confirmNumber').value = randomNumber;
        }
    });

    // Inicializar estado del botón al cargar la página
    //actualizarEstadoBoton();
    </script>
</body>
</html>
