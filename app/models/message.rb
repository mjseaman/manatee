class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :input

  before_validation :associate_with_user
  before_validation :associate_with_input

  protected

  def associate_with_user
  	# if User.find_by_phone(phone)
  	# 	self.user = User.find_by_phone(phone)
  	# end
  	user = User.find_or_create_by_phone(self.from)
  	p "new user: #{user.phone}"

  	if !user.valid?
  		user.first_name = "New"
  		user.last_name = "User"
  		user.email = "no@email.com"
  		user.password = "password"
  		user.save
  		p "Now that everything is set, are we valid? #{user.errors.full_messages}"
  	end
  	self.user = user
  	p "user for this message: #{self.user.phone}"
  	p "valid? #{self.user.errors.full_messages}"
  end

  def associate_with_input
  	new_input = Input.find_or_create_by_body(self.body)
  	p "input errors: #{new_input.errors.full_messages}"
  	self.input = new_input
  end
  
end
