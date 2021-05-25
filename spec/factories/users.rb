FactoryBot.define do

  #adminログインチェック用
  factory :alice do
    username  {"Alice"}
    email {"alice@example.com"}
    password { "Password" }
    password_confirmation {"Password" }
    birthday {'001996-11-09'}
    received_at {'Time.current'}
    admin { 'true' }
  end

  factory :user do
    sequence(:username) { |n| "TEST_NAME#{n}"}
    sequence(:email) { |n| "TEST#{n}@example.com" }
    password { "Password" }
    password_confirmation {"Password" }
    birthday {'002000-11-09'}
    received_at {'Time.current'}
  end
end
