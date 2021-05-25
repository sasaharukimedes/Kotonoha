module LoginModule
  def login(alice)
    visit login_path
    #click_link "Sign in"
    fill_in "Email", with: alice.email
    fill_in "Password", with: alice.password
    click_button "Login"
  end
  #もともとuser => alice
end
