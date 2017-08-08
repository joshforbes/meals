FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password Faker::Internet.password
    token_last_used_at DateTime.now
  end
end
