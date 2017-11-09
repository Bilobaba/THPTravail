require 'twitter'
require 'pry'

class SendTweet

  def initialize(msg = "Tweet as services")
    @msg = msg
    log_in_to_twitter
    send_tweet
  end

  def log_in_to_twitter
    @client = Twitter::REST::Client.new do |config|
    config.consumer_key        = "Mjv6f6mxMLYCcI2hHk4XmUYhH"
    config.consumer_secret     = "dc3rljNL1DOmXsF8gV08b6pGaS40qkhvv2HIBVIlW4RfrMRI0L"
    config.access_token        = "718464663986552832-7D94yQE2oL7cjKS6MDJwuBcP2RphWrr"
    config.access_token_secret = "ewXA1TALi72vzFP2Fr0kaB01ZQjmnCmSzPkxx0r2W8OFW"
    end
  end

  def send_tweet
    @client.update(@msg)
  end

end
