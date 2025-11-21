window.addEventListener('message', (event) => {
    const data = event.data;
    if (data.action === 'showZone') {
        showZone(data.zone, data.time);
    }
});

function showZone(zoneName, time) {
    const container = document.getElementById('main-display');
    const main = document.getElementById('main-text');
    const sub = document.getElementById('time-text');

    main.textContent = zoneName.toUpperCase();
    sub.textContent = time;

    container.classList.remove('hidden');

    // fade in if not already visible
    if (container.classList.contains('visible')) return;

    setTimeout(() => container.classList.add('visible'), 100);

    // fade out
    setTimeout(() => {
        container.classList.remove('visible');
        setTimeout(() => container.classList.add('hidden'), 2000);
    }, 6000);
}