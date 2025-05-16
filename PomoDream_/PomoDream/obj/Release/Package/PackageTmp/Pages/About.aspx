<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="PomoDream.About" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Hakkımızda</title>
    <link href="../Css/about.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"/>
    <link rel="icon" type="image/png" href="../Images/logo.png" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="author" content="PomoDream Developers"/>

</head>
<body>
    <form id="form1" runat="server">
       <!--ANA KONTEYNIR-->

        <div class="main_countainer">
                        <!--TOPLU HAKKIMIZDA BÖLÜMÜ-->

                 <div class="about_us">
                     <h2 class="about_us_title">Hakkımızda</h2>
                     <p class="about_us_paragraph">
                     Bizler, Bilecik Şeyh Edebali Üniversitesi Pazaryeri Meslek Yüksekokulu, Bilgisayar Programcılığı ve İnternet ve Ağ bölümleri 2. sınıf öğrencileri olarak, Proje Tasarımı ve Uygulaması dersi kapsamında PomoDream adlı projeyi geliştirdik.
                     Projemiz, Pomodoro teknoloğisiyle çalışan uygulamalarda bulunan temel özellikleri birleştirerek, kullanıcılara daha zengin ve etkileşimli bir deneyim sunmayı amaçlamaktadır. Ayrıca, kullanıcıların daha fazla etkileşimde bulunabileceği ve kişisel tercihlerine göre özelleştirebileceği ekstra özellikler ekleyerek, estetik açıdan hoş bir arayüz ve kullanım açısından basit ama etkili bir yapı geliştirdik.
                     Projemizdeki temel hedefimiz, kullanıcılarımıza zaman yönetiminde yardımcı olacak güçlü bir araç sunarken, hem görsel açıdan zengin hem de kullanılabilirliği yüksek bir deneyim yaratmaktır.
                     </p>
                </div>      
                        <!--AYRI AYRI HAKKIMIZDA BÖLÜMÜ-->

                <div class="about_us_child">
                    <div class="about_single">
                        <h3 class="about_single_title">Ensar Ali Öztürk</h3>
                        <p class="about_single_paragraph">
                        Merhaba! Ben Ensar Ali Öztürk. Bu projede, hem frontend hem de backend taraflarında aktif bir şekilde görev alarak, uygulamanın tüm teknik alt yapısını geliştirmek ve kullanıcı deneyimini iyileştirmek adına çeşitli katkılarda bulundum. Hem görsel tasarım hem de uygulama mantığı gibi farklı alanlarda deneyim kazandım, bu sayede projenin her iki yönünde de önemli roller üstlendim.
                        </p>
                        <div class="button_field">
                        <a href="www.linkedin.com/in/ensar-ali-öztürk-44a04b346" target="_blank"><i class="fab fa-linkedin"></i></a>
                        <a href="https://github.com/ensar0zturk" target="_blank"><i class="fab fa-github"></i></a>
                        <a href="mailto:ensaraliozturk456@gmail.com" title="ensaraliozturk456@gmail.com"><i class="fas fa-envelope"></i></a>
                        <a href="https://www.instagram.com/ensar0zturk_/" target="_blank"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                    <div class="about_single">
                        <h3 class="about_single_title">Yusuf Tezgören</h3>
                        <p class="about_single_paragraph">
                        Bu projeyi ekip olarak geliştirirken hem ASP.NET Web Forms pratiği yapma hem de gerçek dünyaya yönelik bir uygulama geliştirme fırsatı bulduk. Süreç boyunca teknik ve problem çözme becerilerimi geliştirdim. Benim katkı sağladığım başlıca alanlar; tema renklerinin dinamik değiştirilmesini sağlayan CSS düzenlemeleri, C# tarafında Pomodoro süresinin bitiminde otomatik olarak molaya geçmesini ve mola süresi sonunda durmasını sağlayan zamanlayıcı mantığı oldu. Ayrıca iframe ile Spotify çalma listesi ve web tabanlı oyun gömme işlemlerini ben gerçekleştirdim. Bu süreçte takım çalışması ve bireysel sorumluluk alma konularında önemli deneyimler kazandım.    </p>
                        <div class="button_field">
                        <a href="https://www.linkedin.com/in/yusuf-tezgoren-226179331/" target="_blank"><i class="fab fa-linkedin"></i></a>
                        <a href="https://github.com/tezgoren" target="_blank"><i class="fab fa-github"></i></a>
                        <a href="mailto:tezgoren207@gmail.com" title="tezgoren207@gmail.com"><i class="fas fa-envelope"></i></a>
                        </div>
                    </div>
                    <div class="about_single">
                        <h3 class="about_single_title">Yusuf Uçar</h3>
                        <p class="about_single_paragraph">Web geliştirme alanına özellikle frontend tarafına ilgi duyuyorum ve bu alanda kendimi geliştirmek için çeşitli küçük projeler üzerinde çalıştım. Şu anda Flutter ile mobil uygulama geliştirmeye odaklanarak kullanıcı dostu ve modern arayüzler oluşturma konusunda deneyim kazanıyorum. Öğrenmeye açık yapım ve sürekli gelişim hedefimle yazılım dünyasında sağlam adımlarla ilerliyorum.
                        </p>
                        <div class="button_field">
                        <a href="https://www.linkedin.com/in/00yusufcr" target="_blank"><i class="fab fa-linkedin"></i></a>
                        <a href="https://github.com/zynoxus" target="_blank"><i class="fab fa-github"></i></a>
                        <a href="mailto:00yusufcr.uni@gmail.com " title="00yusufcr.uni@gmail.com "><i class="fas fa-envelope"></i></a>
                        </div>
                    </div>
                        <!--GERİ BİLDİRİM BÖLÜMÜ-->

                    <asp:Panel ID="pnlFeedback" runat="server" CssClass="feedback_container">
    <h2>Geri Bildirim</h2>
    <div class="stars">
        <asp:RadioButtonList ID="rblRating" runat="server" RepeatDirection="Horizontal">
            <asp:ListItem Value="1">★</asp:ListItem>
            <asp:ListItem Value="2">★★</asp:ListItem>
            <asp:ListItem Value="3">★★★</asp:ListItem>
            <asp:ListItem Value="4">★★★★</asp:ListItem>
            <asp:ListItem Value="5">★★★★★</asp:ListItem>
        </asp:RadioButtonList>
    </div>
    <div class="feedback_text">
        <asp:TextBox ID="txtFeedback" runat="server" TextMode="MultiLine" Rows="10" Columns="30" Placeholder="Görüşünüzü buraya yazabilirsiniz..." CssClass="txt_feedback" />
    </div>
    <asp:Button ID="btnSendFeedback" runat="server" Text="Gönder" CssClass="btn_feedback" OnClick="btnSendFeedback_Click" />
    <asp:Label ID="lblMessage" runat="server" ForeColor="Green" Font-Bold="true" />
    <div class="button_field">
        <!-- Diğer sosyal ikonlar da buraya eklenebilir -->
        <a href="Index.aspx" class="btnHome"><i class="fa fa-home"></i></a>
    </div>
</asp:Panel>
                </div>
        </div>
    </form>
</body>
</html>
