class Student < ApplicationRecord
  require 'csv'
  has_many :skill_levels, dependent: :destroy
  belongs_to :classroom
  accepts_nested_attributes_for :skill_levels #proficiency_level_id & #student_id Statement optional

  mount_uploader :avatar, AvatarUploader

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |students|
        csv << students.attributes.values_at(*column_names)
      end
    end
  end
end
