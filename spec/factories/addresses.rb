FactoryBot.define do
  factory :address do
    association :user
    association :letter
  end
end
