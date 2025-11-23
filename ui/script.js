const VALID_POSITIONS = [ 'top-left', 'top-center', 'top-right', 'bottom-left', 'bottom-center', 'bottom-right' ];

window.addEventListener('message', (event) => {
    const data = event.data;
    if (data.action === 'showZone') {
        if (typeof data.position === "string") {
            setPosition(data.position);
        }

        if (typeof data.color === "string" || typeof data.secondColor === "string") {
            setColor(data.color || "#ffffff", data.secondColor || "#ffffff");
        }

        showZone(data.zone, data.time);
    }
});

/* Set UI primary text color and secondary text color */
function setColor(color, secondColor) {
    const container = document.getElementById('main-display');
    if (!container) return;

    container.style.color = color || "#ffffff";

    if (secondColor) {
        const sub = document.getElementById('time-text');
        sub.style.color = secondColor || "#ffffff";
    }
}

/* Set UI position */
function setPosition(position) {
    const container = document.getElementById('main-display');
    if (!container) return;

    // remove all position classes
    container.classList.remove(...VALID_POSITIONS);

    // add new position
    const pos = VALID_POSITIONS.includes(position) ? position : "bottom-right";
    container.classList.add(pos);
}

/* Show zone */
let fadeOutTimer = null;
let hideTimer = null;

function showZone(zoneName, time) {
    const container = document.getElementById('main-display');
    const main = document.getElementById('main-text');
    const sub = document.getElementById('time-text');

    clearTimeout(fadeOutTimer);
    clearTimeout(hideTimer);

    main.textContent = zoneName.toUpperCase();
    sub.textContent = time;

    container.classList.remove('hidden');

    // if visible, restart fade-out time
    if (!container.classList.contains('visible')) {
        setTimeout(() => container.classList.add('visible'), 100);
    }

    // set fade-out timer
    fadeOutTimer = setTimeout(() => {
        container.classList.remove('visible');
        hideTimer = setTimeout(() => container.classList.add('hidden'), 2000);
    }, 6000);
}