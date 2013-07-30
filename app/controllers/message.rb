
get '/sms' do

  @sender = User.find_or_create_by_phone(params[:From])
  p "Sender: #{@sender.first_name}"

  # @message = Message.create(
  #   sid: params[:SmsSid],
  #   date_sent: Date.today,
  #   from: params[:From],
  #   to: params[:To],
  #   body: params[:Body]
  #   )

  p Response.all.sample.body

  sender = params[:From]
  friends = { "+18582139043" => "Mitch" }
  name = friends[sender] || "Mobile Monkey"
  twiml = Twilio::TwiML::Response.new do |r|
    r.Sms "#{Response.all.sample.body}"
  end
  twiml.text
  p "*" * 30
  p "The twiml"
  p "*" * 30
  p twiml.text
  p "*" * 30
end