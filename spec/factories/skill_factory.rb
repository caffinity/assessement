FactoryBot.define do
  factory :skill do
    name { %w(speaking listening reading writing using_and_applying	number shape_space_measure geometry_and_measure).sample }
    initialize_with { Skill.find_or_create_by(name: name) }
    subject
  end
end
