<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="PomoDream.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <meta charset="utf-8" />
    <link href="<%= ResolveUrl("~/StyleSheet1.css") %>" rel="stylesheet" />
    <title>PomoDream</title>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Ayarlar Butonu -->
        <asp:Button ID="btnSettings" runat="server" Text="Ayarlar" OnClick="btnSettings_Click" CssClass="settings-button" />

        <!-- Ayarlar Paneli -->
        <asp:Panel ID="pnlSettings" runat="server" CssClass="settings-panel">
            <div class="container-settings">
                <h3>Ayarlar Paneli</h3>
                <div class="inner-container">
                    <p>Selamlar dostlar!</p>
                    <asp:Button ID="btnRenkDegisimiBir" runat="server" Text="Mavi" OnClick="btnRenkDegisimiBir_Click" />
                    <asp:Button ID="btnRenkDegisimiIki" runat="server" Text="Yeşil" OnClick="btnRenkDegisimiIki_Click" />
                    <asp:Button ID="btnRenkDegisimiUc" runat="server" Text="Turuncu" OnClick="btnRenkDegisimiUc_Click" />
                    <asp:Button ID="btnClose" runat="server" Text="Kapat" OnClick="btnClose_Click" CssClass="close-button" />
                </div>

                <%-- Tek bir inner-container içine hepsi alınır --%>
                <div class="inner-container">
                    <label>Süre (Dakika):</label>
                    <asp:TextBox ID="txtTime" runat="server" Text="25"></asp:TextBox>
                    <asp:Button ID="btnSetTime" runat="server" Text="Süreyi Ayarla" OnClick="btnSetTime_Click" />
                </div>
            </div>
        </asp:Panel>

        <!-- Müzikler ve Bulmacalar -->
        <asp:Button ID="btnMusic" runat="server" Text="Müzikler" OnClick="btnMusic_Click" CssClass="settings-button" Style="top:70px;left:20px;" />
        <asp:Panel ID="pnlMusic" runat="server" CssClass="settings-panel">
            <h3>Müzikler Paneli</h3>
            <textarea id="txtMusicContent" rows="10" cols="30" placeholder="Müzik içeriği girin..."></textarea>
            <asp:Button ID="btnCloseMusic" runat="server" Text="Kapat" OnClick="btnCloseMusic_Click" CssClass="close-button" />
        </asp:Panel>

        <asp:Button ID="btnPuzzles" runat="server" Text="Bulmacalar" OnClick="btnPuzzles_Click" CssClass="settings-button" Style="top:120px;left:20px;" />
        <asp:Panel ID="pnlPuzzles" runat="server" CssClass="settings-panel">
            <h3>Bulmacalar Paneli</h3>
            <textarea id="txtPuzzlesContent" rows="10" cols="30" placeholder="Bulmaca içeriği girin..."></textarea>
            <asp:Button ID="btnClosePuzzles" runat="server" Text="Kapat" OnClick="btnClosePuzzles_Click" CssClass="close-button" />
        </asp:Panel>

        <!-- KRONOMETRE -->
        <asp:Panel ID="pnlKronometre" runat="server" CssClass="kronometre">
            <asp:ScriptManager ID="ScriptManager1" runat="server" />
            <div class="kronometre-container">
                <h2>Kronometre</h2>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <h1><asp:Label ID="lblTime" runat="server" Text="25:00"></asp:Label></h1>
                        <asp:Button ID="btnStart" runat="server" Text="Başlat" OnClick="btnStart_Click" CssClass="btn-kronometre" />
                        <asp:Button ID="btnStop" runat="server" Text="Durdur" OnClick="btnStop_Click" CssClass="btn-kronometre" />
                        <asp:Button ID="btnReset" runat="server" Text="Sıfırla" OnClick="btnReset_Click" CssClass="btn-kronometre" />
                        <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick" Enabled="false" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </asp:Panel>
        <!--buraya notepad gelecek-->
       <!-- Notepad Butonu -->
<asp:Button ID="btnNotepad" runat="server" Text="Not Defteri" OnClick="btnNotepad_Click" CssClass="settings-button" Style="top:170px;left:20px;" />

<!-- Notepad Paneli -->
<asp:Panel ID="pnlNotepad" runat="server" CssClass="settings-panel" Visible="false">
    <h3>Not Defteri Paneli</h3>
    <div class="notepad">
        <ul id="taskList">
            <li>
                <input type="checkbox" class="task-checkbox" onclick="toggleTask(this)">
                <input type="text" class="task-input" placeholder="Yeni görev ekleyin" oninput="addTask(this)">
            </li>
        </ul>
    </div>
    <asp:Button ID="btnCloseNotepad" runat="server" Text="Kapat" OnClick="btnCloseNotepad_Click" CssClass="close-button" />
</asp:Panel>


    </form>
</body>
</html>
