module AuthHelpers

  def create_user
    create(:user)
  end

  def create_confirmed_user
    @user = create_user
    @user.confirm
    @user
  end

  def create_admin_user
    @admin = create_confirmed_user
    @admin.add_role(:admin)
    @admin
  end

  def sign_in_with(user)
    visit '/'
    click_link 'Sign in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end
end
