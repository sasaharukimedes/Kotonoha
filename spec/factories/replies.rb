FactoryBot.define do
  factory :reply do
    dear { "MyString" }
    content { "MyText" }
    from { "MyString" }
    post_id { "" }
  end
end
