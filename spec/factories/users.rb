FactoryBot.define do
  factory :user do 
        name {"haru"}
        sequence(:email) { |n| "haru#{n}@example.com"}
        password {"password"}
    end 
end
