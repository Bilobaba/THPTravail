require 'rubygems'
require 'open-uri'
require 'nokogiri'
require 'pry'


doc = Nokogiri::HTML(open('https://checkr.com'))

binding.pry

p 'fin'

