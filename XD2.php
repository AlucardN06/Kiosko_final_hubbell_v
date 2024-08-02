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

// Obtener información del usuario si está en sesión
$user = null;
if (isset($_SESSION['user_id'])) {
    $user_id = $_SESSION['user_id'];
    $query = "SELECT firstname, lastname, position, area, plant FROM users WHERE id = '$user_id'";
    $result_user = mysqli_query($conn, $query);
    if ($result_user && mysqli_num_rows($result_user) > 0) {
        $user = mysqli_fetch_assoc($result_user);
    } else {
        die("Error al obtener datos del usuario");
    }
}
$query = "SELECT 
    operators.proposal_date, 
    operators.supervisor_firstname, 
    operators.supervisor_lastname,
    operators.username, 
    operators.firstname, 
    operators.lastname, 
    operators.area, 
    operators.plant, 
    operators.colony, 
    operators.schedule,
    GROUP_CONCAT(
        DISTINCT IFNULL(
            CONCAT(
                users.firstname, ' ', users.lastname, 
                ' (supliendo a: ',
                (SELECT CONCAT(u2.firstname, ' ', u2.lastname) 
                 FROM users u2 
                 WHERE u2.id = temp.user_id AND temp.expiration_time > NOW()),
                ')'
            ),
            CONCAT(users.firstname, ' ', users.lastname)
        ) SEPARATOR ', '
    ) AS admin_names
FROM 
    approvals
INNER JOIN 
    operators ON approvals.proposal_date = operators.proposal_date
INNER JOIN 
    users ON users.username = approvals.admin_id
LEFT JOIN
    temporary_approvals temp ON temp.approve_user_id = approvals.admin_id
GROUP BY 
    operators.proposal_date, operators.supervisor_firstname, operators.supervisor_lastname, 
    operators.username, operators.firstname, operators.lastname, 
    operators.area, operators.plant, operators.colony, operators.schedule
HAVING 
    COUNT(DISTINCT CASE WHEN approvals.action = 'Aprobado' THEN approvals.admin_id END) >= 2
    AND COUNT(DISTINCT CASE WHEN approvals.action = 'Rechazado' THEN approvals.admin_id END) = 0
LIMIT 0, 25";

$result = mysqli_query($conn, $query);


?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tiempo Extra Aprobado</title>
    <link rel="stylesheet" href="tiempoe.css">
    <script>
    function toggleTable(button) {
        var table = button.nextElementSibling;
        if (table.style.display === 'none' || table.style.display === '') {
            table.style.display = 'table';
        } else {
            table.style.display = 'none';
        }
    }

    function exportToExcel(proposalDate) {
        var table = document.querySelector('.proposal-table[data-date="' + proposalDate + '"]');
        var tableHTML = table.outerHTML.replace(/ /g, '%20');

        var downloadLink = document.createElement("a");
        var dataType = 'application/vnd.ms-excel';
        downloadLink.href = 'data:' + dataType + ', ' + tableHTML;
        downloadLink.download = 'propuesta_' + proposalDate + '.xls';

        document.body.appendChild(downloadLink);
        downloadLink.click();
        document.body.removeChild(downloadLink);
    }

    function updateDateTime() {
        const now = new Date();
        const dateString = now.toLocaleDateString();
        const timeString = now.toLocaleTimeString();
        document.getElementById('datetime').textContent = `Fecha: ${dateString}, Hora: ${timeString}`;
    }

    setInterval(updateDateTime, 1000); // Actualiza cada segundo

    window.onload = updateDateTime; // Llama a la función al cargar la página

    function checkOrientation() {
        if (window.innerHeight > window.innerWidth) {
            // Si está en portrait, mostrar un mensaje
            document.getElementById('orientation-alert').style.display = 'flex';
        } else {
            // Si está en landscape, ocultar el mensaje
            document.getElementById('orientation-alert').style.display = 'none';
        }
    }

    // Ejecutar la función al cargar la página
    window.onload = checkOrientation;

    // Detectar cambios en la orientación
    window.addEventListener('orientationchange', checkOrientation);
    window.addEventListener('resize', checkOrientation);

    function deleteTable(proposalDate) {
    if (confirm('¿Estás seguro de que deseas eliminar esta tabla y sus aprobaciones asociadas?')) {
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "delete_table.php", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function() {
            if (xhr.readyState == 4 && xhr.status == 200) {
                // Seleccionar el contenedor del botón y la tabla
                var proposalButton = document.querySelector('button.toggle-table[data-date="' + proposalDate + '"]');
                var tableContainer = document.querySelector('.table-container[data-date="' + proposalDate + '"]');

                // Eliminar el botón y la tabla si existen
                if (proposalButton) {
                    proposalButton.parentNode.removeChild(proposalButton);
                }
                if (tableContainer) {
                    tableContainer.parentNode.removeChild(tableContainer);
                }
            }
        };
        xhr.send("proposal_date=" + proposalDate);
    }
}
    </script>

    <style>
        #orientation-alert {
            display: none; /* Oculto por defecto */
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 2); /* Fondo semi-transparente */
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
                <p>Área: <?php echo htmlspecialchars($user['area']); ?></p>
                <p>Puesto: <?php echo htmlspecialchars($user['position']); ?></p>
                <p>Número de planta: <?php echo htmlspecialchars($user['plant']); ?></p>
                <p id="datetime"></p> <!-- Contenedor para la fecha y la hora -->
                <div class="user-buttons">
                    <form>
                        <button type="button" onclick="location.href='enfermeria.php'" class="user-button">Regresar</button>
                    </form>
                    <form action="index.php" method="POST">
                        <button type="submit" name="logout" class="user-button">Cerrar sesión</button>
                    </form>
                </div>
            <?php endif; ?>
        </div>

        
        <div class="right-section">
    <h3>Propuestas de Tiempo Extra Aprobadas</h3>
    <?php if ($result && mysqli_num_rows($result) > 0) : ?>
        <?php $current_proposal_date = null; $admin_names = ''; ?>
        <?php while ($row = mysqli_fetch_assoc($result)) : ?>
            <?php if ($row && $row['proposal_date'] !== $current_proposal_date) : ?>
                <?php if ($current_proposal_date !== null) : ?>
                    <tr>
                        <td colspan="50"><strong>Aprobadores:</strong> <?php echo htmlspecialchars($admin_names); ?></td>
                    </tr>
                    </tbody>
                </table>
                <button onclick="exportToExcel('<?php echo $current_proposal_date; ?>')">Descargar como Excel</button>
                <button onclick="deleteTable('<?php echo $current_proposal_date; ?>')">Borrar Tabla</button>
            </div>
            <?php endif; ?>
            <button class="toggle-table" data-date="<?php echo htmlspecialchars($row['proposal_date']); ?>" onclick="toggleTable(this)">Propuesta para <?php echo htmlspecialchars($row['proposal_date']); ?></button>
            <div class="table-container" data-date="<?php echo htmlspecialchars($row['proposal_date']); ?>" style="display: none;">
                <table class="proposal-table" data-date="<?php echo htmlspecialchars($row['proposal_date']); ?>">
                    <thead>
                        <tr>
                            <th>Nombre del Supervisor</th>
                            <th>Apellido del Supervisor</th>
                            <th>Número de Reloj del Empleado</th>
                            <th>Nombre del Empleado</th>
                            <th>Apellido del Empleado</th>
                            <th>Área</th>
                            <th>Planta</th>
                            <th>Colonia</th>
                            <th>Horario</th>
                            <th>Fecha</th>
                        </tr>
                    </thead>
                    <tbody>
                    <?php $current_proposal_date = $row['proposal_date']; $admin_names = $row['admin_names']; ?>
            <?php endif; ?>
                    <tr>
                        <td><?php echo htmlspecialchars($row['supervisor_firstname']); ?></td>
                        <td><?php echo htmlspecialchars($row['supervisor_lastname']); ?></td>
                        <td><?php echo htmlspecialchars($row['username']); ?></td>
                        <td><?php echo htmlspecialchars($row['firstname']); ?></td>
                        <td><?php echo htmlspecialchars($row['lastname']); ?></td>
                        <td><?php echo htmlspecialchars($row['area']); ?></td>
                        <td><?php echo htmlspecialchars($row['plant']); ?></td>
                        <td><?php echo htmlspecialchars($row['colony']); ?></td>
                        <td><?php echo htmlspecialchars($row['schedule']); ?></td>
                        <td><?php echo htmlspecialchars($row['proposal_date']); ?></td>
                    </tr>
                <?php endwhile; ?>
                <tr>
                    <td colspan="10"><strong>Aprobadores:</strong> <?php echo htmlspecialchars($admin_names); ?></td>
                </tr>
                </tbody>
            </table>
            <br>
            <button onclick="exportToExcel('<?php echo $current_proposal_date; ?>')">Descargar como Excel</button><br>
            <button onclick="deleteTable('<?php echo $current_proposal_date; ?>')">Borrar Tabla</button>
        </div>
    <?php else : ?>
        <p>No hay propuestas aprobadas.</p>
    <?php endif; ?>
</div>
</div>

</body>

</html>
