<?php header("refresh:5;url=index.php"); ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error de Cupos</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        
        .container {
            text-align: center;
        }
        
        h1 {
            color: #e74c3c;
        }
        
        p {
            color: #333;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Error de Cupos</h1>
        <p>Lo sentimos, el número de registros para esta fecha ya se ha llenado.</p>
        <p>Por favor, inténtelo en otra fecha.</p>
    </div>
</body>
</html>
