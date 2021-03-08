require 'rails_helper'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  #ユーザ名, メール, バースデイ, 最終受信時刻があれば有効な状態であること
  it "is valid with a username, email, birthday, and received_at" do
    user = User.new(
      username: "たろう1号",
      email: "test_1@example.com",
      birthday: "1996, 11, 09",
      received_at: "20210214",
    )
  end
  #ユーザ名がなければ無効な状態であること
  it "is invalid withoout a username"
  #メールがなければ無効な状態であること
  it "is invalid  without an email"
  #バースデイがなければ無効な状態であること
  it "is invalid without a birthday"
  #最終受信時刻がなければ無効な状態であること
  it "is invalid without a received_at"

  #重複したメールアドレスなら無効な状態であること
  it "is invalid with a duplicated email address"
  #ユーザ名を文字列で返すこと
  it "returns a username as a string"



end

