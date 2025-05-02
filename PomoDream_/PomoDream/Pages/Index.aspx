<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="PomoDream.Index" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../Css/main.css" rel="stylesheet" />
    <title>PomoDream</title>
    <script src="../Scripts/site.js"  type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Ayarlar Paneli -->
        <asp:Button ID="btnSettings" runat="server" Text="Ayarlar" OnClick="btnSettings_Click" CssClass="settings-button" />
        <asp:Button ID="btnFullScreen" runat="server" Text="⛶" OnClientClick="toggleFullScreen(); return false;" CssClass="btnFullScreen" />
        <asp:Panel ID="pnlSettings" runat="server" CssClass="settings-panel">
            <div class="container-settings">
                <h3 style="font-family: 'Kalin-Sansation';">AYARLAR</h3>
                <div class="inner-container">
                     <p style="font-family: 'Ince-Sansation';">Tema Değiştir</p>
                                                <!-- Tema Renk Seçimi -->
                    <div class="tema-panel">
                        <div class="tema" data-bg="#F5F7FA" data-text="#2C3E50" data-btn="#4A90E2" data-panel="#FFFFFF"></div>
                        <div class="tema" data-bg="#1E1E2F" data-text="#E0E0E0" data-btn="#3F51B5" data-panel="#2C2C3E"></div>
                        <div class="tema" data-bg="#626F47" data-text="#F5ECD5" data-btn="#A4B465" data-panel="#F0BB78"></div>
                        <div class="tema" data-bg="#FFFAF0" data-text="#6B4226" data-btn="#FFB6B9" data-panel="#FCD5CE"></div>
                        <div class="tema" data-bg="#ECEFF1" data-text="#263238" data-btn="#00BCD4" data-panel="#CFD8DC"></div>
                        <br />
                        <div class="tema" data-bg="#2D132C" data-text="#F3F3F3" data-btn="#A239CA" data-panel="#3C1053"></div>
                        <div class="tema" data-bg="#F0F5F1" data-text="#3D405B" data-btn="#81B29A" data-panel="#E6EBE0"></div>
                        <div class="tema" data-bg="#FFE5B4" data-text="#3C2F2F" data-btn="#FF6F61" data-panel="#FFDAB9"></div>
                        <div class="tema" data-bg="#E0F7FA" data-text="#01579B" data-btn="#0288D1" data-panel="#B2EBF2"></div>
                        <div class="tema" data-bg="#547792" data-text="#ECEFCA" data-btn="#94B4C1" data-panel="#213448"></div>
                        <br />
                        <div class="tema" data-bg="#06202B" data-text="#F5EEDD" data-btn="#077A7D" data-panel="#7AE2CF"></div>
                        <div class="tema" data-bg="#FFDF88" data-text="#A76545" data-btn="#FFA55D" data-panel="#ACC572"></div>
                        <div class="tema" data-bg="#67AE6E" data-text="#E1EEBC" data-btn="#90C67C" data-panel="#328E6E"></div>
                        <div class="tema" data-bg="#F2EFE7" data-text="#006A71" data-btn="#48A6A7" data-panel="#9ACBD0"></div>
                        <div class="tema" data-bg="#C68EFD" data-text="#FED2E2" data-btn="#8F87F1" data-panel="#E9A5F1"></div>
                        <br />
                        <div class="tema" data-bg="#706D54" data-text="#DBDBDB" data-btn="#A08963" data-panel="#C9B194"></div>
                        <div class="tema" data-bg="#7D0A0A" data-text="#EEEEEE" data-btn="#BF3131" data-panel="#EAD196"></div>
                        <div class="tema" data-bg="#2A004E" data-text="#F14A00" data-btn="#500073" data-panel="#C62300"></div>
                        <div class="tema" data-bg="#D84040" data-text="#A31D1D" data-btn="#ECDCBF" data-panel="#F8F2DE"></div>
                        <div class="tema" data-bg="#2D336B" data-text="#FED2E2" data-btn="#8F87F1" data-panel="#C68EFD"></div>
                        <br />
                        <div class="tema" data-bg="#CAE0BC" data-text="#780C28" data-btn="#6E8E59" data-panel="#EAFAEA"></div>
                        <div class="tema" data-bg="#E0A75E" data-text="#973131" data-btn="#F9D689" data-panel="#F5E7B2"></div>
                        <div class="tema" data-bg="#FEFFD2" data-text="#FF7D29" data-btn="#FFBF78" data-panel="#FEFFD2"></div>
                        <div class="tema" data-bg="#000000" data-text="#FFDEDE" data-btn="#CF0F47" data-panel="#FF0B55"></div>
                        <div class="tema" data-bg="#4F200D" data-text="#F6F1E9" data-btn="#FF8400" data-panel="#FFD93D"></div>
                    </div>
                                                <!--Panel Kapatma Butonu-->
                  
                    <asp:Button ID="btnClose" runat="server" Text="Kapat" OnClick="btnClose_Click" CssClass="close-button" />
                                            
                    </div>
                                                <!-- Kronometre Çalışma Süresi Ayarlama Bölümü -->
                    
                    <div class="inner-container">
                        <label for="txtTime" style="font-family: 'Ince-Sansation';">Süre (Dakika):</label>
                        <asp:TextBox ID="txtTime" runat="server" Text="25" CssClass="txtKronometre"></asp:TextBox>
                        <asp:Button ID="btnSetTime" runat="server" Text="Süreyi Ayarla" OnClick="btnSetTime_Click" CssClass="btnSureDegistirme" />
                    </div>
                                                <!-- Kronometre Mola Süresi Ayarlama Bölümü -->
                    
                    <div class="inner-container">
                        <label style="font-family: 'Ince-Sansation';">Mola Süresi (Dakika):</label>
                        <asp:TextBox ID="txtBreakTime" runat="server" CssClass="txtKronometre" Text="5" />
                        <asp:Button ID="btnSetBreakTime" runat="server" Text="Molayı Ayarla" OnClick="btnSetBreakTime_Click" CssClass="btnSureDegistirme" />
                    </div>
                    <div class="inner-container">
                                                <!-- Hakkımızda Butonu -->

                    <asp:Button ID="btnHakkimizda" Text="Hakkımızda" runat="server" CssClass="btnHakkimizdaCss" OnClick="btnHakkimizda_Click" />
                    </div>
            </div>
            </asp:Panel>

        <!-- MÜZİKLER DROPDOWNLİST BÖLÜMÜ -->

        <div class="mzk">
            <asp:DropDownList ID="ddlExample" runat="server" AutoPostBack="True" Width="100%" CssClass="ddl" OnSelectedIndexChanged="ddlExample_SelectedIndexChanged">
                <asp:ListItem Text="🎵 Müzik Listesini Seçin" Value="npl" />
                 <asp:ListItem Text="☕ Cafe De Beyoğlu" Value="playlist1" />
                 <asp:ListItem Text="🎹 Lofi Piano" Value="playlist2" />
                 <asp:ListItem Text="🏞️ Lofi Cafe" Value="playlist3" />
                 <asp:ListItem Text="📺 YouTube Lofi Çalma Listesi" Value="youtube" />
            </asp:DropDownList>
            <br />
            <br />
        <asp:Literal ID="ltIframe" runat="server"></asp:Literal>
        </div>
        <!-- KRONOMETRE BÖLÜMÜ -->

        <asp:Panel ID="pnlKronometre" runat="server" CssClass="kronometre">
            <asp:ScriptManager ID="ScriptManager1" runat="server" />
                <div class="kronometre-container">
                     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                        <h1 style="font-family: 'MyCustomFont', sans-serif;"> <asp:Label ID="lblTime" runat="server" Text="25:00"></asp:Label></h1>
                        <hr/>
                        <div style="margin: 10px 0; text-align: center;">
                            <asp:Label ID="lblStatus" runat="server" Text="Başla!" CssClass="kronometre-status" />
                </div>
                <div  class="kronometre-buttons"">
                        <asp:Button ID="btnStart" runat="server" Text="Başlat" OnClick="btnStart_Click" CssClass="btn-kronometre" />
                        <asp:Button ID="btnStop" runat="server" Text="Durdur" OnClick="btnStop_Click" CssClass="btn-kronometre" />
                        <asp:Button ID="btnReset" runat="server" Text="Sıfırla" OnClick="btnReset_Click" CssClass="btn-kronometre" />
                </div>
                        <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick" Enabled="false" />

                        </ContentTemplate>
                     </asp:UpdatePanel>
                </div>
        </asp:Panel>
        <!-- YAPILACAKLAR LİSTESİ KISMI -->
        <asp:Button ID="btnDeneme1" runat="server" Text="Yapılacaklar Listesi" CssClass="btnDeneme1Css" OnClick="btnTogglePanel_Click" />
            <div id="panelDeneme1" runat="server" class="panel1">
                <h2 style="font-family: 'Kalin-Sansation'; font-size: 32px;">Yapılacaklar Listesi</h2>
                <asp:TextBox ID="txtTask" runat="server" Width="300px" CssClass="txtToDoList" />
                <asp:Button ID="btnAdd" runat="server" Text="Ekle" OnClick="btnAdd_Click" CssClass="btnToDoListEkle" /><br />
                <br/>
                    <div class="todolist-countainer">
                        <asp:Repeater ID="rptTasks" runat="server">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkComplete" runat="server" AutoPostBack="true" OnCheckedChanged="chkComplete_CheckedChanged" Checked='<%# (bool)Eval("Completed") %>' />
                                <asp:Label ID="lblTask" runat="server" Text='<%# Eval("Text") %>' Style="font-size: 30px; font-family: 'Ince-Sansation'; color: var(--text-color);" CssClass='<%# ((bool)Eval("Completed")) ? "completed" : "" %>' />
                                <br/>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                <asp:Button ID="btnDeneme1Close" runat="server" Text="Kapat" CssClass="close-btn" OnClick="btnClosePanel_Click" />
            </div>
        <!-- OYUNLAR KISMI -->
        <asp:Button ID="btnDeneme2" runat="server" Text="Oyunlar" CssClass="btnDeneme2Css" OnClick="btnDeneme2_Click" />
        <asp:Panel ID="PanelBulmacaa" runat="server" CssClass="settings-panel-bulmaca">
            <asp:Button ID="btnDeneme2Close" runat="server" Text="Kapat" OnClick="btnDeneme2Close_Click" CssClass="close-button" />
                <asp:DropDownList ID="gddlgame" runat="server" AutoPostBack="True" OnSelectedIndexChanged="gddlgame_SelectedIndexChanged" CssClass="ddl_oyun">
                    <asp:ListItem Text="🎮 Oyun Seçin" Value="gameSelect" />
                    <asp:ListItem Text="🧩 Sudoku" Value="sudoku" />
                    <asp:ListItem Text="🐍 Yılan Oyunu" Value="snakeGame" />
                    <asp:ListItem Text="🀕 2048" Value="game2048" />
                    <asp:ListItem Text="🐦 Flappy Bird" Value="flapybird" />
                </asp:DropDownList>
                <div style="margin-top: 12px;">
                    <asp:Literal ID="Literal2" runat="server"></asp:Literal>
                </div>
        </asp:Panel>
        <!-- MOTİVE EDİCİ SÖZLER KISMI -->
        <asp:TextBox ID="txtSoz" runat="server" placeholder="Bir tane de sen bırak :)" CssClass="customTextbox" onfocus="selectText(this)" />

    </form>
</body>
</html>
