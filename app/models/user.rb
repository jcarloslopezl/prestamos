class User < ApplicationRecord
	has_many :requisitions

	def self.sign_in_from_omniauth(auth)
		find_by(provider: auth['provider'], uid: auth['uid']) || create_user_from_omniauth(auth)
	end

	def self.create_user_from_omniauth(auth)

		create(
			provider: auth['provider'],
			uid: auth['uid'],
			first_name: auth['info']['first_name'],
			second_name: auth['info']['last_name'],
			phone_number: auth['info']['phone']
		)

	end
	
end
