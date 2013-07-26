helpers do 

	def account_sid
		"ACb29152877bc2516403a6a343d1153ed7"
	end

	def auth_token
		"131c02e801c23592d8b34f8f4b004cda"
	end

	def from
		"+18582076375"
	end


end

# account_sid = "ACb29152877bc2516403a6a343d1153ed7"
# auth_token = "131c02e801c23592d8b34f8f4b004cda"
client = Twilio::REST::Client.new account_sid, auth_token
 
# from = "+18582076375" # Your Twilio number