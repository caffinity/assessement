class SkillLevel < ApplicationRecord
  belongs_to :proficiency_level
	belongs_to :student
  has_many   :skill_level_achievements, -> { where(skill_level: self) }, # Default scope on relationship
             through: :proficiency_level

  def level_up_proficiency!
      ActiveRecord::Base.transaction do # Starts a transaction, will rollback all changes if any part fails
        self.proficiency_level = ProficiencyLevel.find_by( # Assign new prof_level
          level: proficiency_level.level + 1,  # Find correct one
          skill: proficiency_level.skill       # Find correct one
        )
        create_skill_level_achievements!       # Create new achievements, still inside transaction
        save!
      end
  end

    private

  def create_skill_level_achievements!
      proficiency_level.achievement.each do |achievement| # Create one for each prof_level achievement
      SkillLevelAchievement.create!(
        skill_level: self,
        achievement: achievement,
        proficiency_level: proficiency_level
      )
    end
  end
end
