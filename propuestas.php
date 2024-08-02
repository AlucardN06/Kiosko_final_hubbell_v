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
    echo "<script>alert('Error de conexión: " . mysqli_connect_error() . "');window.location.href = 'dashboard.php';</script>";
    exit;
}

// Función para verificar si el usuario tiene autorización temporal
function hasTemporaryApproval($user_id, $conn) {
    $current_time = date('Y-m-d H:i:s');
    $query = "SELECT * FROM temporary_approvals WHERE user_id = '$user_id' AND expiration_time > '$current_time'";
    $result = mysqli_query($conn, $query);
    return ($result && mysqli_num_rows($result) > 0);
}

// Procesamiento del formulario de aprobación/rechazo por parte de los administradores
if (isset($_POST['approve_request']) || isset($_POST['reject_request'])) {
    $request_id = $_POST['request_id'];
    $admin_id = $_SESSION['user_id'];
    $proposal_date = $_POST['proposal_date'];
    $reason = isset($_POST['reject_reason']) ? $_POST['reject_reason'] : null;

    if (isset($_POST['approve_request'])) {
        $status = 'Aprobado';
    } elseif (isset($_POST['reject_request'])) {
        $status = 'Rechazado';
    }

    // Verificar si el usuario tiene autorización temporal
    $temporary_approval = hasTemporaryApproval($admin_id, $conn);

    if ($temporary_approval) {
        // Obtener los datos de autorización temporal
        $temp_approval_query = "SELECT * FROM temporary_approvals WHERE user_id = '$admin_id' AND expiration_time > NOW()";
        $temp_approval_result = mysqli_query($conn, $temp_approval_query);
        $temp_approval_row = mysqli_fetch_assoc($temp_approval_result);

        $original_user_id = $temp_approval_row['user_id'];
        $approve_user_id = $temp_approval_row['approve_user_id'];

        // Insertar la decisión en la tabla de aprobaciones con el ID del usuario original
        $insert_query = "INSERT INTO approvals (proposal_id, admin_id, action, reject_reason, proposal_date) VALUES ('$request_id', '$approve_user_id', '$status', '$reason', '$proposal_date')";
    } else {
        // Insertar la decisión en la tabla de aprobaciones
        $insert_query = "INSERT INTO approvals (proposal_id, admin_id, action, reject_reason, proposal_date) VALUES ('$request_id', '$admin_id', '$status', '$reason', '$proposal_date')";
    }

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
            echo "<script>alert('Error al insertar operador: " . mysqli_error($conn) . "');window.location.href = 'dashboard.php';</script>";
            exit;
        }
    } else {
        echo "<script>alert('Empleado no encontrado.');window.location.href = 'dashboard.php';</script>";
        exit;
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Propuestas de Tiempo Extra</title>
</head>
<body>
    <h2>Agregar Propuesta de Tiempo Extra</h2>
    <form method="post" action="">
        <label for="employee_username">Número de reloj:</label>
        <input type="text" id="employee_username" name="employee_username" required>
        
        <label for="proposal_date">Fecha de propuesta:</label>
        <input type="date" id="proposal_date" name="proposal_date" required>
        
        <label for="start_time">Hora de inicio:</label>
        <input type="time" id="start_time" name="start_time" required>
        
        <label for="end_time">Hora de fin:</label>
        <input type="time" id="end_time" name="end_time" required>
        
        <input type="submit" name="add_operator" value="Agregar Operador">
    </form>
    
    <h2>Propuestas de Tiempo Extra</h2>
    <table border="1">
        <tr>
            <th>Nombre del Empleado</th>
            <th>Área</th>
            <th>Planta</th>
            <th>Colonia</th>
            <th>Fecha de Propuesta</th>
            <th>Horario</th>
            <th>Acción</th>
        </tr>
        <?php
        // Obtener todas las propuestas de tiempo extra
        $proposals_query = "SELECT * FROM operators";
        $proposals_result = mysqli_query($conn, $proposals_query);

        while ($proposal_row = mysqli_fetch_assoc($proposals_result)) {
            echo "<tr>";
            echo "<td>" . $proposal_row['firstname'] . " " . $proposal_row['lastname'] . "</td>";
            echo "<td>" . $proposal_row['area'] . "</td>";
            echo "<td>" . $proposal_row['plant'] . "</td>";
            echo "<td>" . $proposal_row['colony'] . "</td>";
            echo "<td>" . $proposal_row['proposal_date'] . "</td>";
            echo "<td>" . $proposal_row['schedule'] . "</td>";
            echo "<td>";
            echo "<form method='post' action=''>";
            echo "<input type='hidden' name='request_id' value='" . $proposal_row['id'] . "'>";
            echo "<input type='hidden' name='proposal_date' value='" . $proposal_row['proposal_date'] . "'>";
            echo "<input type='submit' name='approve_request' value='Aprobar'>";
            echo "<input type='submit' name='reject_request' value='Rechazar'>";
            echo "<label for='reject_reason'>Motivo del rechazo:</label>";
            echo "<input type='text' id='reject_reason' name='reject_reason'>";
            echo "</form>";
            echo "</td>";
            echo "</tr>";
        }
        ?>
    </table>
</body>
</html>
<?php
mysqli_close($conn);
?>
