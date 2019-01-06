require 'rails_helper'

RSpec.feature 'User Grow With Us' do
  let(:user_params) do
    { username: 'testuser1',
      email: 'test@email.com',
      password: 'password123' }
  end

  before do
    visit '/'
  end

  scenario 'website visitor can Grow With Us for an account' do
    first(:link, 'Grow With Us').click

    fill_in 'Username', with: 'testuser2'
    fill_in 'Email', with: 'testemail@gmail.com'
    fill_in 'user_password', with: 'password123'
    fill_in 'user_password_confirmation', with: 'password123'
    find(:css, "#user_terms_of_service").set(true)

    click_button 'Sign up'

    expect(page).to have_content("Please follow the link to activate your account.")
  end

  context 'Validations' do
    before do
      @user = create(:user)
      first(:link, 'Grow With Us').click
    end

    scenario 'username must be present' do
      fill_in 'Username', with: ''
      fill_in 'Email', with: user_params[:email]
      fill_in 'user_password', with: user_params[:password]
      fill_in 'user_password_confirmation', with: user_params[:password]
      find(:css, "#user_terms_of_service").set(true)
      click_button 'Sign up'

      expect(page).to have_content("Username can't be blank")
      expect(page).not_to have_content('Sign out')
    end

    scenario 'username must be unique' do
      fill_in 'Username', with: @user.username
      fill_in 'Email', with: user_params[:email]
      fill_in 'user_password', with: user_params[:password]
      fill_in 'user_password_confirmation', with: user_params[:password]
      find(:css, "#user_terms_of_service").set(true)
      click_button 'Sign up'

      expect(page).to have_content("Username has already been taken")
      expect(page).not_to have_content('Sign out')
    end

    scenario 'user must accept terms of service' do
      fill_in 'Username', with: @user.username
      fill_in 'Email', with: user_params[:email]
      fill_in 'user_password', with: user_params[:password]
      fill_in 'user_password_confirmation', with: user_params[:password]
      click_button 'Sign up'

      expect(page).to have_content("Terms of service must be accepted")
      expect(page).not_to have_content('Sign out')
    end
  end
end
