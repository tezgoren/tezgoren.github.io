using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
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
        }

        // Ayarlar panelini açar
        protected void btnSettings_Click(object sender, EventArgs e)
        {
            pnlSettings.CssClass = "settings-panel open"; // Paneli aç
            btnSettings.Visible = false; // Ayarlar butonunu gizle
            btnMusic.Visible = false;
            btnPuzzles.Visible = false;
        }

        // Kapat butonuna tıklandığında paneli kapatır ve ayarlar butonunu tekrar gösterir
        protected void btnClose_Click(object sender, EventArgs e)
        {
            pnlSettings.CssClass = "settings-panel"; // Paneli kapat
            btnPuzzles.Visible = true; // Bulmacalar butonunu tekrar göster
            btnSettings.Visible = true;
            btnMusic.Visible = true;
        }

        // Aydınlık tema butonuna tıklandığında tema dosyasını değiştirir
        protected void btnLightTheme_Click(object sender, EventArgs e)
        {
            SetTheme("light-tema.css");  // Aydınlık tema
        }

        // Karanlık tema butonuna tıklandığında tema dosyasını değiştirir
        protected void btnDarkTheme_Click(object sender, EventArgs e)
        {
            SetTheme("dark-tema.css");   // Karanlık tema
        }

        // Tema dosyasını güncelleyen yardımcı metod
        private void SetTheme(string themeFileName)
        {
            // Sayfadaki link tag'inin href'ini değiştirir
            var themeLink = (HtmlLink)Page.Header.FindControl("themeLink");
            if (themeLink != null)
            {
                themeLink.Href = themeFileName;
            }
        }


        // Müzikler panelini açar
        protected void btnMusic_Click(object sender, EventArgs e)
        {
            pnlMusic.Visible = true;
        }

        // Müzikler panelini kapatır
        protected void btnCloseMusic_Click(object sender, EventArgs e)
        {
            pnlMusic.Visible = false;
        }

        // Bulmacalar panelini açar
        protected void btnPuzzles_Click(object sender, EventArgs e)
        {
            pnlPuzzles.Visible = true;
        }

        // Bulmacalar panelini kapatır
        protected void btnClosePuzzles_Click(object sender, EventArgs e)
        {
            pnlPuzzles.Visible = false;
        }

        // Kronometre başlangıç süresi ayarlama
        protected void btnSetTime_Click(object sender, EventArgs e)
        {
            int minutes = Convert.ToInt32(txtTime.Text);
            Session["timeLeft"] = minutes * 60;
            UpdateLabel();
        }

        // Kronometreyi başlatır
        protected void btnStart_Click(object sender, EventArgs e)
        {
            Timer1.Enabled = true;
        }

        // Kronometreyi durdurur
        protected void btnStop_Click(object sender, EventArgs e)
        {
            Timer1.Enabled = false;
        }

        // Kronometreyi sıfırlar
        protected void btnReset_Click(object sender, EventArgs e)
        {
            Session["timeLeft"] = 25 * 60;
            UpdateLabel();
        }

        // Kronometreyi her saniye günceller
        protected void Timer1_Tick(object sender, EventArgs e)
        {
            int timeLeft = (int)Session["timeLeft"];
            timeLeft--;
            Session["timeLeft"] = timeLeft;
            UpdateLabel();
            if (timeLeft <= 0)
            {
                Timer1.Enabled = false; // Zaman bittiğinde durdur
            }
        }

        // Kronometre etiketini günceller
        private void UpdateLabel()
        {
            int timeLeft = (int)Session["timeLeft"];
            int minutes = timeLeft / 60;
            int seconds = timeLeft % 60;
            lblTime.Text = $"{minutes:D2}:{seconds:D2}";
        }
        
        // Sayfa teması değiştirme
        private string BodyClassName
        {
            get { return (string)ViewState["BodyClassName"] ?? "light-theme"; }
            set { ViewState["BodyClassName"] = value; }
        }
    }
}
