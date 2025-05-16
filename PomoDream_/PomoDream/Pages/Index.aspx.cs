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
            // MOTİVE EDİCİ SÖZ PAGE LOAD KISIMI
            if (!IsPostBack)
            {
                string yazi = RastgeleYaziGetir();
                txtSoz.Text = yazi;
            }
            
            // TO DO LİST PAGE LOAD KISIMI
            if (!IsPostBack)
            {
                BindTasks();
            }
        }
        
        // AYARLAR BUTONU / KAPATMA BUTONU VE PANELİ
        protected void btnSettingsOpen_Click(object sender, EventArgs e)
        {
            pnlSettings.CssClass = "pnl_settings open"; 
            btnSettingsOpen.Visible = false; 
        }

        protected void btnSettingsClose_Click(object sender, EventArgs e)
        {
            pnlSettings.CssClass = "pnl_settings"; 
            btnSettingsOpen.Visible = true;
        }

        // Kronometre süre ayarlama - JavaScript için değerleri hazırlıyor
        protected void btnWorkTimeSet_Click(object sender, EventArgs e)
        {
            // JavaScript kronometre kontrolü kullanıldığı için bu metot artık sadece
            // TextBox değerini ayarlıyor. Gerçek süre güncellemesi JS tarafında yapılıyor.
        }
        
        protected void btnBreakTimeSet_Click(object sender, EventArgs e)
        {
            // JavaScript kronometre kontrolü kullanıldığı için bu metot artık sadece
            // TextBox değerini ayarlıyor. Gerçek süre güncellemesi JS tarafında yapılıyor.
        }

        // YAPILACAKLAR LİSTESİ KISIMLARI
        protected void btnToDoListOpen_Click(object sender, EventArgs e)
        {
            string currentClass = plToDoList.Attributes["class"] ?? "";

            if (currentClass.Contains("active"))
                plToDoList.Attributes["class"] = "pnl_todo_list";
            else
                plToDoList.Attributes["class"] = "pnl_todo_list active"; 
            btnToDoListOpen.Visible = false;
            txtSoz.Visible = false;
            btnGamesOpen.Visible = false;
        }

        protected void btnToDoListClose_Click(object sender, EventArgs e)
        {
            plToDoList.Attributes["class"] = "pnl_todo_list"; 
            btnToDoListOpen.Visible = true;
            txtSoz.Visible = true;
            btnGamesOpen.Visible = true;
        }
        
        protected void btnToDoListTaskAdd_Click(object sender, EventArgs e)
        {
            string newTask = txtToDoList.Text.Trim();
            if (!string.IsNullOrEmpty(newTask))
            {
                Tasks.Add(new TaskItem { Text = newTask, Completed = false });
                txtToDoList.Text = "";
                BindTasks();
            }
        }

        protected void chkToDoListComplate_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox chk = (CheckBox)sender;
            RepeaterItem item = (RepeaterItem)chk.NamingContainer;
            int index = item.ItemIndex;

            Tasks[index].Completed = chk.Checked;
            BindTasks();
        }

        private void BindTasks()
        {
            rptToDoListTasks.DataSource = Tasks;
            rptToDoListTasks.DataBind();
        }

        // OYUNLAR KISIMI
        protected void btnGamesOpen_Click(object sender, EventArgs e)
        {
            pnlGames.CssClass = "pnl_games open";
            btnGamesOpen.Visible = false;
        }

        protected void btnGamesClose_Click(object sender, EventArgs e)
        {
            pnlGames.CssClass = "pnl_games";
            btnGamesOpen.Visible = true;
        }
        
        protected void ddlGames_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedValue = ddlGames.SelectedValue;
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

            ltGames.Text = iframeHtml;
        }
        
        // MÜZİK KISIMI
        protected void ddlMusic_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedValue = ddlMusic.SelectedValue;
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

            ltMusicIframe.Text = iframeHtml;
            ddlMusic.Items[0].Enabled = false;
        }
        
        // MOTİVE SÖZLER KISIMI
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
            int indeks = rnd.Next(yazilar.Count); 

            return yazilar[indeks];
        }
       
        // HAKKIMIZDA BUTONU KISIMI
        protected void btnAbout_Click(object sender, EventArgs e)
        {
            // Tam yolu kullanarak yönlendirme yapalım
            Response.Redirect("~/Pages/About.aspx");
        }
    }
}