FactoryBot.define do
  sequence(:email) { |n| "user#{n*11}@example.com" }

  factory :user do
    email
    password "1234567890"
    first_name "Peter"
    last_name "Example"
    admin false
  end
end
