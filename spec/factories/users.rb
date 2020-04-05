FactoryBot.define do
  
  factory :user do
    password = Faker::Internet.password(min_length: 6)
    sequence(:name) {Faker::Name.name}
    sequence(:email) {Faker::Internet.email}
    password {password}
    password_confirmation {password}
  end
end