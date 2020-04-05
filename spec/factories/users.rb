FactoryBot.define do
  
  factory :user do
    password = Faker::Internet.password(min_length: 6)
    name {Faker::Name.name}
    email {Faker::Internet.email}
    password {password}
    password_confirmation {password}
  end
end