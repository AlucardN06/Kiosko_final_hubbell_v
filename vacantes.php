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

$message = "";

// Procesamiento del formulario para agregar vacantes
if (isset($_POST['add_vacancy']) && $_SESSION['position'] == 'A') {
    if (!isset($_SESSION['form_processed'])) {
        $position = $_POST['position'];
        $number_of_vacancies = $_POST['number_of_vacancies'];
        $shifts = implode(',', $_POST['shifts']); // Convertir los turnos a una cadena separada por comas
        $status = $_POST['status'];

        $insert_query = "INSERT INTO vacancies (position, number_of_vacancies, shifts, status) VALUES (?, ?, ?, ?)";
        $stmt = mysqli_prepare($conn, $insert_query);
        mysqli_stmt_bind_param($stmt, "siss", $position, $number_of_vacancies, $shifts, $status);
        $result = mysqli_stmt_execute($stmt);

        if ($result) {
            $vacancy_id = mysqli_insert_id($conn); // Obtener el ID de la vacante recién insertada
            $message = "Vacante agregada correctamente.";

            // Verificar si la vacante es para un operador y agregar los datos adicionales
            if (isset($_POST['operator_check']) && stripos($position, 'operador') !== false) {
                $operator_date = $_POST['operator_date'];
                $operator_slots = $_POST['operator_slots'];

                $insert_operator_query = "INSERT INTO fechas_disponibles (vacan_id, Posicion, Fecha, Cupos) VALUES (?, ?, ?, ?)";
                $stmt_operator = mysqli_prepare($conn, $insert_operator_query);
                mysqli_stmt_bind_param($stmt_operator, "issi", $vacancy_id, $position, $operator_date, $operator_slots);
                mysqli_stmt_execute($stmt_operator);
            }

            $_SESSION['form_processed'] = true;
        } else {
            $message = "Error al agregar la vacante: " . mysqli_error($conn);
        }


        // Redirigir para evitar el reenvío del formulario
        header("Location: vacantes.php");
        exit;
    }
}
// Procesamiento del formulario para editar vacantes
if (isset($_POST['edit_vacancy']) && $_SESSION['position'] == 'A') {
    $vacancy_id = $_POST['vacancy_id'];
    $number_of_vacancies = $_POST['number_of_vacancies'];
    $shifts = implode(',', $_POST['shifts']); // Convertir los turnos a una cadena separada por comas
    $status = $_POST['status'];

    $update_query = "UPDATE vacancies SET ";
    $params = [];
    $types = "";

    if (!empty($number_of_vacancies)) {
        $update_query .= "number_of_vacancies = ?, ";
        $types .= "i";
        $params[] = $number_of_vacancies;
    }

    if (!empty($shifts)) {
        $update_query .= "shifts = ?, ";
        $types .= "s";
        $params[] = $shifts;
    }

    if (!empty($status)) {
        $update_query .= "status = ?, ";
        $types .= "s";
        $params[] = $status;
    }

    $update_query = rtrim($update_query, ", ") . " WHERE id = ?";
    $types .= "i";
    $params[] = $vacancy_id;

    $stmt = mysqli_prepare($conn, $update_query);
    mysqli_stmt_bind_param($stmt, $types, ...$params);
    $result = mysqli_stmt_execute($stmt);

    if ($result) {
        echo "<script>alert('Vacante actualizada correctamente.');</script>";
    } else {
        echo "<script>alert('Error al actualizar la vacante: " . mysqli_error($conn) . "');</script>";
    }
}

// Procesamiento del formulario para eliminar vacantes
if (isset($_POST['delete_vacancy']) && $_SESSION['position'] == 'A') {
    $vacancy_id = $_POST['vacancy_id'];

    $delete_query = "DELETE FROM vacancies WHERE id = ?";
    $stmt = mysqli_prepare($conn, $delete_query);
    mysqli_stmt_bind_param($stmt, "i", $vacancy_id);
    $result = mysqli_stmt_execute($stmt);

    if ($result) {
        echo "<script>alert('Vacante eliminada correctamente.');</script>";
    } else {
        echo "Error al eliminar la vacante: " . mysqli_error($conn);
    }
}

// Procesamiento del formulario para eliminar vacantes y fechas disponibles si la posición es Operador
if (isset($_POST['delete_vacancy_operador']) && $_SESSION['position'] == 'A') {
    $vacancy_id = $_POST['vacancy_id'];

   
        // Eliminar las fechas disponibles asociadas a la vacante
        $delete_fechas_query = "DELETE FROM fechas_disponibles WHERE vacan_id = ?";
        $stmt = mysqli_prepare($conn, $delete_fechas_query);
        mysqli_stmt_bind_param($stmt, "i", $vacancy_id);
        mysqli_stmt_execute($stmt);

        // Eliminar la vacante
        $delete_vacancy_query = "DELETE FROM vacancies WHERE id = ?";
        $stmt = mysqli_prepare($conn, $delete_vacancy_query);
        mysqli_stmt_bind_param($stmt, "i", $vacancy_id);
        mysqli_stmt_execute($stmt);

        // Confirmar la transacción
        mysqli_commit($conn);
        echo "<script>alert('Vacante y fechas disponibles eliminadas correctamente.');</script>";
    } 



// Obtener información del usuario si está en sesión
$user = null;
if (isset($_SESSION['user_id'])) {
    $user_id = $_SESSION['user_id'];
    $query = "SELECT firstname, lastname, position, area, plant FROM users WHERE id = '$user_id'";
    $result = mysqli_query($conn, $query);

    if ($result && mysqli_num_rows($result) > 0) {
        $user = mysqli_fetch_assoc($result);
        $_SESSION['position'] = $user['position']; // Asegurando la posición en la sesión
    } else {
        die("Error al obtener datos del usuario");
    }
}

// Consultar vacantes
$vacancies_result = mysqli_query($conn, "SELECT * FROM vacancies");

// Cerrar sesión
if (isset($_POST['logout'])) {
    session_destroy();
    header("Location: index.php");
    exit;
}

// Limpiar la bandera de formulario procesado al cargar la página
unset($_SESSION['form_processed']);
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vacantes</title>
    <link rel="stylesheet" href="vacantes.css">
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <!-- Incluir jQuery (Select2 lo necesita) -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Incluir JS de Select2 -->
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <script>
function updateDateTime() {
            const now = new Date();
            const dateString = now.toLocaleDateString();
            const timeString = now.toLocaleTimeString();
            document.getElementById('datetime').textContent = `Fecha: ${dateString}, Hora: ${timeString}`;
        }

        setInterval(updateDateTime, 1000); // Actualiza cada segundo

        window.onload = updateDateTime; // Llama a la función al cargar la página
    </script>
</head>
<body>
    <div class="container">
        <div class="left-section user-info">
            <div class="logo">
                <img src="images/Logo.webp" alt="Logo">
            </div>
            <?php if ($user) : ?>
                <h2>Bienvenido, <?php echo htmlspecialchars($user['firstname'] . ' ' . $user['lastname']); ?></h2>
                <p>Puesto: <?php echo htmlspecialchars($user['area']); ?></p>
                <p>Tipo de autorización: <?php echo htmlspecialchars($user['position']); ?></p>
                <p>Planta: <?php echo htmlspecialchars($user['plant']); ?></p>
                <p id="datetime"></p> <!-- Contenedor para la fecha y la hora -->
                <div class="user-buttons">
                <form>
    <button type="button" onclick="location.href='ta.php'" class="user-button">
        Regresar
    </button>
</form>

                <form action="index.php" method="POST">
                        <button type="submit" name="logout" class="user-button">Cerrar sesión</button>
                    </form>
            <?php endif; ?>
        </div>
            </div>
            <div class="right-section">
            <button class="back-button" onclick="location.href='ta.php'">
                <i class="fas fa-arrow-left"></i> Regresar
            </button>
            <br>
            <br>
            <?php if ($user && $user['position'] == 'A') : ?>
                <button class="show-vacancy-form">Agregar Vacante</button>
                <div class="vacancy-form-container" style="display:none;">
                    <h3>Agregar Vacante</h3>
                    <form action="vacantes.php" method="POST">
                        <label for="position">Posición:</label>
                        <input type="text" id="position" name="position" required>
                        <label for="number_of_vacancies">Número de vacantes:</label>
                        <input type="number" id="number_of_vacancies" name="number_of_vacancies" required>
                        <label for="shifts">Turnos:</label>
                        <select id="shifts-select" name="shifts[]" multiple required>
                            <option value="1.er">1.er</option>
                            <option value="2.ª">2.ª</option>
                            <option value="3.er">3.er</option>
                            <option value="AA">AA</option>
                            <option value="BB">BB</option>
                            <option value="CC">CC</option>
                            <option value="DD">DD</option>
                            <option value="Sáb y Dom">Sáb y Dom</option>
                        </select>
                        <label for="status">Estatus:</label>
                        <select id="status" name="status" required>
                            <option value="Disponibles">Disponibles</option>
                            <option value="En contratación">En contratación</option>
                            <option value="En entrevista">En entrevista</option>
                            <option value="No disponible">No disponible</option>
                        </select>
                        <label for="operator_check">Directo</label>
        <input type="checkbox" id="operator_check" name="operator_check" onclick="toggleOperatorForm()">

        <div id="operator_form" style="display:none;">
            <label for="operator_date">Fecha:</label>
            <input type="date" id="operator_date" name="operator_date">

            <label for="operator_slots">Cupos:</label>
            <input type="number" id="operator_slots" name="operator_slots">
        </div>

                        <button type="submit" name="add_vacancy">Agregar</button>
                    </form>
                </div>
            <?php endif; ?>
            <?php if ($vacancies_result && mysqli_num_rows($vacancies_result) > 0) : ?>
                <h3>Vacantes</h3>
                <div class="vacancies-list">
                    <?php while ($vacancy = mysqli_fetch_assoc($vacancies_result)) : ?>
                        <div class="vacancy-item">
                            <h4><?php echo htmlspecialchars($vacancy['position']); ?></h4>
                            <p>Número de vacantes: <?php echo htmlspecialchars($vacancy['number_of_vacancies']); ?></p>
                            <p>Turnos: <?php echo htmlspecialchars($vacancy['shifts']); ?></p>
                            <p>Estatus: <?php echo htmlspecialchars($vacancy['status']); ?></p>
                            
                            <?php if ($user && $user['position'] == 'A') : ?>
                                <?php if (stripos($vacancy['position'], 'Operador') === 0) : ?>
                                    <form action="vacantes.php" method="POST">
    <input type="hidden" name="vacancy_id" value="<?php echo htmlspecialchars($vacancy['id']); ?>">
    <button class="user-button" type="submit" name="delete_vacancy_operador" onclick="return confirm('¿Estás seguro de que deseas eliminar esta vacante y sus fechas disponibles?');">Eliminar Operador</button>
</form>

<?php else : ?>
    <button class="show-update-form">Actualizar información</button>
    <div class="update-form-container" style="display:none;">
        <form action="vacantes.php" method="POST">
            <input type="hidden" name="vacancy_id" value="<?php echo htmlspecialchars($vacancy['id']); ?>">
            <label for="number_of_vacancies">Número de vacantes:</label>
            <input type="number" name="number_of_vacancies" value="<?php echo htmlspecialchars($vacancy['number_of_vacancies']); ?>">
            <label for="shifts">Turnos:</label>
            <select id="shifts-select-<?php echo htmlspecialchars($vacancy['id']); ?>" name="shifts[]" multiple required>
                <option value="1.er" <?php if (in_array('1.er', explode(',', $vacancy['shifts']))) echo 'selected'; ?>>1.er</option>
                <option value="2.ª" <?php if (in_array('2.ª', explode(',', $vacancy['shifts']))) echo 'selected'; ?>>2.ª</option>
                <option value="3.er" <?php if (in_array('3.er', explode(',', $vacancy['shifts']))) echo 'selected'; ?>>3.er</option>
                <option value="AA" <?php if (in_array('AA', explode(',', $vacancy['shifts']))) echo 'selected'; ?>>AA</option>
                <option value="BB" <?php if (in_array('BB', explode(',', $vacancy['shifts']))) echo 'selected'; ?>>BB</option>
                <option value="CC" <?php if (in_array('CC', explode(',', $vacancy['shifts']))) echo 'selected'; ?>>CC</option>
                <option value="DD" <?php if (in_array('DD', explode(',', $vacancy['shifts']))) echo 'selected'; ?>>DD</option>
                <option value="Sáb y Dom" <?php if (in_array('Sáb y Dom', explode(',', $vacancy['shifts']))) echo 'selected'; ?>>Sáb y Dom</option>
            </select>
            <label for="status">Estatus:</label>
            <select name="status">
                <option value="Disponibles" <?php if ($vacancy['status'] == 'Disponibles') echo 'selected'; ?>>Disponibles</option>
                <option value="En contratación" <?php if ($vacancy['status'] == 'En contratación') echo 'selected'; ?>>En contratación</option>
                <option value="En entrevista" <?php if ($vacancy['status'] == 'En entrevista') echo 'selected'; ?>>En entrevista</option>
                <option value="No disponible" <?php if ($vacancy['status'] == 'No disponible') echo 'selected'; ?>>No disponible</option>
            </select>
            <button type="submit" name="edit_vacancy">Actualizar</button>
        </form>
        <form action="vacantes.php" method="POST">
            <input type="hidden" name="vacancy_id" value="<?php echo htmlspecialchars($vacancy['id']); ?>">
            <button class="user-button" type="submit" name="delete_vacancy" onclick="return confirm('¿Estás seguro de que deseas eliminar esta vacante?');">Eliminar</button>
        </form>
    </div>
<?php endif; ?>
<?php endif; ?>
</div>
                    <?php endwhile; ?>
                </div>
                <div class="recomen_container">
                    <button  class="recomen" Onclick="showAlertandIndirecto()">Registra una recomendación Indirecta</button>
                    <button  class="recomen" Onclick="showAlertandDirecto()">Registra una recomendación Directa</button>
                    <button class="recomen" Onclick="showAlertAndOpenPDF()">Me quiero postular a la vacante</button>
                </div>
               

<script>
    function showAlertAndOpenPDF() {
        const message = "Para postularte a una vacante recuerda que debes tener mínimo 6 meses de antigüedad, llena la solicitud e imprímela y llévala a Recursos Humanos con Adquisición de talentos.";
        if (confirm(message)) {
            window.open('uploads/Movimiento de Promocion Editable.pdf', '_blank');
        }
    }
    function showAlertandIndirecto(){
        const message = "Se te va a redireccionar a un formulario para recomendar a una persona a una vacante Indirecta ¿Deseas Continuar?";
        if (confirm(message)) {
            location.href='recomendados.php';
        }
    }
    function showAlertandDirecto(){
        const message = "Se te va a redireccionar a un formulario para recomendar a un operador. ¿Deseas Continuar?";
        if (confirm(message)) {
            location.href='recomendacion_operativo.php';
        }
    }
</script>
                            <br>
            <?php else : ?>
                <h1>No hay vacantes disponibles.</h1>
            <?php endif; ?>
        </div>
    </div>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const showVacancyFormButton = document.querySelector('.show-vacancy-form');
            const vacancyFormContainer = document.querySelector('.vacancy-form-container');
            const showUpdateFormButtons = document.querySelectorAll('.show-update-form');
            const updateFormContainers = document.querySelectorAll('.update-form-container');
            const shiftsSelect = $('#shifts-select');
            const shiftsSelects = $('[id^=shifts-select-]');

            showVacancyFormButton.addEventListener('click', function () {
                vacancyFormContainer.style.display = vacancyFormContainer.style.display === 'none' ? 'block' : 'none';
            });

            showUpdateFormButtons.forEach((button, index) => {
                button.addEventListener('click', function () {
                    updateFormContainers[index].style.display = updateFormContainers[index].style.display === 'none' ? 'block' : 'none';
                });
            });

            shiftsSelect.select2({
                placeholder: 'Selecciona los turnos',
                width: '20%'
            });

            shiftsSelects.each(function() {
                $(this).select2({
                    placeholder: 'Selecciona los turnos',
                    width: '20%'
                });
            });
        });
        function toggleOperatorForm() {
    var checkBox = document.getElementById("operator_check");
    var operatorForm = document.getElementById("operator_form");
    if (checkBox.checked == true){
        operatorForm.style.display = "block";
    } else {
        operatorForm.style.display = "none";
    }
}

$(document).ready(function() {
    $('#shifts, #edit_shifts').select2();
});
    </script>
</body>
</html>
