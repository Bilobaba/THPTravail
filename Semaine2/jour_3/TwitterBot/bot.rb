#!/usr/bin/env ruby
require 'twitter'

Consumer_key        = "T5m80d6v6dFD9IazQV689VQ5p"
Consumer_secret     = "qbiUmo2GNJsqc6TKk2jua1utjU660WXyJK1ivzBGzPTuCA6Odk"
Access_token        = "718464663986552832-Mu0xSV9UrGaIyJ5J6QjvlMeZX8LBeLb"
Access_token_secret = "UjqEHbk18NpqclPQmp9PrD3UgMXvRXzAI2u66QU4ooTe7"


client = Twitter::REST::Client.new do |config|
  config.consumer_key        = Consumer_key
  config.consumer_secret     = Consumer_secret
  config.access_token        = Access_token
  config.access_token_secret = Access_token_secret
end

clients = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = Consumer_key
  config.consumer_secret     = Consumer_secret
  config.access_token        = Access_token
  config.access_token_secret = Access_token_secret
end

topics = ["coffee", "tea"]
clients.filter(track: topics.join(",")) do |object|
  puts object.text if object.is_a?(Twitter::Tweet)
end

