class Post < ActiveRecord::Base
	belongs_to :user
  

  # favorited by useres 
  has_many :favorite_posts
  has_many :favorited_by, through: :favorite_posts, source: :user # users that favorite a project


  has_many :comments, dependent: :destroy



	
  validates :user_id, presence: true, numericality: true
	validates :title, presence: true
	validates :description, presence: true
	validates :category, presence: true
	validates :price, presence: true
  validates_inclusion_of :category, :in => %w(Books Technology Furniture Service Other), :message => "{{value}} is not a valid category"
  validates_inclusion_of :price, :in => %w($ $$ $$$), :message => "{{value}} is not a valid price"


  def self.filter(price, category_id)
    where(:price => price, :category => category_id)
  end




  def self.search(keywords, category_id)
    keyword_regex = "%#{keywords}%"
    where("(title ILIKE ? or description ILIKE ?) and category = ?", keyword_regex, keyword_regex, category_id)
  end

end
