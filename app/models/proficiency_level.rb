class ProficiencyLevel < ApplicationRecord
  belongs_to :skill
  has_many :achievement, dependent: :destroy
  has_many :skill_level_achievements



end
