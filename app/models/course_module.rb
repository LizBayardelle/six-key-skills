class CourseModule < ApplicationRecord
  include RailsSortable::Model
  set_sortable :sort
  
  belongs_to :course
  has_many :lessons
  has_one_attached :image
end
