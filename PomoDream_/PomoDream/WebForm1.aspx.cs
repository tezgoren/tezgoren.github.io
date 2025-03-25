using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace PomoDream
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        // Sayfa yüklendiğinde, varsayılan süreyi ayarlıyoruz.
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["timeLeft"] = 25 * 60; // Varsayılan süre (25 dakika)
                UpdateLabel();
            }
<<<<<<< HEAD
            // Place page-specific code here.
            // Page_Load içinde, ViewState'de renk kontrolü yaparak arka plan rengini uygula
            if (ViewState["backgroundColor"] != null)
            {
                string color = ViewState["backgroundColor"].ToString();
                string script = $"document.body.style.backgroundColor = '{color}';";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "changeColor", script, true);
            }
=======
>>>>>>> 917a7f74c83d49fa27d37f761ccb0ed5cc4fa0a5
        }

        // Ayarlar panelini açar
        protected void btnSettings_Click(object sender, EventArgs e)
        {
            pnlSettings.CssClass = "settings-panel open"; // Paneli aç
            btnSettings.Visible = false; // Ayarlar butonunu gizle
        }

        // Kapat butonuna tıklandığında paneli kapatır
        protected void btnCloseSettings_Click(object sender, EventArgs e)
        {
            pnlSettings.CssClass = "settings-panel"; // Paneli kapat
            btnSettings.Visible = true; // Ayarlar butonunu tekrar göster
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

        // Kronometreyi günceller
        private void UpdateLabel()
        {
            int timeLeft = (int)Session["timeLeft"];
            int minutes = timeLeft / 60;
            int seconds = timeLeft % 60;
            lblTime.Text = $"{minutes:D2}:{seconds:D2}";
        }
<<<<<<< HEAD

        protected void btnRenkDegisimiBir_Click(object sender, EventArgs e)
        {
            string color = "blue";  // Mavi renk
            ViewState["backgroundColor"] = color;

            // Sayfanın arka planını JavaScript ile değiştir
            string script = $"document.body.style.backgroundColor = '{color}';";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "changeColorBlue", script, true);
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
            string color = "#80CBC4";  // Yeşil renk
            ViewState["backgroundColor"] = color;

            // Sayfanın arka planını JavaScript ile değiştir
            string script = $"document.body.style.backgroundColor = '{color}';";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "changeColorGreen", script, true);

        }
=======
>>>>>>> 917a7f74c83d49fa27d37f761ccb0ed5cc4fa0a5
    }
}
