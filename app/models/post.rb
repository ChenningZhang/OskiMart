class Post < ActiveRecord::Base
	belongs_to :user
  has_many :comments, dependent: :destroy
	
  validates :user_id, presence: true, numericality: true
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
