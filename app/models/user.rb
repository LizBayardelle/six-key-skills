class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :resources
  has_many :blogs

  has_many :lesson_completions
  has_many :lessons, through: :lesson_completions

  has_many :course_registrations
  has_many :courses, through: :course_registrations

  def full_name
    "#{first_name} #{last_name}"
  end

end
