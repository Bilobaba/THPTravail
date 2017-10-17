require 'pry'
require 'gmail'
require 'scrapper.rb'

username = "salut.bilobaba@gmail.com"
password = "Bilobaba12345"


list_town_email = get_all_the_urls_townhalls(url_dept)

puts "Ici 1"

binding.pry

puts "Ici 2"
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
