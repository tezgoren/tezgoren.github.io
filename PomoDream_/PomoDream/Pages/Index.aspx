<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="PomoDream.Index" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="description" content="Web tabanlı Pomodoro zamanlayıcısı ile verimli çalışın. 25 dakikalık odak süresi ve 5 dakikalık molalarla üretkenliğinizi artırın."/>
    <meta name="author" content="PomoDream Developers"/>
    <link href="../Css/main.css" rel="stylesheet" />
    <title>PomoDream</title>
    <script src="../Scripts/site.js" type="text/javascript"></script>
    <link rel="icon" type="image/png" href="../Images/logo.png" />
</head>
<body>
    <form id="form1" runat="server"> 
        <div class="top_buttons_box">
        <!-- Ayarlar Paneli -->
        <asp:Button ID="btnSettingsOpen" runat="server" Text="Ayarlar" OnClick="btnSettingsOpen_Click" CssClass="btn_settings_open" />
        <asp:Button ID="btnFullScreen" runat="server" Text="⛶" OnClientClick="toggleFullScreen(); return false;" CssClass="btn_full_screen" />
            
        <!-- MÜZİKLER DROPDOWNLİST BÖLÜMÜ -->
        <div class="music">
            <asp:DropDownList ID="ddlMusic" runat="server" AutoPostBack="True" Width="100%" CssClass="ddl_music" OnSelectedIndexChanged="ddlMusic_SelectedIndexChanged">
                <asp:ListItem Text="🎵 Müzik Listesini Seçin" Value="npl" />
                 <asp:ListItem Text="☕ Cafe De Beyoğlu" Value="playlist1" />
                 <asp:ListItem Text="🎹 Lofi Piano" Value="playlist2" />
                 <asp:ListItem Text="🏞️ Lofi Cafe" Value="playlist3" />
                 <asp:ListItem Text="📺 YouTube Lofi Çalma Listesi" Value="youtube" />
            </asp:DropDownList>
            <br />
            <br />
        <asp:Literal ID="ltMusicIframe" runat="server"></asp:Literal>
        </div></div>

        <!-- KRONOMETRE BÖLÜMÜ -->
        <div class="main_content_box">
        <asp:Panel ID="pnlKronometre" runat="server" CssClass="pnl_kronometre">
                <div class="kronometre_container">
                    <h1 style="font-family: 'MyCustomFont', sans-serif;"><span id="lblKronometreText">25:00</span></h1>
                    <hr/>
                    <div style="margin: 10px 0; text-align: center;">
                        <span id="lblKronometreStatusText" class="kronometre_status">Başla!</span>
                    </div>
                    <div class="kronometre_buttons">
                        <button id="btnKronometreStart" type="button" class="btn_kronometre">Başlat</button>
                        <button id="btnKronometreStop" type="button" class="btn_kronometre">Durdur</button>
                        <button id="btnKronometreReset" type="button" class="btn_kronometre">Sıfırla</button>
                    </div>
                </div>
        </asp:Panel></div>
        <div class="bottom_buttons_box">
            <!-- YAPILACAKLAR LİSTESİ KISMI -->
            <asp:Button ID="btnToDoListOpen" runat="server" Text="Yapılacaklar Listesi" CssClass="btn_todo_list_open" OnClick="btnToDoListOpen_Click" />
            <!-- MOTİVE EDİCİ SÖZLER KISMI -->
            <asp:TextBox ID="txtSoz" runat="server" placeholder="Bir tane de sen bırak :)" CssClass="txt_soz" onfocus="selectText(this)" />
            <!-- OYUNLAR KISMI -->
            <asp:Button ID="btnGamesOpen" runat="server" Text="Oyunlar" CssClass="btn_games_open" OnClick="btnGamesOpen_Click" />
        </div>






        <!-- Paneller  alta gelicek -->
        <!--ayarlar paneli-->
        <asp:Panel ID="pnlSettings" runat="server" CssClass="pnl_settings">
    <div class="container_settings">
        <h3 style="font-family: 'Kalin-Sansation';">AYARLAR</h3>
        <div class="container_inner">
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
          
            <asp:Button ID="btnSettingsClose" runat="server" Text="Kapat" OnClick="btnSettingsClose_Click" CssClass="btn_settings_close" />
                                    
            </div>
                                        <!-- Kronometre Çalışma Süresi Ayarlama Bölümü -->
            
            <div class="container_inner">
                <label for="txtTime" style="font-family: 'Ince-Sansation';">Süre (Dakika):</label>
                <asp:TextBox ID="txtWorkTimeSet" runat="server" Text="25" CssClass="txt_work_time_set"></asp:TextBox>
                <asp:Button ID="btnWorkTimeSet" runat="server" Text="Süreyi Ayarla" OnClick="btnWorkTimeSet_Click" CssClass="btn_time_set" />
            </div>
                                        <!-- Kronometre Mola Süresi Ayarlama Bölümü -->
            
            <div class="container_inner">
                <label style="font-family: 'Ince-Sansation';">Mola Süresi (Dakika):</label>
                <asp:TextBox ID="txtBreakTimeSet" runat="server" CssClass="txt_work_time_set" Text="5" />
                <asp:Button ID="btnBreakTimeSet" runat="server" Text="Molayı Ayarla" OnClick="btnBreakTimeSet_Click" CssClass="btn_time_set" />
            </div>
            <div class="container_inner">
                                        <!-- Hakkımızda Butonu -->

            <asp:Button ID="btnAbout" Text="Hakkımızda" runat="server" CssClass="btn_about" OnClick="btnAbout_Click" />
            </div>
    </div>
    </asp:Panel>

        <!-- todo list paneli -->
        <div id="plToDoList" runat="server" class="pnl_todo_list">
    <h2 style="font-family: 'Kalin-Sansation'; font-size: 32px;">Yapılacaklar Listesi</h2>
    <asp:TextBox ID="txtToDoList" runat="server" Width="300px" CssClass="txt_todo_list" />
    <asp:Button ID="btnToDoListTaskAdd" runat="server" Text="Ekle" OnClick="btnToDoListTaskAdd_Click" CssClass="btn_todo_list_add" /><br />
    <br/>
        <div class="todo_list_countainer">
            <asp:Repeater ID="rptToDoListTasks" runat="server">
                <ItemTemplate>
                    <asp:CheckBox ID="chkToDoListComplate" runat="server" AutoPostBack="true" OnCheckedChanged="chkToDoListComplate_CheckedChanged" Checked='<%# (bool)Eval("Completed") %>' />
                    <asp:Label ID="lblToDoListTask" runat="server" Text='<%# Eval("Text") %>' Style="font-size: 30px; font-family: 'Ince-Sansation'; color: var(--text-color);" CssClass='<%# ((bool)Eval("Completed")) ? "completed" : "" %>' />
                    <br/>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    <asp:Button ID="btnToDoListClose" runat="server" Text="Kapat" CssClass="btn_todo_list_close" OnClick="btnToDoListClose_Click" />
</div>
        <!--oyunlar paneli-->
        <asp:Panel ID="pnlGames" runat="server" CssClass="pnl_games">
    <asp:Button ID="btnGamesClose" runat="server" Text="Kapat" OnClick="btnGamesClose_Click" CssClass="btn_settings_close" />
        <asp:DropDownList ID="ddlGames" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlGames_SelectedIndexChanged" CssClass="ddl_games">
            <asp:ListItem Text="🎮 Oyun Seçin" Value="gameSelect" />
            <asp:ListItem Text="🧩 Sudoku" Value="sudoku" />
            <asp:ListItem Text="🐍 Yılan Oyunu" Value="snakeGame" />
            <asp:ListItem Text="🀕 2048" Value="game2048" />
            <asp:ListItem Text="🐦 Flappy Bird" Value="flapybird" />
        </asp:DropDownList>
        <div style="margin-top: 12px;">
            <asp:Literal ID="ltGames" runat="server"></asp:Literal>
        </div>
</asp:Panel>
    </form>
</body>
</html>
