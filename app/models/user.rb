class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
	has_many :requisitions
	has_many :references

	def self.from_omniauth(auth)
	  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|	    
	    user.password = Devise.friendly_token[0,20]
	    user.first_name = auth.info.first_name
	    user.second_name = auth.info.middle_name
	    user.email = auth.info.email
			user.first_last_name = auth.info.last_name
	    user.phone_number = auth.info.phone
	    user.birth_date = auth.info.birthday
	    user.image = auth.info.image
	  end
	end
end
