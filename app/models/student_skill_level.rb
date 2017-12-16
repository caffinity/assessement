class StudentSkillLevel < ApplicationRecord
  belongs_to :student
	belongs_to :skill_level
end
