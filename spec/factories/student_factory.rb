FactoryBot.define do
  factory :student do
    first_name              { Faker::Name.first_name       }
    last_name               { Faker::Name.last_name        }
    pupil_premium           { [true, false].sample         }
    free_school_meals       { [true, false].sample         }
    english_as_language     { [true, false].sample         }
    gender                  { [true, false].sample         }
    special_education_need  { Faker::Lorem.words.join(' ') }
    year                    { (1..7).to_a.sample           }


    trait :with_classroom do
      classroom
    end

    trait :with_skill_level do
      after(:create) do |student, _evaluator|
        create_list(:skill_level, 8, student: student)
      end
    end
  end
end
