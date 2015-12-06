class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


	has_many :posts, dependent: :destroy
	has_many :closed_posts, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :reviews, dependent: :destroy


	# favorite projects implementation 
	has_many :favorite_posts
	has_many :favorites, through: :favorite_posts, source: :post
	mount_uploader :image, ProfilepicUploader

	#Valid sign up fields presence as well as email format.
	before_save { self.email = email.downcase }
	validates :first_name, presence: true
  	validates :last_name, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@berkeley+\.edu+\z/i
	validates :email, format: { with: VALID_EMAIL_REGEX, message: "must be Berkeley email!" }, uniqueness: { case_sensitive: false }
	validates :password, length: {minimum: 8}, on: :create

	#mailboxer mcMagicSauce
	acts_as_messageable

	def full_name
		first_name + ' ' + last_name
	end

	def mailboxer_email(object)
		email
	end






end
