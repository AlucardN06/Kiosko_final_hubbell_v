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
    // Verificar si el usuario ya ha tomado una decisión para una propuesta
function hasUserDecided($user_id, $proposal_id, $conn) {
    $query = "SELECT * FROM approvals WHERE admin_id = ? AND proposal_id = ?";
    $stmt = mysqli_prepare($conn, $query);
    mysqli_stmt_bind_param($stmt, "ss", $user_id, $proposal_id);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);

    return ($result && mysqli_num_rows($result) > 0);
}

// Verificar si ya hay dos decisiones para una propuesta
function hasTwoDecisions($proposal_id, $conn) {
    $query = "SELECT COUNT(*) AS count FROM approvals WHERE proposal_id = ?";
    $stmt = mysqli_prepare($conn, $query);
    mysqli_stmt_bind_param($stmt, "s", $proposal_id);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    $row = mysqli_fetch_assoc($result);

    return ($row['count'] >= 2);
}
// Obtener información del usuario logueado
$query = "SELECT id, username, position FROM users WHERE id = ?";
$stmt = $conn->prepare($query);
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();
$user = $result->fetch_assoc();

if (!$user) {
    echo "<script>alert('Usuario no encontrado.');window.location.href = 'dashboard.php';</script>";
    exit;
}
   // Verificar si hay aprobación temporal
function hasTemporaryApproval($approve_user_id, $conn) {
    $current_time = date('Y-m-d H:i:s');
    $query = "SELECT * FROM temporary_approvals WHERE approve_user_id = ? AND expiration_time > ?";
    $stmt = mysqli_prepare($conn, $query);
    mysqli_stmt_bind_param($stmt, "ss", $approve_user_id, $current_time);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);

    return ($result && mysqli_num_rows($result) > 0);
}

// Inicializar $allsup
$allsup = ['548','98382', '88114'];


// Verificar permisos
$perm = false;
$has_temporary_approval = hasTemporaryApproval($user_id, $conn);
$requests_result = null;

if (in_array($user['username'],$allsup) || $has_temporary_approval) {
    $perm = true;
    $query = "SELECT proposal_date, supervisor_id FROM operators GROUP BY proposal_date, supervisor_id";
    $requests_result = mysqli_query($conn, $query);
} elseif ($user['position'] == 'B') {
    $supervisor_id = $user['id'];
    // Obtener propuestas hechas por empleados supervisados por el supervisor actual
    $query = "SELECT supervisor_reloj_number, proposal_date, supervisor_id 
              FROM operators 
              WHERE supervisor_id = '$supervisor_id' 
                OR supervisor_id IN (SELECT id FROM users WHERE supervisor_reloj_number = '".$user['username']."') 
              GROUP BY proposal_date, supervisor_id";
    $requests_result = mysqli_query($conn, $query);
} else {
    $perm = false;
}


// Procesamiento del formulario para agregar operadores
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['add_operator'])) {
    if (isset($_POST['employee_usernames']) && isset($_POST['start_time']) && isset($_POST['end_time']) && isset($_POST['extra_time_reason']) && isset($_POST['proposal_date'])) {
        $employee_usernames = $_POST['employee_usernames'];
        $start_time = $_POST['start_time'];
        $end_time = $_POST['end_time'];
        $extra_time_reason = $_POST['extra_time_reason'];
        $proposal_date = $_POST['proposal_date'];
        $supervisor_id = $_SESSION['user_id'];

        // Calcular el horario
        $schedule = $start_time . '-' . $end_time;

        // Obtener información del supervisor
        $query = "SELECT username, firstname, lastname, position FROM users WHERE id = ?";
        $stmt = $conn->prepare($query);
        $stmt->bind_param("i", $supervisor_id);
        $stmt->execute();
        $supervisor_result = $stmt->get_result();
        $supervisor = $supervisor_result->fetch_assoc();

        $supervisor_username = $supervisor['username'];
        $supervisor_firstname = $supervisor['firstname'];
        $supervisor_lastname = $supervisor['lastname'];
        $supervisor_position = $supervisor['position'];

        // Verificar permisos
        $perm = false;
        $temp_approved_in_allsup = hasTemporaryApproval($supervisor_id, $conn);

        if (isset($allsup) && is_array($allsup) && (in_array($supervisor_username, $allsup) || $temp_approved_in_allsup)) {
            $perm = true;
        } elseif ($supervisor_position == 'B') {
            $supervisor_id = $user['id'];
            $query = "SELECT supervisor_reloj_number, proposal_date, supervisor_id 
                      FROM operators 
                      WHERE supervisor_id = '$supervisor_id' 
                        OR supervisor_id IN (SELECT id FROM users WHERE supervisor_reloj_number = '".$supervisor_username."') 
                      GROUP BY proposal_date, supervisor_id";
            $requests_result = mysqli_query($conn, $query);
        } else {
            $perm = false;
        }

     

      // Preparar la inserción en la tabla operators
      $stmt = $conn->prepare("INSERT INTO operators (supervisor_reloj_number, employee_id, supervisor_id, supervisor_firstname, supervisor_lastname, username, firstname, lastname, area, plant, colony, department, proposal_date, schedule, start_time, end_time, extra_time_reason) 
      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
      
foreach ($employee_usernames as $employee_username) {
    // Obtener información del empleado
    $query = "SELECT id, firstname, lastname, area, plant, colony, deparment, supervisor_reloj_number FROM users WHERE username = ?";
    $stmt_employee = $conn->prepare($query);
    $stmt_employee->bind_param("s", $employee_username);
    $stmt_employee->execute();
    $employee_result = $stmt_employee->get_result();
    $employee = $employee_result->fetch_assoc();

    if ($employee) {
        $employee_id = $employee['id'];
        $employee_firstname = $employee['firstname'];
        $employee_lastname = $employee['lastname'];
        $employee_area = $employee['area'];
        $employee_plant = $employee['plant'];
        $employee_colony = $employee['colony'];
        $employee_department = $employee['deparment'];
        $assigned_supervisor_reloj_number = $employee['supervisor_reloj_number'];

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

                // Verificar si hay aprobación temporal
                $has_temporary_approval = hasTemporaryApproval($supervisor_id, $conn);

                if ($has_temporary_approval) {
                    $query_temp_approval = "SELECT username FROM temporary_approvals WHERE approve_user_id = '$supervisor_id'";
                    $result_temp_approval = mysqli_query($conn, $query_temp_approval);

                    if ($result_temp_approval && mysqli_num_rows($result_temp_approval) > 0) {
                        $row = mysqli_fetch_assoc($result_temp_approval);
                        $temp_approved_username = trim($row['username']);

                        if ($temp_approved_username !== $assigned_supervisor_reloj_number) {
                            echo "<script>alert('No puedes insertar a este empleado. No eres el supervisor asignado (temporal).');window.location.href = 'dashboard.php';</script>";
                            exit;
                        }
                    } else {
                        echo "<script>alert('Error al obtener la aprobación temporal.');window.location.href = 'dashboard.php';</script>";
                        exit;
                    }
                } else {
                    if ($supervisor_username !== $assigned_supervisor_reloj_number) {
                        echo "<script>alert('No puedes insertar a este empleado. No eres el supervisor asignado.');window.location.href = 'dashboard.php';</script>";
                        exit;
                    }
                }

                $stmt->bind_param("siissssssssssssss", 
                $supervisor_username, $employee_id, $supervisor_id, 
                $supervisor_firstname, $supervisor_lastname, 
                $employee_username, $employee_firstname, $employee_lastname, 
                $employee_area, $employee_plant, $employee_colony, $employee_department, 
                $proposal_date, $schedule, $start_time, $end_time, $extra_time_reason
            );
            

                if (!$stmt->execute()) {
                    echo "<script>alert('Error al insertar empleado: " . $stmt->error . "');window.location.href = 'dashboard.php';</script>";
                    exit;
                }
            } else {
                echo "<script>alert('Empleado no encontrado: " . $employee_username . "');window.location.href = 'dashboard.php';</script>";
                exit;
            }
        }

        echo "<script>alert('Empleados agregados con éxito.');window.location.href = 'dashboard.php';</script>";
        exit;
    } else {
        echo "<script>alert('Por favor, completa todos los campos requeridos.');window.location.href = 'dashboard.php';</script>";
        exit;
    }
}

    
// Verificar si alguno de los aprobadores iniciales ha aprobado
    function hasInitialApproverApproved($request_id, $conn) {
        $initial_approvers = [98382, 88114];
        $query = "SELECT COUNT(*) AS approval_count FROM approvals WHERE proposal_id = '$request_id' AND admin_id IN (" . implode(",", $initial_approvers) . ") AND action = 'Aprobado'";
        $result = mysqli_query($conn, $query);
        $row = mysqli_fetch_assoc($result);
        return $row['approval_count'] > 0;
    }
    
// Procesamiento del formulario de aprobación/rechazo por parte de los administradores
if (isset($_POST['approve_request']) || isset($_POST['reject_request'])) {
    $request_id = $_POST['request_id'];
    $admin_id = $_SESSION['username'];
    $proposal_date = $_POST['proposal_date'];

    // Verificar si es el usuario 548 y si alguno de los aprobadores iniciales ha aprobado
    if ($admin_id == 548 && !hasInitialApproverApproved($request_id, $conn)|| $has_temporary_approval && !hasInitialApproverApproved($request_id, $conn)) {
        echo "<script>alert('No puedes aprobar esta propuesta hasta que uno de los aprobadores iniciales (98382 o 88114) haya aprobado.');window.location.href = 'dashboard.php';</script>";
        exit;
    }

    // Determinar el estado basado en la acción del formulario
    $status = isset($_POST['approve_request']) ? 'Aprobado' : 'Rechazado';
    $reason = isset($_POST['reject_reason']) ? $_POST['reject_reason'] : null;

    // Verificar si ya se ha tomado una decisión para esta propuesta por este administrador
    $check_query = "SELECT * FROM approvals WHERE proposal_id = '$request_id' AND admin_id = '$admin_id'";
    $check_result = mysqli_query($conn, $check_query);

    if ($check_result && mysqli_num_rows($check_result) > 0) {
        $user_action_row = mysqli_fetch_assoc($check_result);
        echo "<script>alert('Ya has " . ($user_action_row['action'] == 'Aprobado' ? 'aprobado' : 'rechazado') . " esta propuesta. No puedes realizar modificaciones.');window.location.href = 'dashboard.php';</script>";
        exit;
    }

    // Consulta para contar el número de aprobaciones y rechazos
    $count_query = "SELECT COUNT(*) AS action_count FROM approvals WHERE proposal_id = '$request_id'";
    $count_result = mysqli_query($conn, $count_query);
    $count_row = mysqli_fetch_assoc($count_result);

    // Verificar si ya hay dos acciones (aprobaciones o rechazos)
    if ($count_row['action_count'] >= 2) {
        echo "<script>alert('Ya se han registrado dos acciones (aprobación/rechazo) para esta propuesta.');window.location.href = 'dashboard.php';</script>";
        exit;
    }

    // Insertar la decisión en la tabla de aprobaciones
    $insert_query = "INSERT INTO approvals (proposal_id, admin_id, action, reject_reason, proposal_date) VALUES ('$request_id', '$admin_id', '$status', '$reason', '$proposal_date')";
    $insert_result = mysqli_query($conn, $insert_query);

    if (!$insert_result) {
        echo "<script>alert('Error al insertar la aprobación/rechazo: " . mysqli_error($conn) . "');window.location.href = 'dashboard.php';</script>";
        exit;
    }

    // Verificar si al menos 2 administradores han aprobado la propuesta
    $count_approval_query = "SELECT COUNT(*) AS approval_count FROM approvals WHERE proposal_id = '$request_id' AND action = 'Aprobado'";
    $count_approval_result = mysqli_query($conn, $count_approval_query);
    $count_approval_row = mysqli_fetch_assoc($count_approval_result);


    // Verificar si la propuesta ha sido rechazada por algún administrador
    $reject_query = "SELECT COUNT(*) AS reject_count FROM approvals WHERE proposal_id = '$request_id' AND action = 'Rechazado'";
    $reject_result = mysqli_query($conn, $reject_query);
    $reject_row = mysqli_fetch_assoc($reject_result);


    // Redirigir al dashboard después de la acción
    echo "<script>window.location.href = 'dashboard.php';</script>";
    exit;
}
// Modificación para obtener automáticamente supervisor_reloj_number del usuario logueado
$user = null;
$query = "SELECT id, username, position, supervisor_reloj_number FROM users WHERE id = '$user_id'";
$result = mysqli_query($conn, $query);

if ($result && mysqli_num_rows($result) > 0) {
    $user = mysqli_fetch_assoc($result);
} else {
    die("Error al obtener datos del usuario");
}

$supervisor_reloj_number = $user['supervisor_reloj_number']; // Obtenemos el supervisor_reloj_number del usuario

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
    $current_date = date('Y-m-d H:i:s', strtotime('+3 hours'));
    if ($proposal_date <= $current_date) {
        echo "<script>alert('La fecha de la propuesta debe ser una fecha futura.');window.location.href = 'dashboard.php';</script>";
        exit;
    }

    // Obtener información del supervisor actual
    $current_supervisor_query = "SELECT username, firstname, lastname, supervisor_reloj_number FROM users WHERE id = '$supervisor_id'";
    $current_supervisor_result = mysqli_query($conn, $current_supervisor_query);
    
    if ($current_supervisor_result && mysqli_num_rows($current_supervisor_result) > 0) {
        $current_supervisor_row = mysqli_fetch_assoc($current_supervisor_result);
        $current_supervisor_username = $current_supervisor_row['username'];
        $supervisor_firstname = $current_supervisor_row['firstname'];
        $supervisor_lastname = $current_supervisor_row['lastname'];
        $supervisor_number = trim($current_supervisor_row['supervisor_reloj_number']);
    } else {
        echo "<script>alert('Error al obtener la información del supervisor actual.');window.location.href = 'dashboard.php';</script>";
        exit;
    }

    // Obtener información del empleado usando el username (número de reloj)
    $employee_query = "SELECT id, firstname, lastname, area, plant, colony, username, supervisor_reloj_number, deparment FROM users WHERE username = '$employee_username'";
    $employee_result = mysqli_query($conn, $employee_query);

    foreach ($employee_usernames as $employee_username) {
        // Obtener información del empleado usando el username (número de reloj)
        $employee_query = "SELECT id, firstname, lastname, area, plant, colony, username, supervisor_reloj_number, deparment FROM users WHERE username = '$employee_username'";
        $employee_result = mysqli_query($conn, $employee_query);

        if ($employee_result && mysqli_num_rows($employee_result) > 0) {
            $employee_row = mysqli_fetch_assoc($employee_result);
            $employee_id = $employee_row['id'];
            $employee_firstname = $employee_row['firstname'];
            $employee_lastname = $employee_row['lastname'];
            $employee_area = $employee_row['area'];
            $employee_deparment = $employee_row['deparment'];
            $employee_plant = $employee_row['plant'];
            $employee_colony = $employee_row['colony'];
            $employee_username = $employee_row['username'];
            $assigned_supervisor_reloj_number = trim($employee_row['supervisor_reloj_number']);


        // Llama a la función hasTemporaryApproval para obtener el resultado booleano
        $has_temporary_approval = hasTemporaryApproval($supervisor_id, $conn);

        if ($has_temporary_approval) {
            // Consulta para obtener el username de la tabla temporary_approval
            $query_temp_approval = "SELECT username FROM temporary_approvals WHERE approve_user_id = '$supervisor_id'";
            $result_temp_approval = mysqli_query($conn, $query_temp_approval);

            if ($result_temp_approval && mysqli_num_rows($result_temp_approval) > 0) {
                $row = mysqli_fetch_assoc($result_temp_approval);
                $temp_approved_username = trim($row['username']);

                // Verificar si el username aprobado temporalmente coincide con el supervisor asignado
                if ($temp_approved_username !== $assigned_supervisor_reloj_number) {
                    echo "<script>alert('No puedes insertar a este empleado. No eres el supervisor asignado (temporal).');window.location.href = 'dashboard.php';</script>";
                    exit;
                }
            } else {
                echo "<script>alert('Error al obtener la aprobación temporal.');window.location.href = 'dashboard.php';</script>";
                exit;
            }
        } else {
            // Verificar si el supervisor actual es el supervisor asignado al empleado solo si no hay aprobación temporal
            if ($current_supervisor_username !== $assigned_supervisor_reloj_number) {
                echo "<script>alert('No puedes insertar a este empleado. No eres el supervisor asignado.');window.location.href = 'dashboard.php';</script>";
                exit;
            }
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
      $insert_operator_query = "INSERT INTO operators (supervisor_reloj_number, employee_id, supervisor_id, supervisor_firstname, supervisor_lastname, username, firstname, lastname, area, plant, colony, proposal_date, schedule, start_time, end_time, extra_time_reason) 
      VALUES ('$supervisor_reloj_number', '$employee_id', '$supervisor_id', '$supervisor_firstname', '$supervisor_lastname', '$employee_username', '$employee_firstname', '$employee_lastname', '$employee_area', '$employee_plant', '$employee_colony', '$proposal_date', '$schedule', '$start_time', '$end_time', '$extra_time_reason')";
$insert_operator_result = mysqli_query($conn, $insert_operator_query);

if (!$insert_operator_result) {
echo "<script>alert('Error al insertar el empleado: " . mysqli_error($conn) . "');window.location.href = 'dashboard.php';</script>";
exit;
}
        } else {
            echo "<script>alert('No se encontró un empleado con el número de reloj proporcionado.');window.location.href = 'dashboard.php';</script>";
            exit;
        }
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
            echo "<script>alert('Error al eliminar el empleado: " . mysqli_error($conn) . "');window.location.href = 'dashboard.php';</script>";
            exit;
        }
    }

// Procesamiento de la solicitud para eliminar toda la tabla de operadores para una fecha específica
if (isset($_POST['delete_all_operators_btn'])) {
    $proposal_date = $_POST['delete_all_operators'];

    // Iniciar una transacción
    mysqli_begin_transaction($conn);

    try {
        // Eliminar todos los operadores asociados con la fecha especificada
        $delete_operators_query = "DELETE FROM operators WHERE proposal_date = '$proposal_date'";
        $delete_operators_result = mysqli_query($conn, $delete_operators_query);

        if (!$delete_operators_result) {
            throw new Exception('Error al eliminar la tabla de operadores: ' . mysqli_error($conn));
        }

        // Eliminar todos los registros de approve asociados con la fecha especificada
        $delete_approve_query = "DELETE FROM approvals WHERE proposal_date LIKE '$proposal_date%'";
        $delete_approve_result = mysqli_query($conn, $delete_approve_query);

        if (!$delete_approve_result) {
            throw new Exception('Error al eliminar la tabla de aprobaciones: ' . mysqli_error($conn));
        }

        // Confirmar transacción
        mysqli_commit($conn);

        echo "<script>alert('Tabla de empleados y aprobaciones asociadas eliminadas correctamente.');window.location.href = 'dashboard.php';</script>";
    } catch (Exception $e) {
        // Revertir transacción en caso de error
        mysqli_rollback($conn);
        echo "<script>alert('{$e->getMessage()}');window.location.href = 'dashboard.php';</script>";
    }
}

    // Obtener información del usuario si está en sesión
    $user = null;
    if (isset($_SESSION['user_id'])) {
        $user_id = $_SESSION['user_id'];
        $query = "SELECT firstname, lastname,username, position,username, area, plant FROM users WHERE id = '$user_id'";
        $result = mysqli_query($conn, $query);

        if ($result && mysqli_num_rows($result) > 0) {
            $user = mysqli_fetch_assoc($result);
        } else {
            die("Error al obtener datos del usuario");
        }
    }


    // Consulta las propuestas de tiempo extra creadas por el supervisor
    $supervisor_proposals_result = null;
    if ($user && $user['position'] == 'B'||$user && $user['position'] =='AB'||$has_temporary_approval) {
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
        <title>Tiempo Extra</title>
        
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
                const toggleableButtons = button.previousElementSibling.querySelector('.toggleable-buttons');
        if (toggleableButtons.style.display === 'none' || toggleableButtons.style.display === '') {
            toggleableButtons.style.display = 'block';
            button.textContent = 'Ocultar Acciones';
        } else {
            toggleableButtons.style.display = 'none';
            button.textContent = 'Mostrar Acciones';
        }
    }
    document.addEventListener('DOMContentLoaded', (event) => {
            let select = document.querySelector('.custom-select .select-selected');
            let items = document.querySelector('.custom-select .select-items');

            select.addEventListener('click', () => {
                items.style.display = items.style.display === 'block' ? 'none' : 'block';
            });

            document.addEventListener('click', (e) => {
                if (!e.target.matches('.custom-select, .custom-select *')) {
                    items.style.display = 'none';
                }
            });
        });
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
                /* Estilo para la lista desplegable con casillas de verificación */
        .custom-select {
            position: relative;
            display: inline-block;
        }
        
        .select-items {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
        }
        
        .select-items div {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }
        
        .select-items div:hover {
            background-color: #00000;
        }
        
        .select-selected {
            background-color: #000000;
            color: white;
            padding: 12px 16px;
            border: none;
            cursor: pointer;
        }
        .right-section {
    position: relative; /* Asegura que el botón se posicione relativo a esta sección */
    padding: 20px; /* Ajusta el espaciado si es necesario */
}

.back-button {
    position: absolute;
    top: 10px;
    left: 10px; /* Mantiene el botón en la parte superior izquierda de la sección */
    background-color: #000; /* Fondo negro */
    color: white; /* Letras blancas */
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
    display: flex;
    align-items: center;
    transition: background-color 0.3s, color 0.3s; /* Añadido para animar el cambio de color */
}

.back-button i {
    margin-right: 8px;
}

.back-button:hover {
    background-color: #f4d900; /* Fondo amarillo al pasar el cursor */
    color: black; /* Letras negras al pasar el cursor */
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

                    

                    <p id="datetime"></p>
                    <div class="user-buttons">
                        <form>
                            <button type="button" onclick="location.href='laborales.php'" class="user-button">
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
            <button class="back-button" onclick="location.href='laborales.php'">
                <i class="fas fa-arrow-left"></i> Regresar
            </button>
            <br>
            <br>
        
                <?php if ($user && $user['position'] == 'AB'|| $has_temporary_approval==1) : ?>
                    <h3>Agregar Empleado</h3>
                    <form action="dashboard.php" method="POST" class="add-operator-form">
    <label for="employee_usernames">Número de Reloj del Empleado:</label>
    <div class="custom-select">
        <div class="select-selected">Seleccionar Empleados</div>
        <div class="select-items">
            <?php
            $supervisor_id = $_SESSION['user_id'];

            // Verificar si el usuario tiene permiso temporal
            $temp_approval_query = "SELECT username FROM temporary_approvals WHERE approve_user_id = '$supervisor_id'";
            $temp_approval_result = mysqli_query($conn, $temp_approval_query);

            if (mysqli_num_rows($temp_approval_result) > 0) {
                // Si el usuario tiene permiso temporal, obtener los usernames de temporary_approvals
                $temp_approval_row = mysqli_fetch_assoc($temp_approval_result);
                $username = $temp_approval_row['username'];

                $query = "SELECT id, firstname,lastname,username FROM users WHERE supervisor_reloj_number = '$username'";
            } else {
                // Si no tiene permiso temporal, obtener los empleados supervisados por el usuario logueado
                $username= $user['username'];
                $query = "SELECT id, firstname, lastname,username FROM users WHERE supervisor_reloj_number = '$username'";
            }

            $result = mysqli_query($conn, $query);

            while ($row = mysqli_fetch_assoc($result)) { 
                echo "<div><input type='checkbox' name='employee_usernames[]' value='{$row['username']}'> {$row['firstname']} {$row['lastname']}</div>";
            }
            ?>
        </div>
    </div>
    <label>Horario de Entrada:</label>
    <input type="time" id="start_time" name="start_time" required>
    <label>Horario de Salida:</label>
    <input type="time" id="end_time" name="end_time" required>
    <label for="extra_time_reason">Motivo del Tiempo Extra:</label>
    <input type="text" id="extra_time_reason" name="extra_time_reason" required>
    <label for="proposal_date">Fecha de Propuesta:</label>
    <input type="date" id="proposal_date" name="proposal_date" required>
    <button type="submit" name="add_operator">Agregar Empleado</button>
</form>


            <?php endif ?> 
            <?php if ($perm && $user['position'] !== 'B' && $user['position'] !== 'D') : ?>
    <h3>Propuestas de Tiempo Extra para aprobar</h3>
    <?php
    // Filtrar las propuestas según el usuario logueado
    $departmentCondition = '';
    switch ($username) {
        case 88114:
            $departmentCondition = " AND users.deparment = 'HES'";
            break;
        case 98382:
            $departmentCondition = " AND users.deparment = 'HUS'";
            break;
        case 1111110:
            $departmentCondition = " AND users.deparment = 'HUS II'";
            break;
        case 548:
            $departmentCondition = ''; // Puede ver todas las propuestas
            break;
        default:
            $departmentCondition = ''; // Otros usuarios, se puede ajustar si es necesario
    }

    // Obtener suplentes válidos
    $temp_approvals_query = "SELECT user_id FROM temporary_approvals WHERE approve_user_id = '$username' AND expiration_time > NOW()";
    $temp_approvals_result = mysqli_query($conn, $temp_approvals_query);

    if (!$temp_approvals_result) {
        echo "Error al obtener suplentes: " . mysqli_error($conn);
    }

    $temp_users = [];
    while ($row = mysqli_fetch_assoc($temp_approvals_result)) {
        $temp_users[] = $row['user_id'];
    }

    // Construir lista de suplentes si existe
    $temp_users_condition = '';
    if (!empty($temp_users)) {
        $temp_users_list = implode(",", $temp_users);
        $temp_users_condition = "OR approvals.admin_id IN ($temp_users_list)";
    }

    $pending_query = "SELECT operators.*, users.supervisor_name
    FROM operators 
    INNER JOIN users ON operators.supervisor_id = users.id 
    LEFT JOIN approvals ON CONCAT(operators.proposal_date, '-', operators.supervisor_id) = approvals.proposal_id
    WHERE (approvals.proposal_id IS NULL 
    OR (SELECT COUNT(*) FROM approvals WHERE CONCAT(operators.proposal_date, '-', operators.supervisor_id) = proposal_id 
        AND (approvals.action = 'Aprobado' OR approvals.action = 'Rechazado') 
        AND approvals.admin_id = '$username') = 0)
    $departmentCondition";

$pending_result = mysqli_query($conn, $pending_query);

if (!$pending_result) {
echo "Error en la consulta de propuestas pendientes: " . mysqli_error($conn);
}

$approved_rejected_query = "SELECT operators.*, users.supervisor_name, 
                                   CASE 
                                       WHEN approvals.action = 'Aprobado' THEN 'Aprobado'
                                       WHEN approvals.action = 'Rechazado' THEN 'Rechazado'
                                       ELSE 'Pendiente' 
                                   END AS action
                            FROM operators 
                            INNER JOIN users ON operators.supervisor_id = users.id 
                            INNER JOIN approvals ON CONCAT(operators.proposal_date, '-', operators.supervisor_id) = approvals.proposal_id
                            WHERE approvals.admin_id = '$username'
                            $departmentCondition
                            GROUP BY operators.proposal_date, operators.supervisor_id, operators.username";
$approved_rejected_result = mysqli_query($conn, $approved_rejected_query);

    ?>

    <?php if ($pending_result && mysqli_num_rows($pending_result) > 0) : ?>
        <?php 
        $proposals = [];
        while ($row = mysqli_fetch_assoc($pending_result)) {
            $proposals[$row['proposal_date']][$row['supervisor_id']][] = $row;
        } 
        ?>
        <?php foreach ($proposals as $date => $supervisors) : ?>
            <?php foreach ($supervisors as $supervisor_id => $details) : ?>
                <?php
                $tableId = 'proposal-table-' . $date . '-' . $supervisor_id;
                $containerId = 'table-container-' . $date . '-' . $supervisor_id;
                ?>
                <?php if ($perm) : ?>
                    <button onclick="toggleVisibility('<?php echo $containerId; ?>', this)">Mostrar Propuestas del <?php echo htmlspecialchars($date); ?> - Supervisor <?php echo htmlspecialchars(getSupervisorName($supervisor_id, $conn)); ?></button>
                    <div id="<?php echo $containerId; ?>" class="table-container">
                        <table id="<?php echo $tableId; ?>" class="proposal-table">
                            <thead>
                                <tr>
                                    <th>Nombre del Supervisor</th>
                                    <th>Apellido del Supervisor</th>
                                    <th>Número de reloj del empleado</th>
                                    <th>Nombre</th>
                                    <th>Apellido</th>
                                    <th>Puesto</th>
                                    <th>Area</th>
                                    <th>Planta</th>
                                    <th>Colonia</th>
                                    <th>Horario</th>
                                    <th>Fecha</th>
                                    <th>Motivo del Tiempo extra</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($details as $detail_row) : ?>
                                    <tr>
                                        <td><?php echo htmlspecialchars($detail_row['supervisor_firstname']); ?></td>
                                        <td><?php echo htmlspecialchars($detail_row['supervisor_lastname']); ?></td>
                                        <td><?php echo htmlspecialchars($detail_row['username']); ?></td>
                                        <td><?php echo htmlspecialchars($detail_row['firstname']); ?></td>
                                        <td><?php echo htmlspecialchars($detail_row['lastname']); ?></td>
                                        <td><?php echo htmlspecialchars($detail_row['area']); ?></td>
                                        <td><?php echo htmlspecialchars($detail_row['department']); ?></td>
                                        <td><?php echo htmlspecialchars($detail_row['plant']); ?></td>
                                        <td><?php echo htmlspecialchars($detail_row['colony']); ?></td>
                                        <td><?php echo htmlspecialchars($detail_row['schedule']); ?></td>
                                        <td><?php echo htmlspecialchars($detail_row['proposal_date']); ?></td>
                                        <td><?php echo htmlspecialchars($detail_row['extra_time_reason']); ?></td>
                                    </tr>
                                <?php endforeach; ?>
                            </tbody>
                        </table>
                        <br>
                 
                        <div class="action-buttons">
                            <form action="dashboard.php" method="POST">
                                <input type="hidden" name="request_id" value="<?php echo htmlspecialchars($date . '-' . $supervisor_id); ?>">
                                <input type="hidden" name="proposal_date" value="<?php echo htmlspecialchars($date); ?>">
                                <div class="toggleable-buttons" style="display:none;">
                                    <button type="submit" name="approve_request" class="approve-btn" onclick="return confirm('¿Estás seguro de aprobar esta propuesta?')">Aprobar</button>
                                    <button type="submit" name="reject_request" class="reject-btn" onclick="return confirm('¿Estás seguro de rechazar esta propuesta?')">Rechazar</button>
                                    <textarea name="reject_reason" id="reject_reason" placeholder="Motivo de rechazo" class="reject-reason"></textarea>
                                </div>
                            </form>
                            <button type="button" onclick="toggleActionButtons(this)">Mostrar/Ocultar Acciones</button>
                        </div>
                    </div>
                <?php endif; ?>
            <?php endforeach; ?>
        <?php endforeach; ?>
    <?php else : ?>
        <p>No hay propuestas de tiempo extra pendientes.</p>
    <?php endif; ?>

   <h3>Propuestas de Tiempo Extra Aprobadas/Rechazadas</h3>
<?php if ($approved_rejected_result && mysqli_num_rows($approved_rejected_result) > 0) : ?>
    <?php 
    $approved_proposals = [];
    while ($row = mysqli_fetch_assoc($approved_rejected_result)) {
        $approved_proposals[$row['proposal_date']][$row['supervisor_id']][] = $row;
    } 
    ?>
    <?php foreach ($approved_proposals as $date => $supervisors) : ?>
        <?php foreach ($supervisors as $supervisor_id => $details) : ?>
            <?php
            $tableId = 'approved-proposal-table-' . $date . '-' . $supervisor_id;
            $containerId = 'approved-table-container-' . $date . '-' . $supervisor_id;
            $isRejected = false;

            // Verificar si alguna de las propuestas es rechazada
            foreach ($details as $detail_row) {
                if ($detail_row['action'] === 'Rechazado') {
                    $isRejected = true;
                    break;
                }
            }
            ?>
            <button onclick="toggleVisibility('<?php echo $containerId; ?>', this)">Mostrar Propuestas del <?php echo htmlspecialchars($date); ?> - Supervisor <?php echo htmlspecialchars(getSupervisorName($supervisor_id, $conn)); ?> (Aprobadas/Rechazadas)</button>
            <div id="<?php echo $containerId; ?>" class="table-container">
                <table id="<?php echo $tableId; ?>" class="proposal-table">
                    <thead>
                        <tr>
                            <th>Nombre del Supervisor</th>
                            <th>Apellido del Supervisor</th>
                            <th>Número de reloj del empleado</th>
                            <th>Nombre</th>
                            <th>Apellido</th>
                            <th>Puesto</th>
                            <th>Area</th>
                            <th>Planta</th>
                            <th>Colonia</th>
                            <th>Horario</th>
                            <th>Fecha</th>
                            <th>Motivo del Tiempo extra</th>
                            <th>Estado</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($details as $detail_row) : ?>
                            <tr>
                                <td><?php echo htmlspecialchars($detail_row['supervisor_firstname']); ?></td>
                                <td><?php echo htmlspecialchars($detail_row['supervisor_lastname']); ?></td>
                                <td><?php echo htmlspecialchars($detail_row['username']); ?></td>
                                <td><?php echo htmlspecialchars($detail_row['firstname']); ?></td>
                                <td><?php echo htmlspecialchars($detail_row['lastname']); ?></td>
                                <td><?php echo htmlspecialchars($detail_row['area']); ?></td>
                                <td><?php echo htmlspecialchars($detail_row['department']); ?></td>
                                <td><?php echo htmlspecialchars($detail_row['plant']); ?></td>
                                <td><?php echo htmlspecialchars($detail_row['colony']); ?></td>
                                <td><?php echo htmlspecialchars($detail_row['schedule']); ?></td>
                                <td><?php echo htmlspecialchars($detail_row['proposal_date']); ?></td>
                                <td><?php echo htmlspecialchars($detail_row['extra_time_reason']); ?></td>
                                <td><?php echo htmlspecialchars($detail_row['action']); ?></td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
                <br>
                <form action="dashboard.php" method="POST">
                    <input type="hidden" name="delete_all_operators" value="<?php echo $date; ?>">
                    <button type="button" onclick="downloadExcel('<?php echo $tableId; ?>')">Descargar Detalles en Excel</button>
                    <?php if ($isRejected) : ?>
                        <button type="submit" name="delete_all_operators_btn" class="delete-btn" onclick="return confirm('¿Estás seguro de que deseas borrar esta tabla?')">Borrar Tabla</button>
                    <?php endif; ?>
                </form>
            </div>
        <?php endforeach; ?>
    <?php endforeach; ?>
<?php else : ?>
    <p>No hay propuestas de tiempo extra aprobadas o rechazadas.</p>
<?php endif; ?>

<?php endif; ?>


                <?php if ($user && $user['position'] == 'B') : ?>
                    <h3>Agregar Empleado</h3>
                    <form action="dashboard.php" method="POST" class="add-operator-form">
    <label for="employee_usernames">Número de Reloj del Empleado:</label>
    <div class="custom-select">
        <div class="select-selected">Seleccionar Empleados</div>
        <div class="select-items">
            <?php
            $supervisor_id = $_SESSION['user_id'];

            // Verificar si el usuario tiene permiso temporal
            $temp_approval_query = "SELECT username FROM temporary_approvals WHERE approve_user_id = '$supervisor_id'";
            $temp_approval_result = mysqli_query($conn, $temp_approval_query);

            if (mysqli_num_rows($temp_approval_result) > 0) {
                // Si el usuario tiene permiso temporal, obtener los usernames de temporary_approvals
                $temp_approval_row = mysqli_fetch_assoc($temp_approval_result);
                $username = $temp_approval_row['username'];

                $query = "SELECT id, username,firstname,lastname FROM users WHERE supervisor_reloj_number = '$username'";
            } else {
                // Si no tiene permiso temporal, obtener los empleados supervisados por el usuario logueado
                $username= $user['username'];
                $query = "SELECT id, username, firstname, lastname FROM users WHERE supervisor_reloj_number = '$username'";
            }

            $result = mysqli_query($conn, $query);

            while ($row = mysqli_fetch_assoc($result)) {
                echo "<div><input type='checkbox' name='employee_usernames[]' value='{$row['username']}'> {$row['firstname']} {$row['lastname']}</div>";
            }
            ?>
        </div>
    </div>
    <label>Horario de Entrada:</label>
    <input type="time" id="start_time" name="start_time" required>
    <label>Horario de Salida:</label>
    <input type="time" id="end_time" name="end_time" required>
    <label for="extra_time_reason">Motivo del Tiempo Extra:</label>
    <input type="text" id="extra_time_reason" name="extra_time_reason" required>
    <label for="proposal_date">Fecha de Propuesta:</label>
    <input type="date" id="proposal_date" name="proposal_date" required>
    <button type="submit" name="add_operator">Agregar Empleado</button>
</form>
                <?php endif; ?>
                <?php if ($supervisor_proposals_result && mysqli_num_rows($supervisor_proposals_result) > 0) : ?>
                    <?php if ($user && $user['position'] == 'AB'||$user && $user['position'] == 'B'||$has_temporary_approval) : ?>

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
                                        <th>Area</th>
                                        <th>Planta</th>
                                        <th>Colonia</th>
                                        <th>Horario</th>
                                        <th>Fecha</th>
                                        <th>Motivo del tiempo extra</th>
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
                                            <td><?php echo htmlspecialchars($proposal_detail_row['department']); ?></td>
                                            <td><?php echo htmlspecialchars($proposal_detail_row['plant']); ?></td>
                                            <td><?php echo htmlspecialchars($proposal_detail_row['colony']); ?></td>
                                            <td><?php echo htmlspecialchars($proposal_detail_row['schedule']); ?></td>
                                            <td><?php echo htmlspecialchars($proposal_detail_row['proposal_date']); ?></td>
                                            <td><?php echo htmlspecialchars($proposal_detail_row['extra_time_reason']); ?></td>

                                        </tr>
                                    <?php endwhile; ?>
                                </tbody>
                            </table>
                            <br>
                            <form action="dashboard.php" method="POST">
                            <input type="hidden" name="delete_all_operators" value="<?php echo $proposal_date; ?>">
                            <button type="submit" name="delete_all_operators_btn" class="delete-btn" onclick="return confirm('¿Estás seguro de que deseas borrar esta tabla?')">Borrar Tabla</button>
                                <button type="button" onclick="downloadExcel('<?php echo $tableId; ?>')">Descargar Detalles en Excel</button>
                            </form>
                    
                        </div>
                    <?php endwhile; ?>
                    <?php endif; ?>
                    <?php endif; ?>

                <?php if ($has_temporary_approval !== ''&& $user && $user ['position']== 'AB'||$has_temporary_approval !== ''&& $user && $user ['position']== 'B') :?>

                    <?php elseif ($has_temporary_approval == '') :?>

                    <h1>Solo personal Autorizado</h1>
                        <p>No tienes permiso para ver el tiempo extra.</p>
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