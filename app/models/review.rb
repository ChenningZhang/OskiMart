class Review < ActiveRecord::Base

	belongs_to :user

	validates :score, presence: true
	validates_numericality_of :score, :only_integer => true,
		:greater_than_or_equal_to => 1, :less_than_or_equal_to => 5,
		:message => "Your review score should between 1 and 5."
	validates :feedback, presence: true, length: {maximum: 1000}
	validates :user_id, presence: true, numericality: true
end
