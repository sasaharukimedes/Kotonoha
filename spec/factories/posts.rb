FactoryBot.define do
  factory :post do
    association :user#, factory: :alice  #←みたいにも書ける
    dear {"どこかの誰かさんへ"}
    content {"ファクトリーボット使ってます関連付け含めテストしていきます"}
    from {"プログラム男"}
  end
end