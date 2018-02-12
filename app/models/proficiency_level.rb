class ProficiencyLevel < ApplicationRecord
  belongs_to :skill
  has_many :achievement
  has_many :skill_level_achievements
end
