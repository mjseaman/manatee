
get '/sms-quickstart' do
  twiml = Twilio::TwiML::Response.new do |r|
    r.Sms "Hey asshole"
  end
  twiml.text
end

