require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

$pages_visitees = []
$liste_emails = {}
$nb_mails = 0


def get_the_email_of_a_townhall_from_its_webpage(url)

begin
  page = Nokogiri::HTML(open(url))

  contents = page.css('.Style22')



  if contents.nil?
    puts "pas de mail sur :",url
    return
  end

  puts "recherche des mails sur :",url

  email = ""
  contents.each do |value|

    if !value.text.index("@").nil?
      email = value.text
      $nb_mails += 1
      puts " Email trouve ==================================================="
      puts email
      puts " Nb de mail :",$nb_mails," email : ", email
    end

  end
rescue
  puts " Url n a pas pu etre ouvert :",url
end
end

def get_all_the_urls_townhalls(url)

begin

  get_the_email_of_a_townhall_from_its_webpage(url)

  puts "visite de :",url
  $pages_visitees = $pages_visitees << url

  page = Nokogiri::HTML(open(url))

  contents = page.css('a')

#binding.pry

  if !contents.nil?

    contents.each do |content|

      # nouveau lien
      new_url = content.attributes["href"].value

#binding.pry

      # si nouveau lien en relatif
      if !new_url.include?(".com")
        new_url = url.reverse[url.reverse.index("/"),url.size].reverse +
                       new_url

        if !$pages_visitees.include?(new_url)
#binding.pry

          get_all_the_urls_townhalls(new_url)
        end

      # si nouveau lien absolu et different de l appelant
      elsif
#binding.pry

        new_url = url

        if !$pages_visitees.include?(new_url)
#binding.pry

          get_all_the_urls_townhalls(new_url)
        end
      end
    end
  end

#binding.pry

rescue
  puts " Url n a pas pu etre ouvert :",url
end
end


#url = "http://annuaire-des-mairies.com/val-d-oise.html"
url = "http://annuaire-des-mairies.com/"
# puts page.class   # => Nokogiri::HTML::Document

get_all_the_urls_townhalls(url)

#binding.pry

puts "Fini"
