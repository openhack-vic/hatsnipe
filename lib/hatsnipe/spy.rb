require 'dotenv'
Dotenv.load
require 'twilio-ruby'

module Hatsnipe
  class Spy
    def alert phone_number, message
      Twilio.configure do |config|
        config.account_sid = ENV['TWILIO_ACCOUNT_SID']
        config.auth_token = ENV['TWILIO_AUTH_TOKEN']
      end

      @client = Twilio::REST::Client.new
      @client.messages.create(
        from: ENV['TWILIO_NUMBER_OUTGOING'],
        to: phone_number,
        body: message
      )
    end
  end
end
