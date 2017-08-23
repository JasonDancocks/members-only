class User < ApplicationRecord
	require 'digest'


	before_create :create_remember_token
	before_save { email.downcase! }

	validates :name, presence: true, length: { maximum: 36 }
	validates :email, presence: true, length: { maximum: 254 },
	uniqueness: { case_sensitive: false }
	validates :password, presence: true, length: { minimum: 6 }

	has_secure_password
	has_many :posts

	def self.new_token
		SecureRandom.urlsafe_base64
	end

	def self.digest(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	private

	def create_remember_token
		self.remember_token = User.digest(User.new_token)
	end
end