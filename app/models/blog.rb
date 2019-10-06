class Blog < ApplicationRecord
  belongs_to :lead_magnet, optional: true
  belongs_to :user
  has_many_attached :pins
end
