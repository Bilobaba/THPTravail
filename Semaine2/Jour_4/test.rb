require 'nokogiri'
require 'open-uri'
require 'pry'

require 'rubygems'

PAGE_URL = "https://www.google.fr/search?q=yoga+paris&oq=yoga+paris&aqs=chrome..69i57j0l5.7838j0j8&sourceid=chrome&ie=UTF-8"

# Fetch and parse HTML document
doc = Nokogiri::HTML(open(PAGE_URL))

binding.pry

puts "Hello"
