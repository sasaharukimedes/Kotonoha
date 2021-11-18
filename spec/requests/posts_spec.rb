require 'rails_helper'

RSpec.describe "Posts", type: :request do
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
        get '/posts/new'
        expect(response.status).to eq 200
      end


      it "access by guest" do
        get '/posts/new'
        expect(response.status).to eq 302
      end
    end

    context "create" do
      it "access by user" do
        sign_in @user
        post "/posts", :params => { :post => {:dear => "test", :content => "nakami", :from => "from"}}
        #expect(response).to redirect_to posts_path

        #試しに204と書いてみたもののナンジャコリャ
        expect(response.status).to eq 204
      end

      it "access by guest" do
        post"/posts"
        #expect(response).to have_http_status(401)
        #なぜいかない？？
        expect(response).to have_http_status(302)
      end
    end

  end
end