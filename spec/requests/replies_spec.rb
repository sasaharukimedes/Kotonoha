require 'rails_helper'

RSpec.describe "Replies", type: :request do
  describe 'Action test' do
    before do
      @alice = FactoryBot.create(:alice)
      @user = FactoryBot.create(:user)
      #@post = FactoryBot.create(:post, dear: "どこかの誰かへ", content: "お試しテストを書いています関連付け", from: "開発者より", user: @user)

      #createだとなぜかいかない→解決
      #→なぜならdeviseのメール認証がファクトリボットで出来てなかったから
    end

    context "new" do
      it "access by user" do
        sign_in @user
        get '/replies/new'
        expect(response.status).to eq 200
      end


      it "access by guest" do
        get '/posts/new'
        expect(response.status).to eq 302
      end
    end


  end
end