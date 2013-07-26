
get '/sms-quickstart' do
  sender = params[:From]
  friends = {
    # "+14153334444" => "Curious George",
    # "+14158157775" => "Boots",
    "+18582139043" => "Mitch"
  }
  name = friends[sender] || "Mobile Monkey"
  twiml = Twilio::TwiML::Response.new do |r|
    r.Sms "Hello #{name}. Thanks for the message. Bounce."
  end
  p twiml.text
end