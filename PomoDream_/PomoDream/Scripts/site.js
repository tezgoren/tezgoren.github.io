window.addEventListener("DOMContentLoaded", () => {
    const temalar = document.querySelectorAll(".tema");

    // Sayfa yüklendiğinde, localStorage'dan renkleri al ve uygula
    const kayitliBg = localStorage.getItem('tema-bg');
    const kayitliText = localStorage.getItem('tema-text');
    const kayitliBtn = localStorage.getItem('tema-btn');
    const kayitliPanel = localStorage.getItem('tema-panel');

    if (kayitliBg && kayitliText && kayitliBtn && kayitliPanel) {
        document.documentElement.style.setProperty("--bg-color", kayitliBg);
        document.documentElement.style.setProperty("--text-color", kayitliText);
        document.documentElement.style.setProperty("--button-color", kayitliBtn);
        document.documentElement.style.setProperty("--panel-color", kayitliPanel);
    }

    temalar.forEach(tema => {
        tema.style.background = `linear-gradient(45deg, ${tema.dataset.bg}, ${tema.dataset.panel})`;

        tema.addEventListener("click", () => {
            // Seçilen temayı uygula
            document.documentElement.style.setProperty("--bg-color", tema.dataset.bg);
            document.documentElement.style.setProperty("--text-color", tema.dataset.text);
            document.documentElement.style.setProperty("--button-color", tema.dataset.btn);
            document.documentElement.style.setProperty("--panel-color", tema.dataset.panel);

            // Seçilen temayı localStorage'a kaydet
            localStorage.setItem('tema-bg', tema.dataset.bg);
            localStorage.setItem('tema-text', tema.dataset.text);
            localStorage.setItem('tema-btn', tema.dataset.btn);
            localStorage.setItem('tema-panel', tema.dataset.panel);
        });
    });
});

function toggleFullScreen() {
    if (!document.fullscreenElement) {
        document.documentElement.requestFullscreen().catch(err => {
            alert(`Tam ekran modu etkinleştirilemedi: ${err.message}`);
        });
    } else {
        document.exitFullscreen();
    }
}



function selectText(textbox) {
    textbox.select();
}