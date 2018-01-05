class SkillLevel < ApplicationRecord
  has_many :student_skill_levels
	has_one :student, through: :student_skill_levels
	belongs_to :skill

end
