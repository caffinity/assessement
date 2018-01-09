FactoryBot.define do
  factory :skill_level do
    statement     { Faker::Lorem.words.join(' ') }


    trait :with_proficiency_level do
      proficiency_level skill_level: skill_level
    end

    trait :with_student do
      student
    end

  end
end


#SkillLevel(id: integer, statement: string, student_id: integer, proficiency_level_id: integer)
