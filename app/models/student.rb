class Student < ApplicationRecord
  has_many :student_skill_levels
  has_many :skill_levels, through: student_skill_levels
  belongs_to :class_room
end
