FactoryBot.define do
  factory :subject do
    name { %w(math english).sample }
    initialize_with { Subject.find_or_create_by(name: name) }
  end
end
