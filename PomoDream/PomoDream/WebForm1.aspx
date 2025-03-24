<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="PomoDream.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="StyleSheet1.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <!-- MENÜ BUTONLARI BURADA -->
        <!-- Ayarlar Butonu -->
<asp:Button ID="btnSettings" runat="server" Text="Ayarlar" OnClick="btnSettings_Click" CssClass="settings-button" />
<asp:Panel ID="pnlSettings" runat="server" CssClass="settings-panel">
    <h3>Ayarlar Paneli</h3>
    <p>Selamlar dostlar!</p>
    <asp:Button ID="btnClose" runat="server" Text="Kapat" OnClick="btnClose_Click" CssClass="close-button" />
</asp:Panel>

<!-- Müzikler Butonu -->
<asp:Button ID="btnMusic" runat="server" Text="Müzikler" OnClick="btnMusic_Click" CssClass="settings-button" />
<asp:Panel ID="pnlMusic" runat="server" CssClass="settings-panel">
    <h3>Müzikler Paneli</h3>
    <textarea id="txtMusicContent" rows="10" cols="30" placeholder="Müzik içeriği girin..."></textarea>
    <asp:Button ID="btnCloseMusic" runat="server" Text="Kapat" OnClick="btnCloseMusic_Click" CssClass="close-button" />
</asp:Panel>

<!-- Bulmacalar Butonu -->
<asp:Button ID="btnPuzzles" runat="server" Text="Bulmacalar" OnClick="btnPuzzles_Click" CssClass="settings-button" />
<asp:Panel ID="pnlPuzzles" runat="server" CssClass="settings-panel">
    <h3>Bulmacalar Paneli</h3>
    <textarea id="txtPuzzlesContent" rows="10" cols="30" placeholder="Bulmaca içeriği girin..."></textarea>
    <asp:Button ID="btnClosePuzzles" runat="server" Text="Kapat" OnClick="btnClosePuzzles_Click" CssClass="close-button" />
</asp:Panel>
          <!--  KRONOMETRE  -->
        
    

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
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
      <asp:Button ID="butondeneme" runat="server" Text="AAAAAAAAAAAAAAAAAAAAAAAAA" />
</form>
  
      
</body>
</html>
