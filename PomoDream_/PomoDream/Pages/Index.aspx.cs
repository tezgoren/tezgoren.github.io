using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PomoDream
{
    public partial class Index : System.Web.UI.Page
    {
        [Serializable]
        public class TaskItem
        {
            public string Text { get; set; }
            public bool Completed { get; set; }
        }

        // ViewState ile listeyi sakla
        private List<TaskItem> Tasks
        {
            get
            {
                if (ViewState["Tasks"] == null)
                    ViewState["Tasks"] = new List<TaskItem>();
                return (List<TaskItem>)ViewState["Tasks"];
            }
            set
            {
                ViewState["Tasks"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["timeLeft"] = 25 * 60; // Varsayılan süre 25 dakika
                UpdateLabel();
            }


            if (!IsPostBack)
            {
                string yazi = RastgeleYaziGetir();
                txtSoz.Text = yazi;
            }
            if (!IsPostBack)
            {
                BindTasks();
            }

        }

        protected void btnSettings_Click(object sender, EventArgs e)
        {
            pnlSettings.CssClass = "settings-panel open"; // Paneli aç
            btnSettings.Visible = false; // Ayarlar butonunu gizle

        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            pnlSettings.CssClass = "settings-panel"; // Paneli kapat
            btnSettings.Visible = true;
        }




        protected void btnClosePuzzles_Click(object sender, EventArgs e)
        {
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
            lblStatus.Text = "Çalış!";
        }

        protected void btnStop_Click(object sender, EventArgs e)
        {
            Timer1.Enabled = false;
            lblStatus.Text = ""; // Zamanlayıcı durduğunda yazıyı temizle
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            int time;
            if (int.TryParse(txtTime.Text, out time))
            {
                Session["timeLeft"] = time * 60;
                UpdateLabel();
                Timer1.Enabled = false;
                lblStatus.Text = ""; // Zamanlayıcı sıfırlandığında yazıyı temizle
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
                bool isBreak = Session["isBreak"] != null && (bool)Session["isBreak"];

                if (!isBreak)
                {
                    // Çalışma süresi bitti, mola başlat
                    int breakDuration = Session["breakDuration"] != null ? (int)Session["breakDuration"] : 5 * 60;
                    Session["timeLeft"] = breakDuration;
                    Session["isBreak"] = true;
                    lblStatus.Text = "Mola!";  // Mola yazısı
                }
                else
                {
                    // Mola bitti, yeniden çalışma süresine dön
                    int workTime = int.TryParse(txtTime.Text, out int t) ? t : 25;
                    Session["timeLeft"] = workTime * 60;
                    Session["isBreak"] = false;
                    lblStatus.Text = "Çalış!";  // Çalışma yazısı
                }

                UpdateLabel();
                Timer1.Enabled = true; // Tekrar başlat
            }
        }


        protected void btnSetBreakTime_Click(object sender, EventArgs e)
        {
            int breakTime;
            if (int.TryParse(txtBreakTime.Text, out breakTime) && breakTime > 0)
            {
                Session["breakDuration"] = breakTime * 60;
            }
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
            btnDeneme2.Visible = true;
        }

        protected void btnDeneme2_Click(object sender, EventArgs e)
        {
            PanelBulmacaa.CssClass = "settings-panel-bulmaca open";
            btnDeneme2.Visible = false;
            
        }

        protected void btnDeneme2Close_Click(object sender, EventArgs e)
        {
            // Direkt kapat
            PanelBulmacaa.CssClass = "settings-panel-bulmaca";
            btnDeneme2.Visible = true;
            
        }
        protected void ddlExample_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedValue = ddlExample.SelectedValue;
            string iframeHtml = "";

            if (selectedValue == "playlist1")
            {
                iframeHtml = "<iframe style=\"border-radius:12px\" src=\"https://open.spotify.com/embed/album/6hvscao6RbBw0o5beXiNoy?utm_source=generator&theme=0\" width=\"100%\" height=\"152\" frameBorder=\"0\" allowfullscreen=\"\" allow=\"autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture\" loading=\"lazy\"></iframe>";
            }
            else if (selectedValue == "playlist2")
            {
                iframeHtml = "<iframe style=\"border-radius:12px\" src=\"https://open.spotify.com/embed/playlist/37i9dQZF1DWZGf5qyZ9Bl3?utm_source=generator&theme=0\" width=\"100%\" height=\"152\" frameBorder=\"0\" allowfullscreen=\"\" allow=\"autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture\" loading=\"lazy\"></iframe>";
            }
            else if (selectedValue == "playlist3")
            {
                iframeHtml = "<iframe style=\"border-radius:12px\" src=\"https://open.spotify.com/embed/playlist/37i9dQZF1DX9RwfGbeGQwP?utm_source=generator&theme=0\" width=\"100%\" height=\"152\" frameBorder=\"0\" allowfullscreen=\"\" allow=\"autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture\" loading=\"lazy\"></iframe>";
            }
            else if (selectedValue == "youtube")
            {
                iframeHtml = "<iframe width=\"100%\" height=\"212\" src=\"https://www.youtube.com/embed/videoseries?si=2vhzZSFp7WPncJK3&amp;list=PLbPqG08ImzRhcK_7H53Qn2DwtbqeysQj3\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>\r\n";
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
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string newTask = txtTask.Text.Trim();
            if (!string.IsNullOrEmpty(newTask))
            {
                Tasks.Add(new TaskItem { Text = newTask, Completed = false });
                txtTask.Text = "";
                BindTasks();
            }
        }

        protected void chkComplete_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox chk = (CheckBox)sender;
            RepeaterItem item = (RepeaterItem)chk.NamingContainer;
            int index = item.ItemIndex;

            Tasks[index].Completed = chk.Checked;
            BindTasks();
        }

        private void BindTasks()
        {
            rptTasks.DataSource = Tasks;
            rptTasks.DataBind();
        }

        protected void gddlgame_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedValue = gddlgame.SelectedValue;
            string iframeHtml = "";

            if (selectedValue == "sudoku")
            {
                iframeHtml = "<iframe src='//widget.websudoku.com/?level=1' width=\"100%\" height='600' scrolling='no' frameborder='0'></iframe>";
            }
            else if (selectedValue == "snakeGame")
            {
                iframeHtml = "<iframe src='https://www.snakegame.net/' width=\"100%\" height='600' style='border:none;'></iframe>";
            }
            else if (selectedValue == "game2048")
            {
                iframeHtml = "<iframe src =\"https://2048game.com/\" width=\"100%\" height=\"600\" frameborder=\"0\"></iframe>\r\n";
            }
            else if (selectedValue == "flapybird")
            {
                iframeHtml = "<iframe src=\"https://flappybird.io/\" width=\"100%\" height=\"600\" frameborder=\"0\"></iframe>\r\n";
            }

            Literal2.Text = iframeHtml;

        }

        protected void btnHakkimizda_Click(object sender, EventArgs e)
        {
            Response.Redirect("About.aspx");
        }
    }
}