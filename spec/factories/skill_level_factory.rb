FactoryBot.define do
  factory :skill_level do
    statement     { Faker::Lorem.words.join(' ') }
    proficiency_level

    trait :with_student do
      student
    end

  end
end


#SkillLevel(id: integer, statement: string, student_id: integer, proficiency_level_id: integer)
