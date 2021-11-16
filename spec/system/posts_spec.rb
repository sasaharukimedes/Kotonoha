require "rails_helper"

Rspec.describe Posts, type: :system do
  before do
    @user = FactoryBot.create(:user)
    @alice = FactoryBot.create(:alice)
    @post = FactoryBot.create(:post)
  end


  end

end