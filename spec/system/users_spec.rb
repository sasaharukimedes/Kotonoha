require 'rails_helper'

RSpec.describe User, type: :system do
  #include LoginModule
  let(:alice) { create(:alice)}
  #let(:user) { create(:user)}

  describe 'User CRUD' do
    describe 'before sign in' do
      describe 'sign in as new user' do
        context 'sign_in form is valid' do
          it "successed with sign in" do
            visit new_user_session_path
            fill_in 'Email', with: 'alice@example.com'
            fill_in 'Password', with: 'Password'
            fill_in 'Password confirmation', with: 'Password'
            click_button 'Signup'
            expect(current_path).to eq login_path
            expect(page).to have_content 'User was successfully created'
          end

        end
      end
    end
  end
end