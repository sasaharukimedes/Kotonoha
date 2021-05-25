require 'rails_helper'

Rspec.describe User, type: :system do
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
        content 'email is nil' do

        end
        content 'email is already used' do

        end
      end
    end

    describe 'after sign in' do
      describe 'edit user' do
        content 'edit_form is valid' do

        end
        content 'email is nil' do

        end
      end
    end
  end
end