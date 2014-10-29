require 'dotenv'
Dotenv.load
require 'twilio-ruby'

Twilio.configure do |config|
  config.account_sid = ENV['TWILIO_ACCOUNT_SID']
  config.auth_token = ENV['TWILIO_AUTH_TOKEN']
end

@client = Twilio::REST::Client.new
@client.messages.create(
  from: ENV['TWILIO_NUMBER_OUTGOING'],
  to: ENV['TWILIO_NUMBER_DESTINATION'],
  body: 'Holy balls a cheap hat!'
)
