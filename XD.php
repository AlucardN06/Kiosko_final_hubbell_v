<?php
session_start();
// Verificar si el usuario está logueado
if (!isset($_SESSION['user_id'])) {
    // Redirigir al login si no hay sesión iniciada
    header("Location: index.php");
    exit;
}

$user_id = $_SESSION['user_id'];


// Conexión a la base de datos
$host = 'localhost';
$user = 'root';
$password = '';
$database = 'id19951970_localhost';

$conn = mysqli_connect($host, $user, $password, $database);

if (!$conn) {
    echo "<script>alert('Error de conexión: " . mysqli_connect_error() . "');window.location.href = 'dashboard.php';</script>";
    exit;
}
function hasTemporaryApproval($approve_user_id, $conn) {
    $current_time = date('Y-m-d H:i:s');
    $query = "SELECT * FROM temporary_approvals WHERE approve_user_id = ? AND expiration_time > ?";
    $stmt = mysqli_prepare($conn, $query);
    mysqli_stmt_bind_param($stmt, "ss", $approve_user_id, $current_time);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);

    if ($result && mysqli_num_rows($result) > 0) {
        return true;
    } else {
        return false;
    }
}


        // Verificar si el usuario en sesión tiene aprobación temporal
        $has_temporary_approval = hasTemporaryApproval($user_id, $conn);

        // Obtener la posición del usuario (esto depende de cómo manejes la sesión en tu aplicación)
        $position_AB = $_SESSION['position'] ?? ''; 
 
// Consulta las propuestas de tiempo extra para administrativos
$temporary_approval = hasTemporaryApproval($user_id, $conn);

$requests_result = null;

if ($temporary_approval) {    // Obtener propuestas agrupadas por fecha y supervisor desde la tabla operators
    $query = "SELECT proposal_date, supervisor_id FROM operators GROUP BY proposal_date, supervisor_id";
    $requests_result = mysqli_query($conn, $query);
}
// Procesamiento del formulario de aprobación/rechazo por parte de los administradores
if (isset($_POST['approve_request']) || isset($_POST['reject_request'])) {
    $request_id = $_POST['request_id'];
    $admin_id = $_SESSION['user_id'];
    $proposal_date = $_POST['proposal_date']; // Nuevo: Obtener la fecha de propuesta

    if (isset($_POST['approve_request'])) {
        $status = 'Aprobado';
    } elseif (isset($_POST['reject_request'])) {
        $status = 'Rechazado';
    }

    $reason = isset($_POST['reject_reason']) ? $_POST['reject_reason'] : null;

    // Verificar si ya se ha tomado una decisión para esta propuesta
    $check_query = "SELECT * FROM approvals WHERE proposal_id = '$request_id' AND admin_id = '$admin_id'";
    $check_result = mysqli_query($conn, $check_query);

    if ($check_result && mysqli_num_rows($check_result) == 0) {
        // Insertar la decisión en la tabla de aprobaciones
        $insert_query = "INSERT INTO approvals (proposal_id, admin_id, action, reject_reason, proposal_date) VALUES ('$request_id', '$admin_id', '$status', '$reason', '$proposal_date')";
        $insert_result = mysqli_query($conn, $insert_query);

        if (!$insert_result) {
            echo "<script>alert('Error al insertar la aprobación/rechazo: " . mysqli_error($conn) . "');window.location.href = 'dashboard.php';</script>";
            exit;
        }

        // Verificar si al menos 3 administradores han aprobado la propuesta
        $count_query = "SELECT COUNT(*) AS approval_count FROM approvals WHERE proposal_id = '$request_id' AND action = 'Aprobado'";
        $count_result = mysqli_query($conn, $count_query);
        $count_row = mysqli_fetch_assoc($count_result);

        if ($count_row['approval_count'] >= 3) {
            // Actualizar el estado de la propuesta a 'Aprobado por Administradores'
            $update_query = "UPDATE extra_time_proposals SET status = 'Aprobado por Administradores' WHERE id = '$request_id'";
            mysqli_query($conn, $update_query);

            // Guardar los administradores que aprobaron la propuesta
            $admin_query = "SELECT admin_id FROM approvals WHERE proposal_id = '$request_id' AND action = 'Aprobado'";
            $admin_result = mysqli_query($conn, $admin_query);
            $admin_ids = [];
            while ($admin_row = mysqli_fetch_assoc($admin_result)) {
                $admin_ids[] = $admin_row['admin_id'];
            }
        }

        // Verificar si la propuesta ha sido rechazada por algún administrador
        $reject_query = "SELECT COUNT(*) AS reject_count FROM approvals WHERE proposal_id = '$request_id' AND action = 'Rechazado'";
        $reject_result = mysqli_query($conn, $reject_query);
        $reject_row = mysqli_fetch_assoc($reject_result);

        if ($reject_row['reject_count'] > 0) {
            // Actualizar el estado de la propuesta a 'Rechazado'
            $update_query = "UPDATE approvals SET action = 'Rechazado' WHERE id = '$request_id'";
            mysqli_query($conn, $update_query);
        }
    }
}

// Procesamiento del formulario para agregar operadores
if (isset($_POST['add_operator'])) {
    $supervisor_id = $_SESSION['user_id'];
    $employee_username = $_POST['employee_username'];
    $schedule = $_POST['schedule'];
    $proposal_date = $_POST['proposal_date'];
    $start_time = $_POST['start_time'];
    $end_time = $_POST['end_time'];
    $schedule = "De $start_time a $end_time";

    // Verificar que la fecha sea futura
    $current_date = date('Y-m-d');
    if ($proposal_date <= $current_date) {
        echo "<script>alert('La fecha de la propuesta debe ser una fecha futura.');window.location.href = 'dashboard.php';</script>";
        exit;
    }
// Obtener información del empleado usando el username (número de reloj)
$employee_query = "SELECT id, firstname, lastname, area, plant, colony, username, supervisor_name FROM users WHERE username = '$employee_username'";
$employee_result = mysqli_query($conn, $employee_query);

if ($employee_result && mysqli_num_rows($employee_result) > 0) {
    $employee_row = mysqli_fetch_assoc($employee_result);
    $employee_id = $employee_row['id'];
    $employee_firstname = $employee_row['firstname'];
    $employee_lastname = $employee_row['lastname'];
    $employee_area = $employee_row['area'];
    $employee_plant = $employee_row['plant'];
    $employee_colony = $employee_row['colony'];
    $employee_username = $employee_row['username'];
    $assigned_supervisor_name = trim($employee_row['supervisor_name']);

    // Obtener el nombre del supervisor actual
    $supervisor_query = "SELECT firstname, lastname FROM users WHERE id = '$supervisor_id'";
    $supervisor_result = mysqli_query($conn, $supervisor_query);
    $supervisor_row = mysqli_fetch_assoc($supervisor_result);
    $supervisor_firstname = $supervisor_row['firstname'];
    $supervisor_lastname = $supervisor_row['lastname'];
    $supervisor_fullname = trim($supervisor_firstname . ' ' . $supervisor_lastname);

    // Verificar si el supervisor actual es el supervisor asignado al empleado (sin considerar mayúsculas/minúsculas y espacios adicionales)
    if (strcasecmp($assigned_supervisor_name, $supervisor_fullname) !== 0) {
        echo "<script>alert('No puedes insertar a este empleado. No eres el supervisor asignado.');window.location.href = 'dashboard.php';</script>";
        exit;
    }

    // Calcular las horas trabajadas en esta entrada
    $start_time_datetime = new DateTime($start_time);
    $end_time_datetime = new DateTime($end_time);
    $interval = $start_time_datetime->diff($end_time_datetime);
    $hours_worked = $interval->h + ($interval->i / 60);

    // Verificar si el empleado ya ha trabajado 24 horas en la semana actual
    $start_of_week = date('Y-m-d', strtotime('monday this week', strtotime($proposal_date)));
    $end_of_week = date('Y-m-d', strtotime('sunday this week', strtotime($proposal_date)));

    $sum_hours_query = "SELECT SUM(TIMESTAMPDIFF(HOUR, start_time, end_time)) as total_hours 
                        FROM operators 
                        WHERE employee_id = '$employee_id' 
                        AND proposal_date BETWEEN '$start_of_week' AND '$end_of_week'";
    $sum_hours_result = mysqli_query($conn, $sum_hours_query);
    $sum_hours_row = mysqli_fetch_assoc($sum_hours_result);
    $total_hours_week = $sum_hours_row['total_hours'] + $hours_worked;

    if ($total_hours_week > 24) {
        echo "<script>alert('El empleado ha excedido las 24 horas de trabajo permitidas en la semana.');window.location.href = 'dashboard.php';</script>";
        exit;
    }

    // Insertar operador en la tabla operators
    $insert_operator_query = "INSERT INTO operators (employee_id, supervisor_id, supervisor_firstname, supervisor_lastname, username, firstname, lastname, area, plant, colony, proposal_date, schedule, start_time, end_time) 
                              VALUES ('$employee_id', '$supervisor_id', '$supervisor_firstname', '$supervisor_lastname', '$employee_username', '$employee_firstname', '$employee_lastname', '$employee_area', '$employee_plant', '$employee_colony', '$proposal_date', '$schedule', '$start_time', '$end_time')";
    $insert_operator_result = mysqli_query($conn, $insert_operator_query);

    if (!$insert_operator_result) {
        echo "<script>alert('Error al insertar el operador: " . mysqli_error($conn) . "');window.location.href = 'dashboard.php';</script>";
        exit;
    }
} else {
    echo "<script>alert('No se encontró un empleado con el número de reloj proporcionado.');window.location.href = 'dashboard.php';</script>";
    exit;
}
}
// Procesamiento de la solicitud para eliminar operadores
if (isset($_POST['delete_operator'])) {
    $operator_id = $_POST['operator_id'];

    // Verificar que el usuario tenga permiso para eliminar el registro
    $user_id = $_SESSION['user_id'];
    $user_position = $user['position'];

    // Eliminar el operador de la tabla
    $delete_query = "DELETE FROM operators WHERE id = '$operator_id'";
    $delete_result = mysqli_query($conn, $delete_query);

    if (!$delete_result) {
        echo "<script>alert('Error al eliminar el operador: " . mysqli_error($conn) . "');window.location.href = 'dashboard.php';</script>";
        exit;
    }
}

// Procesamiento de la solicitud para eliminar toda la tabla de operadores para una fecha específica
if (isset($_POST['delete_all_operators_btn'])) {
    $proposal_date = $_POST['delete_all_operators'];

    // Eliminar todos los operadores asociados con la fecha especificada
    $delete_all_query = "DELETE FROM operators WHERE proposal_date = '$proposal_date'";
    $delete_all_result = mysqli_query($conn, $delete_all_query);

    if (!$delete_all_result) {
        echo "<script>alert('Error al eliminar la tabla de operadores: " . mysqli_error($conn) . "');window.location.href = 'dashboard.php';</script>";
        exit;
    }
}

// Obtener información del usuario si está en sesión
$user = null;
if (isset($_SESSION['user_id'])) {
    $user_id = $_SESSION['user_id'];
    $query = "SELECT firstname, lastname, position, area, plant FROM users WHERE id = '$user_id'";
    $result = mysqli_query($conn, $query);

    if ($result && mysqli_num_rows($result) > 0) {
        $user = mysqli_fetch_assoc($result);
    } else {
        die("Error al obtener datos del usuario");
    }
}

// Consulta las propuestas de tiempo extra para suplentes
$requests_result = null;
if ($user && $user['position'] == 'AB'|| $has_temporary_approval == 1 ) {
    // Obtener propuestas agrupadas por fecha y supervisor desde la tabla operators
    $query = "SELECT proposal_date, supervisor_id FROM operators GROUP BY proposal_date, supervisor_id";
    $requests_result = mysqli_query($conn, $query);
}
// Consulta las propuestas de tiempo extra creadas por el supervisor
$supervisor_proposals_result = null;
if ($user && $user['position'] == 'B') {
    $supervisor_id = $_SESSION['user_id'];
    $query = "SELECT proposal_date FROM operators WHERE supervisor_id = '$supervisor_id' GROUP BY proposal_date";
    $supervisor_proposals_result = mysqli_query($conn, $query);
}

function getSupervisorName($supervisor_id, $conn) {
    $query = "SELECT firstname, lastname FROM users WHERE id = '$supervisor_id'";
    $result = mysqli_query($conn, $query);

    if ($result && mysqli_num_rows($result) > 0) {
        $row = mysqli_fetch_assoc($result);
        return $row['firstname'] . ' ' . $row['lastname'];
    } else {
        return 'Desconocido'; // Manejar caso de error o supervisor no encontrado
    }
}

?>

<link rel="stylesheet" href="dashboard.css">
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    
    <style>
        .table-container {
            display: none;
        }
        .reject-reason {
            display: none;
        }
        .confirm-reject-btn {
            display: none;
        }
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.3/xlsx.full.min.js"></script>
    <script>
        function downloadExcel(tableId) {
            var table = document.getElementById(tableId);
            var wb = XLSX.utils.table_to_book(table, {sheet:"Detalles de Propuestas"});
            XLSX.writeFile(wb, 'detalles_propuestas.xlsx');
        }

        function updateDateTime() {
            const now = new Date();
            const dateString = now.toLocaleDateString();
            const timeString = now.toLocaleTimeString();
            document.getElementById('datetime').textContent = `Fecha: ${dateString}, Hora: ${timeString}`;
        }

        setInterval(updateDateTime, 1000);
        window.onload = updateDateTime;

        function checkOrientation() {
            if (window.innerHeight > window.innerWidth) {
                document.getElementById('orientation-alert').style.display = 'flex';
            } else {
                document.getElementById('orientation-alert').style.display = 'none';
            }
        }

        window.onload = checkOrientation;
        window.addEventListener('orientationchange', checkOrientation);
        window.addEventListener('resize', checkOrientation);

        function toggleVisibility(containerId, button) {
            var container = document.getElementById(containerId);
            if (container.style.display === 'none' || container.style.display === '') {
                container.style.display = 'block';
                button.textContent = button.textContent.replace('Mostrar', 'Ocultar');
            } else {
                container.style.display = 'none';
                button.textContent = button.textContent.replace('Ocultar', 'Mostrar');
            }
        }

        function toggleActionButtons(button) {
            var actionButtons = button.previousElementSibling;
            if (actionButtons.style.display === 'none' || actionButtons.style.display === '') {
                actionButtons.style.display = 'block';
                button.textContent = 'Ocultar Acciones';
            } else {
                actionButtons.style.display = 'none';
                button.textContent = 'Mostrar Acciones';
            }
        }
    </script>
    <style>
        #orientation-alert {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            color: white;
            font-size: 24px;
            text-align: center;
            justify-content: center;
            align-items: center;
            z-index: 9999;
            flex-direction: column;
        }
    </style>
</head>
<body>
    <div id="orientation-alert">
        <div>Por favor, gire su dispositivo para una mejor experiencia.</div>
    </div>
    <div class="container">
        <div class="left-section user-info">
            <div class="logo">
                <img src="images/Logo.webp" alt="Logo">
            </div>
            <?php if ($user) : ?>
                <h2>Bienvenido, <?php echo htmlspecialchars($user['firstname'] . ' ' . $user['lastname']); ?></h2>
                <p>Puesto: <?php echo htmlspecialchars($user['area']); ?></p>
                <p>Autorización tipo: <?php echo htmlspecialchars($user['position']); ?></p>
                <p>Planta: <?php echo htmlspecialchars($user['plant']); ?></p>
                <p>El user_id actual es: <?php echo htmlspecialchars($user_id); ?></p>
                <p>El approbal actual es: <?php echo htmlspecialchars($has_temporary_approval); ?></p>

                <p id="datetime"></p>
                <div class="user-buttons">
                    <form>
                        <button type="button" onclick="location.href='departamentos.php'" class="user-button">
                            Regresar
                        </button>
                    </form>
                    <form action="index.php" method="POST">
                        <button type="submit" name="logout" class="user-button">Cerrar sesión</button>
                    </form>
                </div>
            <?php endif; ?>
        </div>
        <div class="right-section">

        <?php if ($user && $user['position'] == 'A'|| $position_AB == 'AB') : ?>
                          <?php if ($user && $user['position'] == 'AB') : ?>
                <h3>Agregar Empleado</h3>
                <form action="dashboard.php" method="POST" class="add-operator-form">
                    <label for="employee_username">Número de Reloj del Empleado:</label>
                    <input type="text" id="employee_username" name="employee_username" required>
                    <label>Horario de Entrada:</label>
                    <input type="time" id="start_time" name="start_time" required>
                    <label>Horario de Salida:</label>
                    <input type="time" id="end_time"  name="end_time" required>
                    <input type="hidden" id="schedule" name="schedule" required>
                    <label for="proposal_date">Fecha de Propuesta:</label>
                    <input type="date" id="proposal_date" name="proposal_date" required>
                    <button type="submit" name="add_operator">Agregar Empleado</button>
                </form>
            <?php endif; ?>
                <h3>Propuestas de Tiempo Extra</h3>
                <?php if ($requests_result && mysqli_num_rows($requests_result) > 0) : ?>
                    <?php while ($row = mysqli_fetch_assoc($requests_result)) : ?>
                        <?php
                            $tableId = 'proposal-table-' . $row['proposal_date'] . '-' . $row['supervisor_id'];
                            $containerId = 'table-container-' . $row['proposal_date'] . '-' . $row['supervisor_id'];
                        ?>
                        <button onclick="toggleVisibility('<?php echo $containerId; ?>', this)">Mostrar Propuestas del <?php echo htmlspecialchars($row['proposal_date']); ?> - Supervisor <?php echo htmlspecialchars(getSupervisorName($row['supervisor_id'], $conn)); ?></button>
                        <div id="<?php echo $containerId; ?>" class="table-container">
                            <table id="<?php echo $tableId; ?>" class="proposal-table">
                                <thead>
                                    <tr>
                                        <th>Nombre del Supervisor</th>
                                        <th>Apellido del Supervisor</th>
                                        <th>Numero de reloj del empledo</th>
                                        <th>Nombre</th>
                                        <th>Apellido</th>
                                        <th>Puesto</th>
                                        <th>Planta</th>
                                        <th>Colonia</th>
                                        <th>Horario</th>
                                        <th>Fecha</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    $date = $row['proposal_date'];
                                    $supervisor_id = $row['supervisor_id'];
                                    $details_query = "SELECT * FROM operators WHERE proposal_date = '$date' AND supervisor_id = '$supervisor_id'";
                                    $details_result = mysqli_query($conn, $details_query);
                                    while ($detail_row = mysqli_fetch_assoc($details_result)) : ?>
                                        <tr>
                                            <td><?php echo htmlspecialchars($detail_row['supervisor_firstname']); ?></td>
                                            <td><?php echo htmlspecialchars($detail_row['supervisor_lastname']); ?></td>
                                            <td><?php echo htmlspecialchars($detail_row['username']); ?></td>
                                            <td><?php echo htmlspecialchars($detail_row['firstname']); ?></td>
                                            <td><?php echo htmlspecialchars($detail_row['lastname']); ?></td>
                                            <td><?php echo htmlspecialchars($detail_row['area']); ?></td>
                                            <td><?php echo htmlspecialchars($detail_row['plant']); ?></td>
                                            <td><?php echo htmlspecialchars($detail_row['colony']); ?></td>
                                            <td><?php echo htmlspecialchars($detail_row['schedule']); ?></td>
                                            <td><?php echo htmlspecialchars($detail_row['proposal_date']); ?></td>
                                        </tr>
                                    <?php endwhile; ?>
                                </tbody>
                            </table>
                            <br>
                            <form action="dashboard.php" method="POST">
                                <input type="hidden" name="delete_all_operators" value="<?php echo $row['proposal_date']; ?>">
                                <button type="submit" name="delete_all_operators_btn" class="delete-all-btn">Eliminar Tabla Completa</button>
                                <button type="button" onclick="downloadExcel('<?php echo $tableId; ?>')">Descargar Detalles en Excel</button>
                            </form>
                            <div class="action-buttons">
                                <form action="dashboard.php" method="POST">
                                    <input type="hidden" name="request_id" value="<?php echo htmlspecialchars($row['proposal_date'] . '-' . $row['supervisor_id']); ?>">
                                    <input type="hidden" name="proposal_date" value="<?php echo htmlspecialchars($row['proposal_date']); ?>">
                                    <button type="submit" name="approve_request" class="approve-btn" onclick="return confirm('¿Estás seguro de aprobar esta propuesta?')">Aprobar</button>
                                    <button type="submit" name="reject_request" class="reject-btn" onclick="return confirm('¿Estás seguro de rechazar esta propuesta?')">Rechazar</button>
                                    <textarea name="reject_reason" id="reject_reason" placeholder="Motivo de rechazo" class="reject-reason"></textarea>
                                </form>
                                <button type="button" onclick="toggleActionButtons(this)">Mostrar/Ocultar Acciones</button>
                            </div>
                        </div>
                    <?php endwhile; ?>
                <?php else : ?>
                    <p>No hay propuestas de tiempo extra pendientes.</p>
                <?php endif; ?>
                
            <?php elseif ($user && $user['position'] == 'B') : ?>
                <h3>Agregar Empleado</h3>
                <form action="dashboard.php" method="POST" class="add-operator-form">
                    <label for="employee_username">Número de Reloj del Empleado:</label>
                    <input type="text" id="employee_username" name="employee_username" required>
                    <label>Horario de Entrada:</label>
                    <input type="time" id="start_time" name="start_time" required>
                    <label>Horario de Salida:</label>
                    <input type="time" id="end_time"  name="end_time" required>
                    <input type="hidden" id="schedule" name="schedule" required>
                    <label for="proposal_date">Fecha de Propuesta:</label>
                    <input type="date" id="proposal_date" name="proposal_date" required>
                    <button type="submit" name="add_operator">Agregar Empleado</button>
                </form>
            <?php endif; ?>
            <?php if ($supervisor_proposals_result && mysqli_num_rows($supervisor_proposals_result) > 0) : ?>
                <h3>Tus Propuestas de Tiempo Extra</h3>
                <?php while ($proposal_row = mysqli_fetch_assoc($supervisor_proposals_result)) : ?>
                    <?php
                        $tableId = 'proposal-table-' . $proposal_row['proposal_date'];
                        $containerId = 'table-container-' . $proposal_row['proposal_date'];
                    ?>
                    <button onclick="toggleVisibility('<?php echo $containerId; ?>', this)">Mostrar Propuestas del <?php echo htmlspecialchars($proposal_row['proposal_date']); ?></button>
                    <div id="<?php echo $containerId; ?>" class="table-container">
                        <table id="<?php echo $tableId; ?>" class="proposal-table">
                            <thead>
                                <tr>
                                    <th>Nombre del Supervisor</th>
                                    <th>Apellido del Supervisor</th>
                                    <th>Numero de reloj del empledo</th>
                                    <th>Nombre</th>
                                    <th>Apellido</th>
                                    <th>Puesto</th>
                                    <th>Planta</th>
                                    <th>Colonia</th>
                                    <th>Horario</th>
                                    <th>Fecha</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                $proposal_date = $proposal_row['proposal_date'];
                                $proposal_details_query = "SELECT * FROM operators WHERE proposal_date = '$proposal_date' AND supervisor_id = '$supervisor_id'";
                                $proposal_details_result = mysqli_query($conn, $proposal_details_query);
                                while ($proposal_detail_row = mysqli_fetch_assoc($proposal_details_result)) : ?>
                                    <tr>
                                        <td><?php echo htmlspecialchars($proposal_detail_row['supervisor_firstname']); ?></td>
                                        <td><?php echo htmlspecialchars($proposal_detail_row['supervisor_lastname']); ?></td>
                                        <td><?php echo htmlspecialchars($proposal_detail_row['username']); ?></td>
                                        <td><?php echo htmlspecialchars($proposal_detail_row['firstname']); ?></td>
                                        <td><?php echo htmlspecialchars($proposal_detail_row['lastname']); ?></td>
                                        <td><?php echo htmlspecialchars($proposal_detail_row['area']); ?></td>
                                        <td><?php echo htmlspecialchars($proposal_detail_row['plant']); ?></td>
                                        <td><?php echo htmlspecialchars($proposal_detail_row['colony']); ?></td>
                                        <td><?php echo htmlspecialchars($proposal_detail_row['schedule']); ?></td>
                                        <td><?php echo htmlspecialchars($proposal_detail_row['proposal_date']); ?></td>
                                    </tr>
                                <?php endwhile; ?>
                            </tbody>
                        </table>
                        <br>
                        <form action="dashboard.php" method="POST">
                            <input type="hidden" name="delete_all_operators" value="<?php echo $proposal_date; ?>">
                            <button type="submit" name="delete_all_operators_btn" class="delete-all-btn">Eliminar Tabla Completa</button>
                            <button type="button" onclick="downloadExcel('<?php echo $tableId; ?>')">Descargar Detalles en Excel</button>
                        </form>
                 
                    </div>
                <?php endwhile; ?>
            <?php endif; ?>
        </div>
    </div>

    <script>
        document.querySelectorAll('.toggle-table').forEach(button => {
            button.addEventListener('click', () => {
                const tableContainer = button.nextElementSibling;
                if (tableContainer.style.display === 'none' || tableContainer.style.display === '') {
                    tableContainer.style.display = 'block';
                    button.textContent = button.textContent.replace('Mostrar', 'Ocultar');
                } else {
                    tableContainer.style.display = 'none';
                    button.textContent = button.textContent.replace('Ocultar', 'Mostrar');
                }
            });
        });

        document.querySelectorAll('.toggle-action-buttons').forEach(button => {
            button.addEventListener('click', () => {
                const actionButtons = button.previousElementSibling;
                if (actionButtons.style.display === 'none' || actionButtons.style.display === '') {
                    actionButtons.style.display = 'block';
                    button.textContent = 'Ocultar Acciones';
                } else {
                    actionButtons.style.display = 'none';
                    button.textContent = 'Mostrar Acciones';
                }
            });
        });

        function updateSchedule() {
            const startTime = document.getElementById('start_time').value;
            const endTime = document.getElementById('end_time').value;
            const scheduleInput = document.getElementById('schedule');
            scheduleInput.value = `${startTime}-${endTime}`;
        }

        document.getElementById('start_time').addEventListener('input', updateSchedule);
        document.getElementById('end_time').addEventListener('input', updateSchedule);
    </script>
</body>
</html>

