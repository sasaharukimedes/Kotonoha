require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe 'Action test' do
    before do
      @alice = FactoryBot.create(:alice)
      @user = FactoryBot.create(:user)
      #createだとなぜかいかない
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
        expect(response).to redirect_to posts_path
        #expect(response.status).to eq 200
      end
    end

  end
end