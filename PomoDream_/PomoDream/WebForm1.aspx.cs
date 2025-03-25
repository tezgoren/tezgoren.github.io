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
        }

        protected void btnSettings_Click(object sender, EventArgs e)
        {
            pnlSettings.CssClass = "settings-panel open"; // Paneli aç
            btnSettings.Visible = false; // Ayarlar butonunu gizle
            btnMusic.Visible = false;
            btnPuzzles.Visible = false;
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            pnlSettings.CssClass = "settings-panel"; // Paneli kapat
            btnPuzzles.Visible = true; // Bulmacalar butonunu tekrar göster
            btnSettings.Visible = true;
            btnMusic.Visible = true;
        }

        protected void btnMusic_Click(object sender, EventArgs e)
        {
            pnlMusic.CssClass = "settings-panel open"; // Müzikler panelini aç
            btnSettings.Visible = false; // Ayarlar butonunu gizle
            btnMusic.Visible = false;
            btnPuzzles.Visible = false;
        }

        protected void btnCloseMusic_Click(object sender, EventArgs e)
        {
            pnlMusic.CssClass = "settings-panel"; // Müzikler panelini kapat
            btnPuzzles.Visible = true; // Bulmacalar butonunu tekrar göster
            btnSettings.Visible = true;
            btnMusic.Visible = true;
        }

        protected void btnPuzzles_Click(object sender, EventArgs e)
        {
            pnlPuzzles.CssClass = "settings-panel open"; // Bulmacalar panelini aç
            btnSettings.Visible = false; // Ayarlar butonunu gizle
            btnMusic.Visible = false;
            btnPuzzles.Visible = false;
        }

        protected void btnClosePuzzles_Click(object sender, EventArgs e)
        {
            pnlPuzzles.CssClass = "settings-panel"; // Bulmacalar panelini kapat
            btnPuzzles.Visible = true;
            btnSettings.Visible = true;
            btnMusic.Visible = true;
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
            ViewState["backgroundColor"] = "blue"; // Arka plan rengini mavi yap
        }

        protected void btnRenkDegisimiIki_Click(object sender, EventArgs e)
        {
            ViewState["backgroundColor"] = "green"; // Arka plan rengini yeşil yap
        }

        protected void btnRenkDegisimiUc_Click(object sender, EventArgs e)
        {
            ViewState["backgroundColor"] = "mediumturquoise"; // Arka plan rengini turkuaz yap
        }
    }
}
