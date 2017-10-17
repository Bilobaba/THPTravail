require 'pry'
require 'gmail'
require_relative 'scrapper.rb'
require "google_drive"

# Creates a session. This will prompt the credential via command line for the
# first time and save it to config.json file for later usages.
# See this document to learn how to create config.json:
# https://github.com/gimite/google-drive-ruby/blob/master/doc/authorization.md
session = GoogleDrive::Session.from_config("config.json")


# url_dept = "http://annuaire-des-mairies.com/32"

puts "Ici 11"

# list_town_email = get_all_the_urls_townhalls(url_dept)

 list_town_email = {"paris" => "email@paris.fr", "lyon" => "email@lyon.fr", "marseille" => "email@marseille.fr"}


ws = session.spreadsheet_by_title("THP_mairies_emails").worksheets[0]


binding.pry

username = "thp.dragon.vert@gmail.com"
password = "Coucou123"
gmail = Gmail.connect(username, password)
# play with your gmail...

i = 1
p gmail.logged_in?
p gmail.inbox.count
#p gmail.inbox.count(:unread)
#p gmail.inbox.count(:read)

# binding.pry


gmail.deliver do
  to "duy.dang@wanadoo.fr"
  subject "Having fun in Puerto Rico!"
  text_part do
    body "Text of plaintext message."
  end
  html_part do
    content_type 'text/html; charset=UTF-8'
    body "<p>Text of <em>html</em> message.</p>"
  end
  add_file "thp_gmail.rb"
end

# binding.pry

puts "Entré !!!"
gmail.logout
