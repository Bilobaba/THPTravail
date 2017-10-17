require 'pry'
require 'gmail'
require_relative 'scrapper.rb'
require "google_drive"



url_dept = "http://annuaire-des-mairies.com/32"

list_town_emails = get_all_the_urls_townhalls(url_dept)

# binding.pry

# list_town_emails = {"lyon" => "email@lyon.fr", "paris" => "email@paris.fr", "marseille" => "email@marseille.fr"}

# binding.pry

session = GoogleDrive::Session.from_config("config.json")

# binding.pry

ws = session.spreadsheet_by_title("THP_mairies_emails").worksheets[0]
i = 1
list_town_emails.each do |key,value|

  ws[i,1] = key
  ws[i,2] = value
  i+=1

end

ws.save
