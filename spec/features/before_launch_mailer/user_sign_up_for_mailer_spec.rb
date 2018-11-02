require 'rails_helper'

RSpec.feature 'Sign up for updates mailer' do
  before do
    visit root_path
  end

  scenario 'User can sign up for updates mailer' do
    fill_in 'Email', with: 'Myemail@gmail.com'
    click_on 'Notify Me!'

    expect(page).to have_content('You are signed up for email updates!')
    expect(page).not_to have_content('#email')
  end
end
