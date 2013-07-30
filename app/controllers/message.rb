
get '/sms' do

  @sender = User.find_or_create_by_phone(params[:From])
  p "Sender: #{@sender.first_name}"

  @message = Message.create(
    sid: params[:SmsSid],
    date_sent: Date.today,
    from: params[:From],
    to: params[:To],
    body: params[:Body]
    )

  response = respond(@message)

  p response

  twiml = Twilio::TwiML::Response.new do |r|
    r.Sms "#{response}"
  end
  twiml.text

end