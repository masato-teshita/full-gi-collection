FactoryBot.define do
  
  factory :area do
    name {Faker::Address.name}
  end
end