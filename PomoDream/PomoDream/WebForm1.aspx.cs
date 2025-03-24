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
    }
}
