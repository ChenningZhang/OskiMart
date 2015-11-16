class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_many :posts

	#Valid sign up fields presence as well as email format.
	before_save { self.email = email.downcase }
	validates :first_name, presence: true
  	validates :last_name, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@berkeley+\.edu+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
	validates :password, presence: true, length: {minimum: 8}

end
