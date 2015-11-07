class Post < ActiveRecord::Base
	belongs_to :user
	
	validates :title, presence: true
	validates :description, presence: true
	validates :category, presence: true
	validates :price, presence: true	

  def self.filter(price)
    where(:price => price)
  end

  def self.search(search)
    keyword_regex = "%#{search}%"
    where("(title ILIKE ? or description ILIKE ?)", keyword_regex, keyword_regex)
  end

end
