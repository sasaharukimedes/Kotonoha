module LoginModule
  def sign_in_as(alice)
    visit new_user_session_path
    fill_in 'user[email]', with: 'alice@example.com'
    fill_in 'user[password]', with: 'Password'
    click_button 'commit'
  end

  def sign_in_as (user)
    visit new_user_session_path
    fill_in 'user[email]', with: 'TEST#{n}@example.com'
    fill_in 'user[password]', with: 'Password'
    click_button 'commit'
  end
end