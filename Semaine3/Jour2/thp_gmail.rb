require 'pry'
require 'gmail'
require_relative 'scrapper.rb'
require "google_drive"
require 'mail'



def send_email_to_line(ville,email,gmail)

  titre = "Nouveau à #{ville} : formation gratuite de programmation web 13"
  msg_txt = "Message plain text"
  msg_html = "<em> Bonjour, <br> <br> <p> Je m'appelle Danny, je suis élève à une formation de code gratuite,
                ouverte à tous, sans restriction géographique, ni restriction de niveau.
                La formation s'appelle The Hacking Project (http://thehackingproject.org/). </p>
                <p>
                Nous apprenons l'informatique via la méthode du peer-learning : nous faisons
                des projets concrets qui nous sont assignés tous les jours, sur lesquel nous
                planchons en petites équipes autonomes. Le projet du jour est d'envoyer des
                emails à nos élus locaux pour qu'ils nous aident à faire de The Hacking Project
                un nouveau format d'éducation gratuite. </p>
                <p>
                Nous vous contactons pour vous parler du projet, et vous dire que vous pouvez
                ouvrir une cellule à #{ville}, où vous pouvez former gratuitement 6 personnes
                (ou plus), qu'elles soient débutantes, ou confirmées. Le modèle d'éducation de
                The Hacking Project n'a pas de limite en terme de nombre de moussaillons (c'est
                comme cela que l'on appelle les élèves), donc nous serions ravis de travailler
                avec #{ville} ! </p>
                <p>
                Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos
                questions : 06.95.46.60.80 </p> </em> "

  gmail.deliver do
  to email
  subject titre
  reply_to "charles@thehackingproject.org"

  text_part do
    body msg_html

  end

  html_part do
    content_type 'text/html; charset=UTF-8'
#    body "<p>Text of <em>html</em> message.</p>"
    body "<p>" + msg_html + "</p>"
  end


  end

end


session = GoogleDrive::Session.from_config("config.json")


ws = session.spreadsheet_by_title("THP_mairies_emails").worksheets[0]

username = "thp.dragon.vert@gmail.com"
password = "Coucou123"

gmail = Gmail.connect(username, password)
# play with your gmail...

p gmail.logged_in?
p gmail.inbox.count

#p gmail.inbox.count(:unread)
#p gmail.inbox.count(:read)

# binding.pry



for i in 3..ws.rows.size

  ville = ws[i,1]
  email = ws[i,2]
  send_email_to_line(ville,email,gmail)

end




send_email_to_line("DangCity","tao.zen.duy@gmail.com",gmail)

gmail.logout
