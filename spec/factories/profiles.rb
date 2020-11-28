FactoryBot.define do
  factory :profile do
    profile { Faker::Lorem.characters(number: 140) }
    association :user
  end
end
