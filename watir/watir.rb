
require 'watir'
require 'watir-scroll'

require 'pry'


Key_words = [
              "lundi",
              "mardi",
              "mercredi",
              "jeudi",
              "vendredi",
              "samedi",
              "dimanche"
            ]

def find_key(string)
  return true
  find_key = false
  return if !string.include?("di")
  Key_words.each do |k|
    find_key ||= k.include?(string) unless string == ""
    # binding.pry
  end
  # p "find_key : #{find_key}, string : #{string}"
end

browser = Watir::Browser.new()
# url = "https://www.marcsilvestre.com/agenda-cours-stages-1"
# url = "http://www.lesviesdansent.fr/crbst_16_m.html"
# url = "http://www.lesviesdansent.fr/index_m.html"
url = "http://www.bodyvoiceandbeing.com/cours-et-ateliers"
browser.goto url

# binding.pry

browser.scroll.to :bottom


list = browser.spans

# binding.pry
find_count = 0
list.each do |e|

  if 0 == e.text.size then next end

  if find_key(e.text.downcase)
    find_count +=1
    p " texte trouve #{e.text}"
  end
end

p "find count : #{find_count}"

# binding.pry

puts "Fin"
