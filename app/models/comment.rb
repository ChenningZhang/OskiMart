class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :post

	validates :text, presence: true
	validates :user_id, numericality: true, presence: true
	validates :post_id, numericality: true, presence: true
end
