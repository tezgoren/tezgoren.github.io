// Tarayıcı uyumluluğunu artırmak için geliştirilmiş JavaScript kodları
window.addEventListener("load", function() {
    // Tema işlevselliği için kodlar
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
    
    // Zamanlayıcıyı başlat - DOMContentLoaded yerine window.load kullanıyoruz
    // Bu tüm kaynaklar (CSS, resimler vs.) yüklendikten sonra çalışır
    initializeTimer();
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

// JavaScript Kronometre Fonksiyonları
let timerInterval;
let timeLeft = 25 * 60; // 25 dakika * 60 saniye
let isBreak = false;
let isRunning = false;

function initializeTimer() {
    try {
        console.log("Timer initializing...");
        
        // Sayfa yüklendiğinde yerel depolamadan değerleri al
        if (typeof(Storage) !== "undefined") {
            const savedTimeLeft = sessionStorage.getItem('js_timeLeft');
            const savedIsBreak = sessionStorage.getItem('js_isBreak');
            const savedIsRunning = sessionStorage.getItem('js_isRunning');
            
            if (savedTimeLeft) {
                timeLeft = parseInt(savedTimeLeft);
            }
            
            if (savedIsBreak) {
                isBreak = savedIsBreak === 'true';
            }
            
            if (savedIsRunning && savedIsRunning === 'true') {
                startTimer(); // Sayfa yeniden yüklenirse timer'ı otomatik başlat
            }
        }
        
        updateTimerDisplay();
        
        // Butonları seç
        const startButton = document.getElementById('btnKronometreStart');
        const stopButton = document.getElementById('btnKronometreStop');
        const resetButton = document.getElementById('btnKronometreReset');
        
        // Brave ve diğer tarayıcılarda uyumluluk için click yerine mousedown/mouseup/touchstart kullanabiliriz
        if (startButton) {
            ["click", "touchstart"].forEach(function(evt) {
                startButton.addEventListener(evt, function(e) {
                    e.preventDefault();
                    e.stopPropagation();
                    console.log("Start button activated");
                    startTimer();
                    return false;
                }, { passive: false });
            });
        }
        
        if (stopButton) {
            ["click", "touchstart"].forEach(function(evt) {
                stopButton.addEventListener(evt, function(e) {
                    e.preventDefault();
                    e.stopPropagation();
                    stopTimer();
                    return false;
                }, { passive: false });
            });
        }
        
        if (resetButton) {
            ["click", "touchstart"].forEach(function(evt) {
                resetButton.addEventListener(evt, function(e) {
                    e.preventDefault();
                    e.stopPropagation();
                    resetTimer();
                    return false;
                }, { passive: false });
            });
        }
    } catch (error) {
        console.error("Timer initialization error:", error);
    }
}

function startTimer() {
    try {
        if (!isRunning) {
            isRunning = true;
            const statusElement = document.getElementById('lblKronometreStatusText');
            if (statusElement) {
                statusElement.innerText = isBreak ? "Mola!" : "Çalış!";
            }
            
            if (timerInterval) {
                clearInterval(timerInterval);
            }
            
            timerInterval = setInterval(function() {
                if (timeLeft > 0) {
                    timeLeft--;
                    updateTimerDisplay();
                    saveTimerState();
                } else {
                    // Süre bitti, mola veya çalışma durumunu değiştir
                    isBreak = !isBreak;
                    
                    if (isBreak) {
                        // Mola zamanı
                        try {
                            const breakInput = document.getElementById('txtBreakTimeSet');
                            const breakDuration = breakInput && !isNaN(parseInt(breakInput.value)) ? 
                                parseInt(breakInput.value) : 5;
                            timeLeft = breakDuration * 60;
                            
                            const statusElement = document.getElementById('lblKronometreStatusText');
                            if (statusElement) {
                                statusElement.innerText = "Mola!";
                            }
                        } catch (e) {
                            timeLeft = 5 * 60; // Hata olursa 5 dakika
                        }
                    } else {
                        // Çalışma zamanı
                        try {
                            const workInput = document.getElementById('txtWorkTimeSet');
                            const workDuration = workInput && !isNaN(parseInt(workInput.value)) ? 
                                parseInt(workInput.value) : 25;
                            timeLeft = workDuration * 60;
                            
                            const statusElement = document.getElementById('lblKronometreStatusText');
                            if (statusElement) {
                                statusElement.innerText = "Çalış!";
                            }
                        } catch (e) {
                            timeLeft = 25 * 60; // Hata olursa 25 dakika
                        }
                    }
                    
                    updateTimerDisplay();
                    saveTimerState();
                }
            }, 1000);
            
            saveTimerState();
        }
    } catch (error) {
        console.error("Start timer error:", error);
    }
}

function stopTimer() {
    try {
        if (isRunning) {
            if (timerInterval) {
                clearInterval(timerInterval);
            }
            isRunning = false;
            
            const statusElement = document.getElementById('lblKronometreStatusText');
            if (statusElement) {
                statusElement.innerText = "";
            }
            
            saveTimerState();
        }
    } catch (error) {
        console.error("Stop timer error:", error);
    }
}

function resetTimer() {
    try {
        if (timerInterval) {
            clearInterval(timerInterval);
        }
        isRunning = false;
        isBreak = false;
        
        try {
            const workInput = document.getElementById('txtWorkTimeSet');
            const workDuration = workInput && !isNaN(parseInt(workInput.value)) ? 
                parseInt(workInput.value) : 25;
            timeLeft = workDuration * 60;
        } catch (e) {
            timeLeft = 25 * 60; // Hata olursa 25 dakika
        }
        
        const statusElement = document.getElementById('lblKronometreStatusText');
        if (statusElement) {
            statusElement.innerText = "";
        }
        
        updateTimerDisplay();
        saveTimerState();
    } catch (error) {
        console.error("Reset timer error:", error);
    }
}

function updateTimerDisplay() {
    try {
        const minutes = Math.floor(timeLeft / 60);
        const seconds = timeLeft % 60;
        
        const displayElement = document.getElementById('lblKronometreText');
        if (displayElement) {
            displayElement.innerText = 
                `${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`;
        }
    } catch (error) {
        console.error("Update display error:", error);
    }
}

function saveTimerState() {
    try {
        if (typeof(Storage) !== "undefined") {
            sessionStorage.setItem('js_timeLeft', timeLeft);
            sessionStorage.setItem('js_isBreak', isBreak);
            sessionStorage.setItem('js_isRunning', isRunning);
        }
    } catch (error) {
        console.error("Save state error:", error);
    }
}