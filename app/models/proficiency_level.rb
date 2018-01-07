class ProficiencyLevel < ApplicationRecord
  belongs_to :skilllevel
  belongs_to :student
end
