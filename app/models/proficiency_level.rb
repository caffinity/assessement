class ProficiencyLevel < ApplicationRecord
  belongs_to :skill
  has_many :achievement
end
