FactoryBot.define do
  factory :user do
    nickname { 'katoudayo' }
    email { Faker::Internet.free_email }
    password { '111aaa' }
    password_confirmation { password }
  end
end
