using System;
using System.Collections.Generic;
using System.Web;
using Microsoft.VisualBasic;
using System.Configuration;
using System.Net.Mail;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;





public class stdmail
{
    string strFrom;

    string strCcList;
    string strBccList;
    string strSubject;
    string strBody;

    bool IsBodyHtml;
    public stdmail()
    {
        strFrom = string.Empty;

        strCcList = string.Empty;
        strBccList = string.Empty;
        strSubject = string.Empty;
        strBody = string.Empty;
    }

    public string email_content(string body_text)
    {
        string email_content = string.Format(body_text);
        return email_content;
    }

    public bool SendEmail(string strTo, string strCcList, string strBccList, string strSubject, string strBody, bool IsBodyHtml)
    {
       bool status = false;

        this.strFrom = "CollegeSports";
        this.strCcList = strCcList;
        this.strBccList = strBccList;
        this.strSubject = strSubject;
        this.strBody = strBody;
        this.IsBodyHtml = IsBodyHtml;

        SmtpClient smtpSendMail = new SmtpClient();
        smtpSendMail.Port = 587;
        smtpSendMail.Host = "smtp.gmail.com";
        MailMessage objEmail = new MailMessage();
        objEmail.From = new MailAddress("pajimanmohan@gmail.com", strFrom);
      objEmail.To.Add(strTo);
        objEmail.Subject = strSubject;
        objEmail.Body = strBody;
        objEmail.IsBodyHtml = IsBodyHtml;
        smtpSendMail.EnableSsl = true;


        try
        {
            smtpSendMail.Credentials = new System.Net.NetworkCredential("pajimanmohan@gmail.com", "sushmit12");
            smtpSendMail.Send(objEmail);
             status = true;
        }
        catch (Exception e)
        {
             throw;
        }
        return true;
    }
}



