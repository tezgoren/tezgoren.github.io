using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PomoDream
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        // Ayarlar butonuna tıklandığında paneli açar
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["timeLeft"] = 25 * 60; // Varsayılan süre (25 dakika)
                UpdateLabel();
            }
            // Sayfanın arka plan rengini ayarlama
            if (ViewState["backgroundColor"] != null)
            {
                string color = ViewState["backgroundColor"].ToString();
                string script = $"document.body.style.backgroundColor = '{color}';";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "changeColor", script, true);
            }
            if (!IsPostBack)
            {
                string yazi = RastgeleYaziGetir();
                txtSoz.Text = yazi;
            }

        }

        protected void btnSettings_Click(object sender, EventArgs e)
        {
            pnlSettings.CssClass = "settings-panel open"; // Paneli aç
            btnSettings.Visible = false; // Ayarlar butonunu gizle
            btnPuzzles.Visible = false;
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            pnlSettings.CssClass = "settings-panel"; // Paneli kapat
            btnPuzzles.Visible = true; // Bulmacalar butonunu tekrar göster
            btnSettings.Visible = true;
        }

        

        protected void btnPuzzles_Click(object sender, EventArgs e)
        {
            pnlPuzzles.CssClass = "settings-panel open"; // Bulmacalar panelini aç
            btnSettings.Visible = false; // Ayarlar butonunu gizle
            btnPuzzles.Visible = false;
        }

        protected void btnClosePuzzles_Click(object sender, EventArgs e)
        {
            pnlPuzzles.CssClass = "settings-panel"; // Bulmacalar panelini kapat
            btnPuzzles.Visible = true;
            btnSettings.Visible = true;
        }

        // Zamanlayıcı fonksiyonları
        protected void btnSetTime_Click(object sender, EventArgs e)
        {
            int time;
            if (int.TryParse(txtTime.Text, out time))
            {
                Session["timeLeft"] = time * 60;
                UpdateLabel();
            }
        }

        protected void btnStart_Click(object sender, EventArgs e)
        {
            Timer1.Enabled = true;
        }

        protected void btnStop_Click(object sender, EventArgs e)
        {
            Timer1.Enabled = false;
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            int time;
            if (int.TryParse(txtTime.Text, out time))
            {
                Session["timeLeft"] = time * 60;
                UpdateLabel();
                Timer1.Enabled = false;
            }
        }

        private void UpdateLabel()
        {
            int timeLeft = (int)Session["timeLeft"];
            int minutes = timeLeft / 60;
            int seconds = timeLeft % 60;
            lblTime.Text = $"{minutes:D2}:{seconds:D2}";
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            int timeLeft = (int)Session["timeLeft"];
            if (timeLeft > 0)
            {
                timeLeft--;
                Session["timeLeft"] = timeLeft;
                UpdateLabel();
            }
            else
            {
                Timer1.Enabled = false; // Zaman dolduğunda durdur
            }
        }

        // Butonlara renk değişikliği işlemleri
        protected void btnRenkDegisimiBir_Click(object sender, EventArgs e)
        {
          
            string color = "blue";  // Yeşil renk
            ViewState["backgroundColor"] = color;

            // Sayfanın arka planını JavaScript ile değiştir
            string script = $"document.body.style.backgroundColor = '{color}';";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "changeColorGreen", script, true);
        }

        protected void btnRenkDegisimiIki_Click(object sender, EventArgs e)
        {
            string color = "green";  // Yeşil renk
            ViewState["backgroundColor"] = color;

            // Sayfanın arka planını JavaScript ile değiştir
            string script = $"document.body.style.backgroundColor = '{color}';";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "changeColorGreen", script, true);
        }

        protected void btnRenkDegisimiUc_Click(object sender, EventArgs e)
        {
            string color = "orange";  // Yeşil renk
            ViewState["backgroundColor"] = color;

            // Sayfanın arka planını JavaScript ile değiştir
            string script = $"document.body.style.backgroundColor = '{color}';";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "changeColorGreen", script, true);
        }
        protected void btnTogglePanel_Click(object sender, EventArgs e)
        {
            string currentClass = panelDeneme1.Attributes["class"] ?? "";

            if (currentClass.Contains("active"))
                panelDeneme1.Attributes["class"] = "panel1"; // Gizle
            else
                panelDeneme1.Attributes["class"] = "panel1 active"; // Göster
            btnDeneme1.Visible = false;
            txtSoz.Visible = false;
            btnDeneme2.Visible = false;
        }

        protected void btnClosePanel_Click(object sender, EventArgs e)
        {
            // Direkt kapat
            panelDeneme1.Attributes["class"] = "panel1"; // Direkt gizle
            btnDeneme1.Visible = true;
            txtSoz.Visible = true;
            btnDeneme2.Visible=true;
        }

        protected void btnDeneme2_Click(object sender, EventArgs e)
        {
            if (panelDeneme2.Attributes["class"].Contains("active"))
            {
                // Panel açıksa kapat
                panelDeneme2.Attributes["class"] = "panel1";
            }
            else
            {
                // Panel kapalıysa aç
                panelDeneme2.Attributes["class"] = "panel1 active";
            }
            btnDeneme2.Visible = false;
            txtSoz.Visible = false;
        }

        protected void btnDeneme2Close_Click(object sender, EventArgs e)
        {
            // Direkt kapat
            panelDeneme2.Attributes["class"] = "panel1";
            btnDeneme2.Visible = true;
            txtSoz.Visible = true;
        }
        protected void ddlExample_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedValue = ddlExample.SelectedValue;
            string iframeHtml = "";

            if (selectedValue == "playlist1")
            {
                iframeHtml = "<iframe style=\"border-radius:12px\" src=\"https://open.spotify.com/embed/album/6hvscao6RbBw0o5beXiNoy?utm_source=generator\" width=\"100%\" height=\"250\" frameBorder=\"0\" allowfullscreen=\"\" allow=\"autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture\" loading=\"lazy\"></iframe>";
            }
            else if (selectedValue == "playlist2")
            {
                iframeHtml = "<iframe style=\"border-radius:12px\" src=\"https://open.spotify.com/embed/playlist/37i9dQZF1DWZGf5qyZ9Bl3?utm_source=generator\" width=\"100%\" height=\"250\" frameBorder=\"0\" allowfullscreen=\"\" allow=\"autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture\" loading=\"lazy\"></iframe>";
            }
            else if (selectedValue == "playlist3")
            {
                iframeHtml = "<iframe style=\"border-radius:12px\" src=\"https://open.spotify.com/embed/playlist/37i9dQZF1DX9RwfGbeGQwP?utm_source=generator\" width=\"100%\" height=\"250\" frameBorder=\"0\" allowfullscreen=\"\" allow=\"autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture\" loading=\"lazy\"></iframe>";
            }

            ltIframe.Text = iframeHtml;
            ddlExample.Items[0].Enabled = false;
        }
        private string RastgeleYaziGetir()
        {
            List<string> yazilar = new List<string>
            {
                "Başarı, sabır ve azimle gelir.",
                "Hayallerine inan, çünkü onlar seni geleceğine taşır.",
                "Bugün yaptığın şey yarının temelini oluşturur.",
                "Başarı, asla pes etmeyenlerindir.",
                "Her düşüş bir ders, her kalkış bir zaferdir.",
                "Kendi hikayenin kahramanı ol.",
                "Başarı, hazırlık ve fırsatın kesiştiği yerdedir.",
                "Büyük başarılar, küçük ama tutarlı adımlarla gelir.",
                "Yol uzun olabilir, ama her adım seni zirveye taşır.",
                "Düşüncelerine dikkat et, çünkü onlar senin geleceğindir.",
                "Küçük bir adım bile büyük değişiklikler yaratabilir.",
                "Hata yapmaktan korkma, çünkü onlar başarının anahtarıdır.",
                "Düşüncelerini değiştir, hayatın değişsin.",
                "Her sabah yeni bir başlangıçtır.",
                "En karanlık anların arkasında ışık vardır.",
                "Bir fikrin varsa, ona inan ve peşinden git.",
                "Hayallerini gerçekleştirmek için bugün bir adım at.",
                "Korkuların seni durdurmasına izin verme.",
                "Zorluklar, başarının habercisidir.",
                "Hayatta ne kadar ileri gideceğin, cesaretine bağlıdır.",
                "Pozitif bir zihin, pozitif bir hayat yaratır.",
                "Hayatta en önemli şey, kendi şansını yaratmaktır.",
                "Her yeni gün, yeni bir fırsat getirir.",
                "Gülümsemek, en güzel enerjidir.",
                "Hayat, sen ne düşünüyorsan onu sana geri verir.",
                "Kendine inan; bu, başarının yarısıdır.",
                "Zorluklar seni daha güçlü yapar.",
                "Her düşüş, kalkmak için bir fırsattır.",
                "Küçük mutluluklar, büyük mutlulukları getirir.",
                "Hayatın her anı bir hediyedir.",
                "Yapamazsın diyenlere inat, yap!",
                "Hayal etmekten asla vazgeçme.",
                "Sen başarırsan, herkes sustuğunda kazanırsın.",
                "Hedefine odaklan, gerisi kendiliğinden gelir.",
                "Engeller, başarı yolunda sadece bir merdivendir.",
                "Kıçıktüm ama şimdi buradayım; her şey mümkün.",
                "Kendi potansiyelini keşfetmeden asla pes etme.",
                "Hiçbir zafer, savaşmadan kazanılmaz.",
                "Sen yeter ki iste; imkansız diye bir şey yoktur.",
                "İnanırsan, yaparsın!"
            };

            Random rnd = new Random();
            int indeks = rnd.Next(yazilar.Count); // 0 ile yazilar.Count - 1 arasında

            return yazilar[indeks];
        }


    }
}
