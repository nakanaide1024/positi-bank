FactoryBot.define do
  factory :user do
    nickname { Faker::Lorem.characters(number: 9) }
    email { Faker::Internet.free_email }
    password { '111aaa' }
    password_confirmation { password }
  end
end
