class Message < ActiveRecord::Base
  belongs_to :user

  before_validation :associate_with_user

  protected

  def associate_with_user
  	if User.find_by_phone(phone)
  		self.user = User.find_by_phone(phone)
  	end
  	User.find_or_create_by_phone()
  end
  
end
