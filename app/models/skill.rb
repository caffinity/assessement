class Skill < ApplicationRecord
  belongs_to :subject
  has_many :proficiency_levels
	end
