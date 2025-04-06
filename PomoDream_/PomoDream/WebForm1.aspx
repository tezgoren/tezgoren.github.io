<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="PomoDream.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<<<<<<< HEAD
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="~/StyleSheet1.css" rel="stylesheet" />
=======
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="StyleSheet1.css" rel="stylesheet" />
    <link id="themeLink" href="light-tema.css" rel="stylesheet" type="text/css" />
>>>>>>> 917a7f74c83d49fa27d37f761ccb0ed5cc4fa0a5
    <title></title>
</head>
<body class="light-theme">
    <form id="form1" runat="server">
        <!-- Ayarlar Butonu -->
<<<<<<< HEAD
<asp:Button ID="btnSettings" runat="server" Text="Ayarlar" OnClick="btnSettings_Click" CssClass="settings-button" />
<asp:Panel ID="pnlSettings" runat="server" CssClass="settings-panel">
    <h3>Ayarlar Paneli</h3>
    <p>Selamlar dostlar!</p>
    <asp:Button ID="btnRenkDegisimiBir" runat="server" Text="Mavi" OnClick="btnRenkDegisimiBir_Click" />
    <asp:Button ID="btnRenkDegisimiIki" runat="server" Text="Yeşil" OnClick="btnRenkDegisimiIki_Click" />
    <asp:Button ID="btnRenkDegisimiUc" runat="server" Text="Medyum Turkuaz AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" OnClick="btnRenkDegisimiUc_Click" />
    <asp:Button ID="btnClose" runat="server" Text="Kapat" OnClick="btnClose_Click" CssClass="close-button" />
</asp:Panel>
=======
        <asp:Button ID="btnSettings" runat="server" Text="Ayarlar" OnClick="btnSettings_Click" CssClass="settings-button" />
>>>>>>> 917a7f74c83d49fa27d37f761ccb0ed5cc4fa0a5

        <!-- Ayarlar Paneli -->
        <asp:Panel ID="pnlSettings" runat="server" CssClass="settings-panel">
            <h3>Ayarlar Paneli</h3>
            <div class="container-settings">
                <p>Selamlar dostlar!</p>
                <!-- Tema Seçimi Butonları -->
                <asp:Button ID="btnLightTheme" runat="server" Text="Aydınlık Tema" OnClick="btnLightTheme_Click" />
                <asp:Button ID="btnDarkTheme" runat="server" Text="Karanlık Tema" OnClick="btnDarkTheme_Click" />
                <br />
                <!-- Kapat butonunun işlevi -->
                <asp:Button ID="btnCloseSettings" runat="server" Text="Kapat" OnClick="btnCloseSettings_Click" CssClass="close-button" />
            </div>
        </asp:Panel>

<<<<<<< HEAD
<!-- Bulmacalar Butonu -->
<asp:Button ID="btnPuzzles" runat="server" Text="Bulmacalar" OnClick="btnPuzzles_Click" CssClass="settings-button" />
<asp:Panel ID="pnlPuzzles" runat="server" CssClass="settings-panel">
    <h3>Bulmacalar Paneli</h3>
    <textarea id="txtPuzzlesContent" rows="10" cols="30" placeholder="Bulmaca içeriği girin..."></textarea>
    <asp:Button ID="btnClosePuzzles" runat="server" Text="Kapat" OnClick="btnClosePuzzles_Click" CssClass="close-button" />
</asp:Panel>
          <!--  KRONOMETRE  -->
        
    <asp:Panel ID="pnlKronometre" runat="server" CssClass="kronometre">

        <asp:ScriptManager ID="ScriptManager1" runat="server" /> 
  <h2>Kronometre</h2>

  <label for="txtTime">Süre (Dakika):</label>
  <asp:TextBox ID="txtTime" runat="server" Text="25"></asp:TextBox>
  <asp:Button ID="btnSetTime" runat="server" Text="Süreyi Ayarla" OnClick="btnSetTime_Click" />

  <asp:UpdatePanel ID="UpdatePanel1" runat="server">
      <ContentTemplate>
          <h1>
              <asp:Label ID="lblTime" runat="server" Text="25:00"></asp:Label>
          </h1>

          <asp:Button ID="btnStart" runat="server" Text="Başlat" OnClick="btnStart_Click" />
          <asp:Button ID="btnStop" runat="server" Text="Durdur" OnClick="btnStop_Click" />
          <asp:Button ID="btnReset" runat="server" Text="Sıfırla" OnClick="btnReset_Click" />

          <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick" Enabled="false" />
      </ContentTemplate>
  </asp:UpdatePanel>
    </asp:Panel>
</form>
  
      
=======
        <!-- Kronometre -->
        <div class="header">
            <h2>Kronometre</h2>
            <asp:Label ID="lblTime" runat="server" Text="25:00"></asp:Label>
        </div>
    </form>
>>>>>>> 917a7f74c83d49fa27d37f761ccb0ed5cc4fa0a5
</body>
</html>
