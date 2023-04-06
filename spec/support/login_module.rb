module LoginModule
  def login(user)
    visit new_user_session_path
    fill_in 'user[name]', with: 'テスト'
    fill_in 'user[email]', with: 'test@sample.com'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    click_button 'ログイン'
  end
end
