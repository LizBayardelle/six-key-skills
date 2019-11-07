class Subcategory < ApplicationRecord

  has_many :blog_categorizations
  has_many :blogs, through: :blog_categorizations

  has_one_attached :image

end
