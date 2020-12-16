FactoryBot.define do
  factory :letter_address do
    thanks { Faker::Lorem.sentence }
  end
end