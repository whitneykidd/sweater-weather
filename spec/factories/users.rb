FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { SecureRandom.hex(8) }
    password_confirmation { password }
    api_key { SecureRandom.hex(24) }
  end
end
