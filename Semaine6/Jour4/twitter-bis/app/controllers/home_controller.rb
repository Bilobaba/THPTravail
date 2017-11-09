# require 'pry'

class HomeController < ApplicationController
  def index
    if params.key?(:petit_tweet)
      @msg = params_tweet
      binding.pry
      SendTweet.new @msg
    end
  end

  private

  def params_tweet
    params_tweet = params.permit(:petit_tweet).require(:petit_tweet)
  end
end
