require 'csv'

# require 'faker'

# 20.times do |num|
# 	user = User.create(
# 		email: Faker::Internet.email,
# 		first_name: Faker::Name.first_name,
# 		last_name: Faker::Name.last_name,
# 		password: 'password')
# 	p "user #{num}: #{user}"
# end

# mitch = User.create(
# 	email: "mitchel.seaman@gmail.com",
# 	first_name: "Mitch",
# 	last_name: "Seaman",
# 	password: "password",
# 	phone: "+18582139043")

# input = Input.create(body: ":(")
# p "Input: #{input}"

# 50.times do |num|
# 	response = Response.create(body: Faker::Company.bs)
# 	response.input = Input.find(1)
# 	response.save
# 	p "Response #{num}: #{response}"
# end

class CustomImporter
	def self.import(filename)
	  csv = CSV.new(File.open(filename), :headers => true)
	  # p csv
	  csv.each do |row|
	  	input = Input.find_or_create_by_body(row["input"])
	  	response = Response.find_or_create_by_body(row["response"])
	  	response.input = input
	  	response.save
	  	p response
	    # row.each do |field, value|
	    #   p "FIELD: #{field}"
	    #   p "VALUE: #{value}"
	    # end
	  end
	end
end

class NotesImporter

	@@unknown_input = Input.find_or_create_by_body("unknown")

  def self.import(filename)
    csv = CSV.new(File.open(filename))
    csv.each do |row|
      	puts "ROW: #{row}"
	  	response = Response.create(
	  		body: "Sorry, not sure what you mean.  Quote by #{row[2]}! #{row[1]}")
	  	response.input = @@unknown_input
	  	response.save
    end
  end
end

NotesImporter.import("#{APP_ROOT}/db/litemind-quotes.csv")

CustomImporter.import("#{APP_ROOT}/db/seeds.csv")

# account_sid = "ACb29152877bc2516403a6a343d1153ed7"
# auth_token = "131c02e801c23592d8b34f8f4b004cda"
# client = Twilio::REST::Client.new account_sid, auth_token
 
# from = "+18582076375" # Your Twilio number
 
# friends = {
# "+18582139043" => "Curious George",
# "+14155557775" => "Boots",
# "+18582139043" => "Mitchel"
# }
# friends.each do |key, value|
#   TWILIO_CLIENT.account.sms.messages.create(
#     :from => from,
#     :to => key,
#     :body => "Yo yo yo yo #{value} yeah, hey, you, come here gimme a kiss!"
#   ) 
#   puts "Sent message to #{value}"
# end

