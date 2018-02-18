class StudentRecord < ApplicationRecord
  belongs_to :student
  belongs_to :proficiency_level
end
