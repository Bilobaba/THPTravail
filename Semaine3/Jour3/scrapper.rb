require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

$pages_visitees = []
$list_emails = {}
$nb_mails = 0



url_dept = "http://annuaire-des-mairies.com/32"


def get_the_email_of_a_townhall_from_its_webpage(url)

find_email = false
result_email = nil

begin
  page = Nokogiri::HTML(open(url))

  contents = page.css('.Style22')


  if contents.nil?
    puts "pas de mail sur :",url
    return
  end

  puts "recherche des mails sur :",url

#  binding.pry

  contents.each do |value|

#  binding.pry

    if value.text.include?("@")

#  binding.pry
      email = value.text
      mairie = url
      mairie = mairie[37..(mairie.size-6)].capitalize!

      $nb_mails += 1
      find_email = true

      result_email = { mairie => email }
      puts "Mairie :",mairie," email :",email
      puts "Nombre d email :", $nb_mails
    end

  end

  return result_email

rescue
  puts " Url n a pas pu etre ouvert :",url
end
end

def get_all_the_urls_townhalls(url)

begin


#  get_the_email_of_a_townhall_from_its_webpage(url)

puts "Ici 112",url

  puts "visite de :",url

  array_mairie_email = []

  page = Nokogiri::HTML(open(url))

  contents = page.css('a')

#binding.pry

  if !contents.nil?

    contents.each do |content|

      # nouveau lien
      new_url = "http://annuaire-des-mairies.com/32/" + content.attributes["href"].value
      mail_trouve = get_the_email_of_a_townhall_from_its_webpage(new_url)
      array_mairie_email = array_mairie_email << mail_trouve unless mail_trouve.nil?
    end
  end

# binding.pry

return array_mairie_email

rescue
  puts " Url n a pas pu etre ouvert :",url
end
end

# puts page.class   # => Nokogiri::HTML::Document

get_all_the_urls_townhalls(url_dept)

#binding.pry

puts "Fini"
