document.addEventListener('DOMContentLoaded', function() {
    const konamiCode = [38, 38, 40, 40, 37, 39, 37, 39, 66, 65];
    let konamiIndex = 0;

    document.addEventListener('keydown', function(e) {
        if (e.keyCode === konamiCode[konamiIndex]) {
            konamiIndex++;
            if (konamiIndex === konamiCode.length) {
                showEasterEgg();
                konamiIndex = 0;
            }
        } else {
            konamiIndex = 0;
        }
    });

    function showEasterEgg() {
        const message = document.createElement('div');
        message.style.position = 'fixed';
        message.style.top = '50%';
        message.style.left = '50%';
        message.style.transform = 'translate(-50%, -50%)';
        message.style.backgroundColor = 'black';
        message.style.color = 'yellow';
        message.style.padding = '20px';
        message.style.border = '2px solid yellow';
        message.style.zIndex = '1000';
        message.style.textAlign = 'center';
        message.style.fontFamily = 'Arial, sans-serif';
        message.style.fontSize = '18px';
        message.innerHTML = '¡Has encontrado el Easter Egg!<br>Página creada por AlucardN';
        document.body.appendChild(message);

        setTimeout(() => {
            message.remove();
        }, 5000); // El mensaje se eliminará después de 5 segundos
    }
});
