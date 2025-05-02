using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PomoDream
{
    public partial class About : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }



        protected void btnSendFeedback_Click(object sender, EventArgs e)
        {
            string rating = rblRating.SelectedValue; // RadioButtonList kontrolü
            string feedback = txtFeedback.Text; // Geri bildirim TextBox'ı

            if (string.IsNullOrEmpty(rating) || string.IsNullOrEmpty(feedback))
            {
                lblMessage.Text = "Lütfen hem puan verin hem de geri bildiriminizi yazın.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string toEmail = "pomodream@gmail.com";
            string fromEmail = "pomodream@gmail.com"; // Gönderen de aynı
            string appPassword = "subl yqjy hudg jfdd"; // Buraya Gmail'den aldığın uygulama şifresi gelecek

            string subject = "Yeni Kullanıcı Geri Bildirimi - PomoDream";
            string body = $"<h3>⭐ Puan: {rating}/5</h3><p><strong>Geri Bildirim:</strong><br/>{feedback}</p>";

            try
            {
                MailMessage mail = new MailMessage();
                mail.From = new MailAddress(fromEmail);
                mail.To.Add(toEmail);
                mail.Subject = subject;
                mail.Body = body;
                mail.IsBodyHtml = true;

                SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                smtp.Credentials = new NetworkCredential(fromEmail, appPassword);
                smtp.EnableSsl = true;

                smtp.Send(mail);
                lblMessage.Text = "Teşekkür ederiz! Geri bildiriminiz başarıyla gönderildi.";
                lblMessage.ForeColor = System.Drawing.Color.Green;

                txtFeedback.Text = "";
                rblRating.ClearSelection();
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Bir hata oluştu: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

    }
}