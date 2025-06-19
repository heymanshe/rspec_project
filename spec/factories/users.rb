FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    age { Faker::Number.between(from: 18, to: 65) }
  end
end
