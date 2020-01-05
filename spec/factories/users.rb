FactoryBot.define do
  factory :user do
    name { "TestName" }
    email { "test@test.com" }
    password {"test_pass"}
    password_confirmation {"test_pass"}
  end
end
