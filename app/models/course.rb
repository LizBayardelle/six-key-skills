class Course < ApplicationRecord
  include RailsSortable::Model
  set_sortable :sort

  belongs_to :user

  has_many :course_modules
  has_many :lessons, through: :course_modules

  has_many :course_registrations
  has_many :users, through: :course_registrations

  has_many_attached :pins
  has_one_attached :image
  has_one_attached :sp1_image
  has_one_attached :sp2_image
  has_one_attached :sp3_image
end
