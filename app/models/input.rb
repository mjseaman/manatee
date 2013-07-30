class Input < ActiveRecord::Base
	has_many :responses
	has_many :messages
  # Remember to create a migration!
end
