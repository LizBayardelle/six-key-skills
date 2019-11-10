class Blog < ApplicationRecord
  belongs_to :resource, optional: true
  belongs_to :user

  has_many_attached :pins

  has_many :blog_categorizations
  has_many :subcategories, through: :blog_categorizations


end
