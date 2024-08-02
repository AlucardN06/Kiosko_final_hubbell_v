<?php
session_start();

// Verificar si el usuario está logueado y es administrativo
if (!isset($_SESSION['user_id']) ) {
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

// Obtener el ID de la encuesta desde la URL
if (isset($_GET['id'])) {
    $survey_id = mysqli_real_escape_string($conn, $_GET['id']);

    // Consultar la encuesta específica
    $query = "SELECT * FROM surveys WHERE id = '$survey_id'";
    $result = mysqli_query($conn, $query);

    if ($result && mysqli_num_rows($result) > 0) {
        $survey = mysqli_fetch_assoc($result);
    } else {
        die("Encuesta no encontrada.");
    }
} else {
    die("ID de encuesta no especificado.");
}

// Procesar el formulario para agregar preguntas
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['add_question'])) {
    $question_type = mysqli_real_escape_string($conn, $_POST['question_type']);
    $question_text = mysqli_real_escape_string($conn, $_POST['question_text']);

    // Insertar la pregunta en la base de datos
    $query_insert_question = "INSERT INTO survey_questions (survey_id, question_type, question_text) VALUES ('$survey_id', '$question_type', '$question_text')";
    if (mysqli_query($conn, $query_insert_question)) {
        header("Location: editar_encuesta.php?id=$survey_id");
        exit;
    } else {
        die("Error al agregar la pregunta: " . mysqli_error($conn));
    }
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Encuesta</title>
    <link rel="stylesheet" href="departamentos.css">
    <!-- Enlaces a otras hojas de estilo y scripts (ya definidos previamente) -->
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
                    <form action="departamentos.php">
                        <button type="submit" class="user-button">Regresar</button>
                    </form>
                    <form action="index.php" method="POST">
                        <button type="submit" name="logout" class="user-button">Cerrar sesión</button>
                    </form>
                </div>
            <?php endif; ?>
        </div>
        <div class="right-section">
            <h2>Editar Encuesta: <?php echo htmlspecialchars($survey['title']); ?></h2>
            <h3>Agregar Pregunta</h3>
            <form action="editar_encuesta.php?id=<?php echo $survey_id; ?>" method="POST">
                <div>
                    <label for="question_type">Tipo de Pregunta:</label>
                    <select id="question_type" name="question_type" required>
                        <option value="textbox">Textbox</option>
                        <option value="opcion_unica">Opción Única</option>
                        <option value="opcion_multiple">Opción Múltiple</option>
                    </select>
                </div>
                <div>
                    <label for="question_text">Pregunta:</label>
                    <input type="text" id="question_text" name="question_text" required>
                </div>
                <button type="submit" name="add_question">Agregar Pregunta</button>
            </form>

            <h3>Preguntas Actuales:</h3>
            <ul>
                <?php
                // Consultar las preguntas de la encuesta
                $query_questions = "SELECT * FROM survey_questions WHERE survey_id = '$survey_id'";
                $questions_result = mysqli_query($conn, $query_questions);

                if ($questions_result && mysqli_num_rows($questions_result) > 0) {
                    while ($question = mysqli_fetch_assoc($questions_result)) {
                        echo "<li>" . htmlspecialchars($question['question_text']) . "</li>";
                    }
                } else {
                    echo "<li>No hay preguntas aún.</li>";
                }
                ?>
            </ul>
        </div>
    </div>
</body>
</html>
