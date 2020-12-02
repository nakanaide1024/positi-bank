FactoryBot.define do
  factory :letter do
    thanks { Faker::Lorem.sentence }
    association :user
  end
end
