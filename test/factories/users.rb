FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password_digest "Tester12"
    token_last_used_at DateTime.now
  end
end
