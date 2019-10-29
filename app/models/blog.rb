class Blog < ApplicationRecord
  belongs_to :resource, optional: true
  belongs_to :user
  has_many_attached :pins
end
