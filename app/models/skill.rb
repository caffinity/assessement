class Skill < ApplicationRecord
  belongs_to :subject
	has_many :skill_levels
	end
