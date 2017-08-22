class User < ApplicationRecord
	attr_accessor :remember_token

	before_create :set_remember_token
	has_secure_password


	def set_remember_token
		token = SecureRandom.urlsafe_base64.to_s
		self.remember_token = Digest::SHA1.hexdigest(token)
	end
		

end
