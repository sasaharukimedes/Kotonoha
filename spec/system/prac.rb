require 'rails_helper'

RSpec.describe User, type: :system do
  #before do
    #driven_by(:rack_test)
    #@alice = build(:alice)
    #@user = build(:user)
  #end

  let(:alice) { create(:alice)}
  #let(:user) { create(:user)}

  describe 'User CRUD' do
    describe 'before sign in' do
      describe 'sign in' do
        content 'sign_in form is valid' do
          it 'is valid with username, email, password, birthday, and received_at' do
            visit sign_up path
            fill_in 'username', with: 'Alice'
            fill_in 'Email', with: 'alice@example.com'
            fill_in 'Password', with: 'testuser'
            fill_in 'Password confirmation', with: 'testuser'
            fill_in 'birthday', with: '001996-11-09'

            #次のwith以降が怪しい要チェック
            fill_in 'received_at', with: Time.current
            click_button 'SignUp'
            expect(current_path).to eq login_path
            expect(page).to have_content "User was successfully created."
          end
        end
        content 'email is nil' do
          it 'is failed to sign in' do
            visit sign_up_path
            fill_in 'username', with: 'Alice'
            fill_in 'Email', with: nil
            fill_in 'Password', with: 'testuser'
            fill_in 'Password confirmation', with: 'testuser'
            fill_in 'birthday', with: '001996-11-09'
            fill_in 'received_at', with: Time.current
            click_button 'SignUp'
            expect(current_path).to eq users_path
            expect(page).to have_content "Email can't be blank"
          end
        end
        content 'email is already used' do
          it 'is failed to sign in' do
            visit sign_up_path
            fill_in 'username', with: 'Alice'
            fill_in 'Email', with: 'alice@example.com'
            fill_in 'Password', with: 'testuser'
            fill_in 'Password confirmation', with: 'testuser'
            fill_in 'birthday', with: '001996-11-09'
            fill_in 'received_at', with: Time.current
            click_button 'SignUp'
            expect(current_path).to eq users_path
            expect(page).to have_content "Email has already been taken"
          end
        end
      end
    end
    describe 'after sign in' do
      before {sign_in_as(alice)}
        describe 'edit account' do
          content 'edit form is valid' do
            it 'is success to edit account' do
              visit edit_user_path(alice)
              fill_in 'Email', with: 'alice@example.com'
              fill_in 'Password', with: 'test'
              fill_in 'Password confirmation', with: 'test'
              click_button 'Update'
              expect(current_path).to eq user_path(alice)
              expect(page).to have_content 'User was successfully updated.'
            end
          end
          content 'email is nil' do
            it 'is fail to edit account' do
              visit edit_user_path(alice)
              fill_in 'Email', with: nil
              fill_in 'Password', with: 'testuser'
              fill_in 'Password confirmation', with: 'testuser'
              click_button 'Update'
              expect(current_path).to eq user_path(user)
              expect(page).to have_content "Email can't be blank"
            end
          end
        end
      end
    end
  end
end
#pending "add some scenarios (or delete) #{__FILE__}"