FactoryBot.define do
  factory :proficiency_level do
    sequence(:level) { |n| n }
    statement        { Faker::Lorem.words.join(' ') }
    skill
  end
end
