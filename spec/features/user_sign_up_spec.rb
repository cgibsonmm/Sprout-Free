require 'rails_helper'

RSpec.feature 'User sign up' do
  let(:user_params) do
    { username: 'testuser1',
      email: 'test@email.com',
      password: 'password123' }
  end

  before do
    visit '/'
  end

  scenario 'website visitor can sign up for an account' do
    click_link 'Grow With Us'

    fill_in 'Username', with: 'testuser2'
    fill_in 'Email', with: 'testemail@gmail.com'
    fill_in 'user_password', with: 'password123'
    fill_in 'user_password_confirmation', with: 'password123'
    click_button 'Sign up'

    expect(page).to have_content("Please follow the link to activate your account.")
  end

  context 'Validations' do
    before do
      create(:user)
      click_link 'Sign up'
    end

    scenario 'username must be present' do
      fill_in 'Username', with: ''
      fill_in 'Email', with: user_params[:email]
      fill_in 'user_password', with: user_params[:password]
      fill_in 'user_password_confirmation', with: user_params[:password]
      click_button 'Sign up'

      expect(page).to have_content("Username can't be blank")
      expect(page).not_to have_content('Sign out')
    end

    scenario 'username must be unique' do
      fill_in 'Username', with: 'testuser'
      fill_in 'Email', with: user_params[:email]
      fill_in 'user_password', with: user_params[:password]
      fill_in 'user_password_confirmation', with: user_params[:password]
      click_button 'Sign up'

      expect(page).to have_content("Username has already been taken")
      expect(page).not_to have_content('Sign out')
    end
  end
end
