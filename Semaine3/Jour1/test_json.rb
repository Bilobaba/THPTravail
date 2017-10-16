#!/usr/bin/ruby
require 'rubygems'
require 'json'
require 'pp'
require 'pry'

json = File.read('input.json')
obj = JSON.parse(json)

pp obj

binding.pry
puts "Fini ;-)"
