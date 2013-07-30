
get '/sms' do

  # @sender = User.find_or_create_by_phone(params[:From])
  # p "Sender: #{@sender}"

  sender = params[:From]
  friends = { "+18582139043" => "Mitch" }
  name = friends[sender] || "Mobile Monkey"
  twiml = Twilio::TwiML::Response.new do |r|
    r.Sms "Hello #{name}. Thanks for the message. Bounce."
  end
  p twiml.text
end