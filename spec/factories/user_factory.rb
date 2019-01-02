FactoryBot.define do

  factory :user do
    email "test@email.com"
    password "testtest"
    first_name "John"
    last_name "Doe"
    admin false
  end
end
