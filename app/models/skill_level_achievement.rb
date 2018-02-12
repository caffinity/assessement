class SkillLevelAchievement < ApplicationRecord
  belongs_to :skill_level
  belongs_to :achievement
  belongs_to :proficiency_level

end
