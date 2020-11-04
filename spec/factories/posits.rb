FactoryBot.define do
  factory :posit do
    posit { Faker::Lorem.sentence }
    association :user
  end
end