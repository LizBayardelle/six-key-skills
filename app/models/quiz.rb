class Quiz < ApplicationRecord
  belongs_to :user
  has_many :questions
  has_many :sittings
  has_one_attached :image
end
