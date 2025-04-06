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

    function changeTheme(theme) {
        document.body.classList.remove("theme1", "theme2", "theme3");
        document.body.classList.add(theme);
        setButtonColors(theme);
    }

    btnTheme1.addEventListener("click", () => changeTheme("theme1"));
    btnTheme2.addEventListener("click", () => changeTheme("theme2"));
    btnTheme3.addEventListener("click", () => changeTheme("theme3"));

    function setButtonColors(theme) {
        document.querySelectorAll("button").forEach(button => {
            button.classList.remove("theme1", "theme2", "theme3");
            button.classList.add(theme);
        });
    }

    // Kronometre
    let timer;
    let timeLeft = 25 * 60; // 25 dakika
    const lblTime = document.getElementById("lblTime");
    const btnStartStop = document.getElementById("btnStartStop");

    function updateTimerDisplay() {
        const minutes = Math.floor(timeLeft / 60);
        const seconds = timeLeft % 60;
        lblTime.textContent = `${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`;
    }

    function startTimer() {
        if (!timer) {
            timer = setInterval(() => {
                if (timeLeft > 0) {
                    timeLeft--;
                    updateTimerDisplay();
                } else {
                    stopTimer();
                    alert("Zaman doldu!");
                }
            }, 1000);
            btnStartStop.textContent = "Durdur";
        }
    }

    function stopTimer() {
        clearInterval(timer);
        timer = null;
        btnStartStop.textContent = "Başlat";
    }

    function resetTimer() {
        stopTimer();
        timeLeft = 25 * 60;
        updateTimerDisplay();
    }

    btnStartStop.addEventListener("click", function () {
        if (timer) {
            stopTimer();
        } else {
            startTimer();
        }
    });

    document.getElementById("btnReset").addEventListener("click", resetTimer);

    document.getElementById("btnSetTime").addEventListener("click", function () {
        const customTime = parseInt(document.getElementById("txtTime").value);
        if (!isNaN(customTime) && customTime > 0) {
            timeLeft = customTime * 60; // Kullanıcının girdiği süreyi saniyeye çevir
            updateTimerDisplay();
            stopTimer(); // Önceki zamanlayıcıyı durdur
        } else {
            alert("Lütfen geçerli bir dakika değeri girin.");
        }
    });
    

    updateTimerDisplay();
});
