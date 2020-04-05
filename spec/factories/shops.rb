FactoryBot.define do
  
  factory :shop do
    sequence(:name) {Faker::Name.name}
    sequence(:outline) {Faker::Lorem.sentence}
  end
end