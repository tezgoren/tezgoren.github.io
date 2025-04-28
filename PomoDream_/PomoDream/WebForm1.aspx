<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="PomoDream.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>PomoDream</title>
    <link href="<%= ResolveUrl("~/StyleSheet1.css") %>" rel="stylesheet" />

    <script type="text/javascript">

        // Kullanıcı bir görev yazdığında ve yazmaya başladığında bu fonksiyon tetiklenir
        function addTask(input) {
            const li = input.parentElement; // Input'un bulunduğu <li> elemanını alır

            // Eğer input boşsa VEYA bu satırın hemen altında başka bir satır zaten varsa, yeni görev oluşturma
            if (input.value.trim() === "" || li.nextElementSibling) return;

            // Bu satır zaten sil butonu içermiyorsa, bir tane oluştur
            if (!li.querySelector("button")) {
                const deleteBtn = document.createElement("button"); // Yeni bir <button> oluşturur
                deleteBtn.innerText = "✕"; // Butona çarpı simgesi eklenir
                deleteBtn.type = "button"; // Formu göndermesin diye tip 'button' yapılır
                deleteBtn.className = "delete-btn"; // CSS ile stillendirme için sınıf eklenir

                // Silme işlevi: butona tıklanınca deleteTask fonksiyonu çağrılır
                deleteBtn.onclick = function () {
                    deleteTask(deleteBtn);
                };

                li.appendChild(deleteBtn); // Sil butonu, ilgili <li>'nin sonuna eklenir
            }

            // Yeni boş bir görev satırı eklenir
            createEmptyTask();
        }

        // Checkbox işaretlenince görevin üstünü çizer
        function toggleTask(checkbox) {
            const input = checkbox.nextElementSibling; // Checkbox'ın hemen yanındaki <input> alanı
            input.style.textDecoration = checkbox.checked ? "line-through" : "none"; // İşaretliyse üstü çizilir
        }

        // Sil butonuna basıldığında çağrılır
        function deleteTask(button) {
            const li = button.parentElement; // Butonun ait olduğu <li> öğesini bulur
            li.remove(); // O <li> öğesini (görevi) siler

            // Eğer boş görev kutusu kalmadıysa, yeni boş bir görev kutusu ekle
            const taskList = document.getElementById("taskList"); // Listeyi bul
            const inputs = taskList.querySelectorAll(".task-input"); // Tüm inputları al
            const hasEmpty = Array.from(inputs).some(input => input.value.trim() === ""); // Boş input var mı kontrol et

            if (!hasEmpty) {
                createEmptyTask(); // Yoksa bir tane ekle
            }
        }

        // Yeni boş bir görev satırı (li) oluşturur
        function createEmptyTask() {
            const emptyLi = document.createElement("li"); // <li> oluştur
            emptyLi.innerHTML = `
            <input type="checkbox" class="task-checkbox" onclick="toggleTask(this)">
            <input type="text" class="task-input" placeholder="Yeni görev ekleyin" oninput="addTask(this)">
        `; // İçerisine checkbox ve yazı kutusu ekle
            document.getElementById("taskList").appendChild(emptyLi); // Listeye ekle
        }

        // Sayfa yüklendiğinde bir tane boş görev satırı otomatik olarak eklenir
        window.onload = function () {
            const taskList = document.getElementById("taskList"); // Liste elemanını bul
            taskList.innerHTML = ""; // Eski içerikleri temizle (güvenli başlatma)
            createEmptyTask(); // Boş görev kutusu ekle
        };

    </script>


</head>
<body>
    <form id="form1" runat="server">
        <div id="mainContainer">
            <h3>Not Defteri</h3>
            <div class="notepad">
                <ul id="taskList">
                    <!-- JavaScript tarafından boş olarak oluşturulacak -->
                </ul>
            </div>
        </div>
        <asp:Label ID="lblYazi" runat="server" Font-Size="Large" ForeColor="DarkBlue" />

    </form>
</body>
</html>
