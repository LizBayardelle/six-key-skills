class Blog < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :resource, optional: true
  belongs_to :user

  has_many_attached :pins
  has_one_attached :share_image

  has_many :blog_categorizations
  has_many :subcategories, through: :blog_categorizations


end
