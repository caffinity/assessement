class SkillLevel < ApplicationRecord
  belongs_to :proficiency_level
	belongs_to :student
  has_many :skill_level_achievement
end
