class Student < ApplicationRecord
  require 'csv'
  has_many :skill_levels, dependent: :destroy
  belongs_to :classroom
  accepts_nested_attributes_for :skill_levels #proficiency_level_id & #student_id Statement optional

  mount_uploader :avatar, AvatarUploader

  def has_achievement?(achievement)
    StudentAchievement.find_by(student_id: id, achievement_id: achievement.id)
  end

  # def student_progress(skill_level)
  #   result = skill_level.proficiency_level.achievement.inject(0) do | memo, achievement|
  #     @student_achievement = StudentAchievement.where(student_id: id, achievement_id: achievement.id)
  #     memo + @student_acheivement
  #   end
  # end

  def student_progress(skill_level)
    @count = skill_level.proficiency_level.achievement.each_with_object([]) do | achievement, arr |
      if StudentAchievement.where(student_id: skill_level.student.id, achievement_id: achievement.id).present?
        arr << StudentAchievement.where(student_id: skill_level.student.id, achievement_id: achievement.id)
      else
      end  
    end
    @count.count
  end


  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |students|
        csv << students.attributes.values_at(*column_names)
      end
    end
  end
end
