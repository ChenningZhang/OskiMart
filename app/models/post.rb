class Post < ActiveRecord::Base
	belongs_to :user
	
	validates :title, presence: true
	validates :description, presence: true
	validates :category, presence: true
	validates :price, presence: true	

  def self.search(search, search_category)
    puts "model self.search called"
    puts(search)
    puts(search_category)
    keyword_regex = "%#{search}%"
    category_regex = "%#{search_category}%"
    where("(title LIKE ? or description LIKE ?) and category LIKE ?", keyword_regex, keyword_regex, category_regex)
    #where("title LIKE ?", "%#{search}%")
    #where("description LIKE ?", "%#{search}%")
    #where("category LIKE ?", "%#{search_category}%")
  end
end
