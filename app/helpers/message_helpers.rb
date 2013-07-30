helpers do 

	def respond(message)
		input = message.input
		name = message.user.first_name
		if input.responses.any?
			return "Hey #{name}, #{input.responses.sample.body}"
		else
			return Input.find_by_body("unknown").responses.sample.body
		end
	end


end

# account_sid = "ACb29152877bc2516403a6a343d1153ed7"
# auth_token = "131c02e801c23592d8b34f8f4b004cda"
# client = Twilio::REST::Client.new account_sid, auth_token
 
# from = "+18582076375" # Your Twilio number