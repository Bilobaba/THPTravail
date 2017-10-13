require 'watir'
require 'pry'

browser = Watir::Browser.new()
browser.goto 'google.com'
search_bar = browser.text_field(class: 'gsfi')
search_bar.set("Hello World!")

#méthode de la barre d'entrée
search_bar.send_keys(:enter)


browser.driver.manage.timeouts.implicit_wait = 10

search_result_divs_pn = browser.as(class: "pn")
search_result_divs_rc = browser.divs(class:"rc")

#binding.pry

search_result_divs_rc.each do |div|
  p div.h3.text
#binding.pry

end

binding.pry
p "Méfait accompli, fermeture du browser"
browser.close
