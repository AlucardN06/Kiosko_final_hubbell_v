// Ejemplo de requisitos
const requisitos = [
    "Currículum Vitae actualizado",
    "Identificación oficial",
    "Certificado de estudios",
    "Acta de nacimiento",
    "Carta de no antecedentes penales"
];

let todosSeleccionados = false;
let confirmNumber = generarNumeroAleatorio(1000, 9999); // Genera un número aleatorio entre 1000 y 9999

document.addEventListener('DOMContentLoaded', function() {
    mostrarRequisitos(requisitos);
    configurarValidacionFormulario();
    configurarBotonAgendar();
});

function mostrarRequisitos(requisitos) {
    const requirementsList = document.getElementById('requirementsList');
    requirementsList.innerHTML = '';
    requisitos.forEach(requisito => {
        const checkbox = document.createElement('input');
        checkbox.type = 'checkbox';
        checkbox.id = requisito;
        checkbox.name = requisito;
        checkbox.addEventListener('change', function() {
            checkSeleccionados();
        });
        const label = document.createElement('label');
        label.htmlFor = requisito;
        label.appendChild(document.createTextNode(requisito));
        requirementsList.appendChild(checkbox);
        requirementsList.appendChild(label);
        requirementsList.appendChild(document.createElement('br'));
    });
    checkSeleccionados();
}

function checkSeleccionados() {
    const checkboxes = document.querySelectorAll('input[type="checkbox"]');
    todosSeleccionados = true;
    checkboxes.forEach(checkbox => {
        if (!checkbox.checked) {
            todosSeleccionados = false;
        }
    });
    const scheduleButton = document.getElementById('scheduleButton');
    scheduleButton.disabled = !todosSeleccionados;
}

function configurarValidacionFormulario() {
    const inputs = document.querySelectorAll('input[type="text"], input[type="email"], input[type="date"]');
    const scheduleButton = document.getElementById('scheduleButton');
    
    inputs.forEach(input => {
        input.addEventListener('input', () => {
            scheduleButton.disabled = !Array.from(inputs).every(input => input.value.trim() !== '') || !todosSeleccionados;
        });
    });
}

function configurarBotonAgendar() {
    document.getElementById('scheduleButton').addEventListener('click', function() {
        const confirmacion = confirm("En caso de no tener toda la documentación su proceso de contratación será rechazado. ¿Desea continuar con la agenda?");
        if (confirmacion) {
            alert('Cita agendada exitosamente!');
            document.getElementById('confirmNumber').value = confirmNumber; // Asigna el número de confirmación al campo correspondiente
            confirmNumber++; // Incrementa el número de confirmación para la siguiente cita
            guardarEnExcel();
        }
    });
}


// Función para generar un número aleatorio entre un mínimo y un máximo
function generarNumeroAleatorio(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
}
function verificarNombre() {
    var nombre = document.getElementById('nombre').value;

    fetch('verificar_nombre.php', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ nombre: nombre })
    })
    .then(response => response.json())
    .then(data => {
        if (data.existe) {
            alert('Ya existe un registro con el mismo nombre completo. No puedes volver a registrarte.');
            event.preventDefault(); // Detener el envío del formulario si el nombre ya existe
        } else {
            // Continuar con el envío del formulario si el nombre no existe
            document.getElementById('appointmentForm').submit();
        }
    });
}


// Agregar event listener al formulario para verificar el nombre antes de enviarlo
document.getElementById('appointmentForm').addEventListener('submit', function(event) {
    verificarNombre(); // Verificar el nombre antes de enviar el formulario
});

