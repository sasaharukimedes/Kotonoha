FactoryBot.define do
  factory :alice, class: User do
    id {100}
    username  {"alice"}
    email {"alice@example.com"}
    password { "Password" }
    password_confirmation {"Password" }
    birthday {'001996-11-09'}
    received_at {Time.current}
    #received_atも試しにコンソールでやったらちゃんと出来てた！！
    #メール認証用
    confirmed_at {Date.today}
  end

  factory :user, class: User do
    sequence(:id) {|n| "#{n}"}
    sequence(:username) { |n| "TEST_NAME#{n}"}
    sequence(:email) { |n| "TEST#{n}@example.com" }
    #id {1}
    #username {"user"}
    #email {"user2@example.com"}
    password { "Password" }
    password_confirmation {"Password" }
    birthday {'002000-11-09'}
    received_at {Time.current}

    #メール認証用
    confirmed_at {Date.today}

    #関連付けの設定
    #after(:create) do |user|
      #user.posts << FactoryBot.create(:post, dear: "あなたへ", content: "ユーザーとポストの関連付けをしてみています", from: "開発者より")
    #end
  end
end
