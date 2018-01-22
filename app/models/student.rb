class Student < ApplicationRecord
  has_many :skill_levels
  belongs_to :classroom
  accepts_nested_attributes_for :skill_levels #proficiency_level_id & #student_id Statement optional
end
