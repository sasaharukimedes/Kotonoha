FactoryBot.define do
  factory :post do
    dear {"どこかの誰かさんへ"}
    content {"ファクトリーボット使ってます"}
    from {"プログラム男"}
    user_id {user.id}
    sender_id {user.id}
    receiver_id {}

    user
  end
end