class Lesson < ApplicationRecord
  include RailsSortable::Model
  set_sortable :sort

  belongs_to :course_module, optional: true
  has_one :course, through: :course_modules
  has_one_attached :image

  has_many :lesson_completions
  has_many :users, through: :lesson_completions

end
