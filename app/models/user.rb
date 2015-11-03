class User < ActiveRecord::Base
  acts_as_messageable
	has_many :posts
	#Valid sign up fields presence as well as email format.
	before_save { self.email = email.downcase }
	validates :name, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
	validates :username, presence: true
	validates :password, presence: true
	has_secure_password
end
