
require 'watir'
require 'watir-scroll'

require 'pry'

class ClassTest
  def ici
    p "Ici"
  end
end

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
  find_key = false
  return if !string.include?("di")
  Key_words.each do |k|
    find_key ||= k.include?(string) unless string == ""
    # binding.pry
  end
  # p "find_key : #{find_key}, string : #{string}"
end


binding.pry

obj = ClassTest.new.ici

browser = Watir::Browser.new()
url = "https://www.marcsilvestre.com/agenda-cours-stages-1"
# url = "http://www.lesviesdansent.fr/crbst_16_m.html"
# url = "http://www.lesviesdansent.fr/index_m.html"
# url = "http://www.bodyvoiceandbeing.com/cours-et-ateliers"
browser.goto url

# binding.pry
browser.scroll.to [10, 100]
browser.scroll.to [10, 200]
browser.scroll.to [10, 300]
browser.scroll.to [10, 400]
browser.scroll.to [10, 500]
browser.scroll.to [10, 600]
browser.scroll.to [10, 700]
browser.scroll.to [10, 800]
browser.scroll.to [10, 900]
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
