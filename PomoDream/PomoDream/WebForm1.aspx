<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="PomoDream.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="StyleSheet1.css" rel="stylesheet" />
    <link id="themeLink" href="light-tema.css" rel="stylesheet" type="text/css" />
    <title></title>
</head>
<body class="light-theme">
    <form id="form1" runat="server">
        <!-- Ayarlar Butonu -->
        <asp:Button ID="btnSettings" runat="server" Text="Ayarlar" OnClick="btnSettings_Click" CssClass="settings-button" />

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

        <!-- Kronometre -->
        <div class="header">
            <h2>Kronometre</h2>
            <asp:Label ID="lblTime" runat="server" Text="25:00"></asp:Label>
        </div>
    </form>
</body>
</html>
