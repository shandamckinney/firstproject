FactoryBot.define do

  factory :user do
    email (:email) { |n| "user#{n}@email.com"}
    password {"testtest"}
    first_name {"John"}
    last_name {"Doe"}
    admin {false}
  end
end
