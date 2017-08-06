FactoryGirl.define do
  factory :token do
    body "MyString"
    user
    last_used_at DateTime.now
  end
end
