FactoryGirl.define do
  factory :recipe do
    user
    name { Faker::Lorem.sentence }
  end
end
