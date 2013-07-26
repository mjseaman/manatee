require 'faker'

20.times do |num|
	user = User.create(
		email: Faker::Internet.email,
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		password: 'password')
	p "user #{num}: #{user}"
end

account_sid = "ACb29152877bc2516403a6a343d1153ed7"
auth_token = "131c02e801c23592d8b34f8f4b004cda"
client = Twilio::REST::Client.new account_sid, auth_token
 
from = "+8582076375" # Your Twilio number
 
friends = {
# "+18582139043" => "Curious George",
# "+14155557775" => "Boots",
"+18582139043" => "Virgil"
}
friends.each do |key, value|
  client.account.sms.messages.create(
    :from => from,
    :to => key,
    :body => "Yo yo yo yo #{value} yeah, hey, you, come here gimme a kiss!"
  ) 
  puts "Sent message to #{value}"
end