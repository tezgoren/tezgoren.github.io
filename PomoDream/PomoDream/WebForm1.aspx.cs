using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PomoDream
{
    public partial class WebForm1 : System.Web.UI.Page
    {// Ayarlar butonuna tıklandığında paneli açar
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                Session["timeLeft"] = 25 * 60; // Varsayılan süre (25 dakika)
                UpdateLabel();
            }
            // Place page-specific code here.
        }
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

        protected void btnMusic_Click(object sender, EventArgs e)
        {
            pnlMusic.CssClass = "settings-panel open"; // Müzikler panelini aç
            btnSettings.Visible = false; // Ayarlar butonunu gizle
            btnMusic.Visible = false;
            btnPuzzles.Visible = false;
        }

        // Müzikler panelini kapat
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
            btnPuzzles.Visible = true; // Bulmacalar butonunu tekrar göste
            btnSettings.Visible=true;
            btnMusic.Visible=true;
        }
        protected void btnSetTime_Click(object sender, EventArgs e)
        {
            int minutes;
            if (int.TryParse(txtTime.Text, out minutes) && minutes > 0)
            {
                Session["timeLeft"] = minutes * 60;
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
            Session["timeLeft"] = int.Parse(txtTime.Text) * 60;
            UpdateLabel();
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


    }
}