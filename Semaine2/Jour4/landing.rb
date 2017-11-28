require 'nokogiri'
require 'pry'


doc = Nokogiri::HTML(open('https://checkr.com'))
divs = doc.css('')

binding.pry

p 'fin'

