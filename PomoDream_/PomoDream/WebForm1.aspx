<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="PomoDream.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="~/StyleSheet1.css" rel="stylesheet" />
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
                    
                    <!-- Textarea, Ayarlar Paneline Yerleştirildi -->
                    

                    <asp:Button ID="btnClose" runat="server" Text="Kapat" OnClick="btnClose_Click" CssClass="close-button" />
                </div>
                <div class="inner-container">
                    <label for="txtTime">Süre (Dakika):</label>
<asp:TextBox ID="txtTime" runat="server" Text="25"></asp:TextBox>
                    <asp:Button ID="btnSetTime" runat="server" Text="Süreyi Ayarla" OnClick="btnSetTime_Click" />
                </div>
                                <div class="inner-container">
                    <label for="txtTime">Süre (Dakika):</label>
<asp:TextBox ID="TextBox1" runat="server" Text="25"></asp:TextBox>
                    <asp:Button ID="Button1" runat="server" Text="Süreyi Ayarla" OnClick="btnSetTime_Click" />
                </div>
                                <div class="inner-container">
                    <label for="txtTime">Süre (Dakika):</label>
<asp:TextBox ID="TextBox2" runat="server" Text="25"></asp:TextBox>
                    <asp:Button ID="Button2" runat="server" Text="Süreyi Ayarla" OnClick="btnSetTime_Click" />
                </div>
                                <div class="inner-container">
                    <label for="txtTime">Süre (Dakika):</label>
<asp:TextBox ID="TextBox3" runat="server" Text="25"></asp:TextBox>
                    <asp:Button ID="Button3" runat="server" Text="Süreyi Ayarla" OnClick="btnSetTime_Click" />
                </div>
                                <div class="inner-container">
                    <label for="txtTime">Süre (Dakika):</label>
<asp:TextBox ID="TextBox4" runat="server" Text="25"></asp:TextBox>
                    <asp:Button ID="Button4" runat="server" Text="Süreyi Ayarla" OnClick="btnSetTime_Click" />
                </div>
                                <div class="inner-container">
                    <label for="txtTime">Süre (Dakika):</label>
<asp:TextBox ID="TextBox5" runat="server" Text="25"></asp:TextBox>
                    <asp:Button ID="Button5" runat="server" Text="Süreyi Ayarla" OnClick="btnSetTime_Click" />
                </div>
                                <div class="inner-container">
                    <label for="txtTime">Süre (Dakika):</label>
<asp:TextBox ID="TextBox6" runat="server" Text="25"></asp:TextBox>
                    <asp:Button ID="Button6" runat="server" Text="Süreyi Ayarla" OnClick="btnSetTime_Click" />
                </div>
                                <div class="inner-container">
                    <label for="txtTime">Süre (Dakika):</label>
<asp:TextBox ID="TextBox7" runat="server" Text="25"></asp:TextBox>
                    <asp:Button ID="Button7" runat="server" Text="Süreyi Ayarla" OnClick="btnSetTime_Click" />
                </div>
                                <div class="inner-container">
                    <label for="txtTime">Süre (Dakika):</label>
<asp:TextBox ID="TextBox8" runat="server" Text="25"></asp:TextBox>
                    <asp:Button ID="Button8" runat="server" Text="Süreyi Ayarla" OnClick="btnSetTime_Click" />
                </div>
            </div>
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

        <!-- KRONOMETRE -->
        <asp:Panel ID="pnlKronometre" runat="server" CssClass="kronometre">
            <asp:ScriptManager ID="ScriptManager1" runat="server" /> 
            <div class="kronometre-container">
                
                

                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <h1 style="font-family: 'MyCustomFont', sans-serif;">
                            <asp:Label ID="lblTime" runat="server" Text="25:00"></asp:Label>
                        </h1>

                        <asp:Button ID="btnStart" runat="server" Text="BAŞLAT" OnClick="btnStart_Click" CssClass="btn-kronometre"/>
                        <asp:Button ID="btnStop" runat="server" Text="DURDUR" OnClick="btnStop_Click"   CssClass="btn-kronometre"/>
                        <asp:Button ID="btnReset" runat="server" Text="SIFIRLA" OnClick="btnReset_Click"   CssClass="btn-kronometre"/>

                        <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick" Enabled="false" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </asp:Panel>
    </form>
</body>
</html>
