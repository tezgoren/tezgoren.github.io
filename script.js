document.addEventListener("DOMContentLoaded", function () {
    // Ayarlar paneli
    const btnSettings = document.getElementById("btnSettings");
    const pnlSettings = document.getElementById("pnlSettings");
    const btnClose = document.getElementById("btnClose");

    btnSettings.addEventListener("click", function () {
        pnlSettings.classList.add("open");
        btnSettings.classList.add("hidden"); // Ayarlar butonunu gizle
    });

    btnClose.addEventListener("click", function () {
        pnlSettings.classList.remove("open");
        btnSettings.classList.remove("hidden"); // Ayarlar butonunu göster
    });

    // Tema değiştirme
    const btnTheme1 = document.getElementById("btnTheme1");
    const btnTheme2 = document.getElementById("btnTheme2");
    const btnTheme3 = document.getElementById("btnTheme3");

    btnTheme1.addEventListener("click", function () {
        document.body.classList.remove("theme2", "theme3");
        document.body.classList.add("theme1");
        // Buton renklerini değiştirme
        setButtonColors('theme1');
    });

    btnTheme2.addEventListener("click", function () {
        document.body.classList.remove("theme1", "theme3");
        document.body.classList.add("theme2");
        setButtonColors('theme2');
    });

    btnTheme3.addEventListener("click", function () {
        document.body.classList.remove("theme1", "theme2");
        document.body.classList.add("theme3");
        setButtonColors('theme3');
    });

    function setButtonColors(theme) {
        const buttons = document.querySelectorAll('button');
        buttons.forEach(button => {
            button.classList.remove('theme1', 'theme2', 'theme3');
            button.classList.add(theme);
        });
    }

    // Kronometre ve diğer işlevler
    let timer;
    let timeLeft = 25 * 60; // Başlangıçta 25 dakika
    const lblTime = document.getElementById("lblTime");

    function updateTimerDisplay() {
        const minutes = Math.floor(timeLeft / 60);
        const seconds = timeLeft % 60;
        lblTime.textContent = `${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`;
    }

    // Başlat/Durdur butonu
    document.getElementById("btnStartStop").addEventListener("click", function () {
        if (!timer) {
            timer = setInterval(function () {
                if (timeLeft > 0) {
                    timeLeft--;
                    updateTimerDisplay();
                } else {
                    clearInterval(timer);
                    timer = null;
                    alert('Zaman doldu!');
                }
            }, 1000);
        } else {
            clearInterval(timer);
            timer = null;
        }
    });

    // Reset butonu
    document.getElementById("btnReset").addEventListener("click", function () {
        timeLeft = 25 * 60; // Başlangıç süresi
        updateTimerDisplay();
        clearInterval(timer);
        timer = null;
    });

    // Ayarla butonu
    document.getElementById("btnSetTime").addEventListener("click", function () {
        const customTime = parseInt(document.getElementById("txtTime").value);
        if (isNaN(customTime) || customTime <= 0) {
            alert('Lütfen geçerli bir dakika değeri girin.');
            return;
        }
        timeLeft = customTime * 60; // Dakika değerini saniyeye çevir
        updateTimerDisplay();
        // Sayaç otomatik başlatılmasın
        clearInterval(timer);
        timer = null;
    });

    updateTimerDisplay();
});
