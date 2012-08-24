class User < ActiveRecord::Base

  has_many :tasks , :through => :lists
  has_many :lists , :dependent => :destroy

	def self.create_with_omniauth(auth)
		create! do |user|
			user.provider = auth["provider"]
			user.uid = auth["uid"]
			user.email = auth["info"]["email"]
		end
	end
end
