require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

$pages_visitees = []
$liste_emails = {}
$nb_mails = 0


def get_the_email_of_a_townhall_from_its_webpage(url)

  page = Nokogiri::HTML(open(url))

  contents = page.css('.Style22')

  if contents.nil?
    return
  end


  email = ""
  contents.each do |value|

    if !value.text.index("@").nil?
      email = value.text
      $nb_mails += 1
      puts " Nb de mail :",$nb_mails," email : ", email
    end

  end

 end

def get_all_the_urls_of_val_doise_townhalls(url)

  puts "visite de :",url
  page = Nokogiri::HTML(open(url))

  contents = page.css('a')
  $pages_visitees = $pages_visitees << url

  if !contents.nil?

    contents.each do |content|

      # nouveau lien
      new_url = content.attributes["href"].value

      # si nouveau lien en relatif
      if !new_url.include?("www")
        new_url = url.reverse[url.reverse.index("/"),url.size].reverse +
                       new_url

        if !$pages_visitees.include?(new_url)
          get_the_email_of_a_townhall_from_its_webpage(new_url)
        end

      # si nouveau lien absolu et different de l appelant
      elsif
        new_url = url

        if !$pages_visitees.include?(new_url)
          get_the_email_of_a_townhall_from_its_webpage(new_url)
        end
      end
    end
  end

end


url = "http://annuaire-des-mairies.com/val-d-oise.html"
# url = "http://annuaire-des-mairies.com/"
# puts page.class   # => Nokogiri::HTML::Document

get_all_the_urls_of_val_doise_townhalls(url)

binding.pry

puts "Fini"
