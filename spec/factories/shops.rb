FactoryBot.define do
  
  factory :shop do
    name {Faker::Restaurant.name}
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
  end
end