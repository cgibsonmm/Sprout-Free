module AuthHelpers

  def sign_in_with(user)
    visit '/'
    first(:link, 'Log In').click
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log In'
  end
end
