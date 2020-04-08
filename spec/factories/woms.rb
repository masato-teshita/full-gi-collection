FactoryBot.define do
  
  factory :wom do
    visit_type  {"購入"}
    rate {Faker::Number.between(from = 0.0, to = 5.0)}
    title {"大満足"}
    content {"満足です。ありがとうございます。"}
    visit_date {"2020/03/15"}
    created_at { Faker::Time.between(from: DateTime.now - 10, to: DateTime.now) }
    user
    shop
  end
end