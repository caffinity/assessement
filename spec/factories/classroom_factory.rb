FactoryBot.define do
  factory :classroom do
    name          { Faker::Address.city }


    trait :with_teacher do
      teacher
    end
    trait :with_students do
      students    { build_list(:students, (7..10).to_a.sample) }
    end
  end
end
