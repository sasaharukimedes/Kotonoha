require 'rails_helper'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  before do
    @alice = build(:alice)
    @user = build(:user)
  end

  #ユーザ名, メール, バースデイ, 最終受信時刻があれば有効な状態であること
  it "is valid with a username, email, birthday, and received_at" do
    expect(@user.valid?).to eq(true)
  end
  #ユーザ名がなければ無効な状態であること
  it "is invalid withoout a username" do
    @user.name = ""
    expect(@user.valid?).to eq(false)
  end

  #メールがなければ無効な状態であること
  it "is invalid  without an email" do
    @user.email = ""
    expect(@user.valid?).to eq(false)
  end
  #バースデイがなければ無効な状態であること
  it "is invalid without a birthday" do
    @user.birthday = ""
    expect(@user.valid?).to eq(false)
  end
  #最終受信時刻がなければ無効な状態であること
  it "is invalid without a received_at" do
    @user.received_at = ""
    expect(@user.valid?).to eq(false)
  end

  #重複したメールアドレスなら無効な状態であること
  it "is invalid with a duplicated email address"
  #ユーザ名を文字列で返すこと
  it "returns a username as a string"



end