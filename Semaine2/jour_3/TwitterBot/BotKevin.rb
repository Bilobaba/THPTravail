#!/usr/bin/env ruby

#use twitter gem
require "twitter"

Consumer_key        = "T5m80d6v6dFD9IazQV689VQ5p"
Consumer_secret     = "qbiUmo2GNJsqc6TKk2jua1utjU660WXyJK1ivzBGzPTuCA6Odk"
Access_token        = "718464663986552832-Mu0xSV9UrGaIyJ5J6QjvlMeZX8LBeLb"
Access_token_secret = "UjqEHbk18NpqclPQmp9PrD3UgMXvRXzAI2u66QU4ooTe7"

$client_stream = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = Consumer_key
  config.consumer_secret     = Consumer_secret
  config.access_token        = Access_token
  config.access_token_secret = Access_token_secret
end

$client_rest = Twitter::REST::Client.new do |config|
  config.consumer_key        = Consumer_key
  config.consumer_secret     = Consumer_secret
  config.access_token        = Access_token
  config.access_token_secret = Access_token_secret
end

class TwitterBot

  # retweet, fav tweet, and follow user
  def spam(tweet)
    begin
      $client_rest.retweet!(tweet)
      #$client_rest.update("hello @#{tweet.user.screen_name}, tu peux manger pas cher avec mon code promo UberEats : xnbhu")
      $client_rest.favorite!([tweet])
      $client_rest.follow!([tweet.user])
    rescue Twitter::Error
      puts ">>> This tweet has already been treated"
    end
  end

  # search the last [nb_results] tweets containing a specific [term] with the [options] applied
  def search_twitter(term, options, nb_results)
    $client_rest.search(term, options).take(nb_results).each do |tweet|
      if tweet.is_a?(Twitter::Tweet)
        puts tweet.text
        spam(tweet)
      end
    end
  end

  # search the last [nb_results] tweets containing a specific [term] with the [options] applied
  def filter_twitter(options)
    $client_stream.filter(options) do |tweet|
      if tweet.is_a?(Twitter::Tweet)
        puts tweet.text
        spam(tweet)
      end
    end
  end

end

search_options = {
  result_type: "recent",
  locations: "48.8566667,2.3509871,10mi"
}

filter_options = {
  result_type: "recent",
  locations: "48.8566667,2.3509871,10mi",
  track: "faim"
}

my_bot = TwitterBot.new
#my_bot.search_twitter("faim", search_options, 100)
my_bot.filter_twitter(filter_options)
