class Review < ActiveRecord::Base

	belongs_to :user

	validates :score, presence: true, numericality => { :greater_than => 0, :less_than_or_equal_to => 5 }
	validates :feedback, presence: true, length: {maximum: 1000}
	validates :user_id, presence: true
end
