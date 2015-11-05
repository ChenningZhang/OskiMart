class Post < ActiveRecord::Base
	belongs_to :user
	
	validates :title, presence: true
	validates :description, presence: true
	validates :category, presence: true
	validates :price, presence: true	

  def self.search(search, search_category)
    puts "model self.search called"
    where("title LIKE ?", "%#{search}%")
    where("description LIKE ?", "%#{search}%")
    where("category LIKE ?", "%#{search_category}%")
  end
end
