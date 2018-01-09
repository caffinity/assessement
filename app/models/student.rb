class Student < ApplicationRecord
  has_many :skill_levels
  belongs_to :classroom
end
