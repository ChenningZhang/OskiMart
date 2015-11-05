class Post < ActiveRecord::Base
	belongs_to :user
	
	validates :title, presence: true
	validates :description, presence: true
	validates :category, presence: true
	validates :price, presence: true	

  def self.filter(price)
    where(:price => price)
  end
end
