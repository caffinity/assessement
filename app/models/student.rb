class Student < ApplicationRecord
  has_many :skill_levels, dependent: :destroy
  has_many :student_records, dependent: :destroy
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
    skill_level.proficiency_level.achievement.each_with_object([]) do | achievement, arr |
      if StudentAchievement.where(student: skill_level.student, achievement: achievement).present?
        arr << StudentAchievement.where(student: skill_level.student, achievement: achievement)
      end
    end.count
  end


  def self.to_csv(options = {})
    require 'csv'
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |students|
        csv << students.attributes.values_at(*column_names)
      end
    end
  end
end
