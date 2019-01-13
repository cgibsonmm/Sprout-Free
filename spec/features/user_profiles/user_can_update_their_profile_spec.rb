require 'rails_helper'

RSpec.feature 'User can create their user profile' do
  before do
    @user = create(:user)
    @user2 = create(:user , username: 'testuser2', id: 2)
    @context = {about: Faker::Lorem.paragraph}
  end

  context 'when user signed in' do
    before do
      sign_in_with(@user)
      visit '/'
    end

    scenario 'user can update their profile' do
      find('btn#user-btn.dropdown-toggle').click
      puts page.body
      click_link('My Profile')
      click_link 'Edit Profile'
      sleep 2
      fill_in 'About me', with: @context[:about]
      click_on 'Update Profile'
      expect(page).to have_content('Profile Updated')
      expect(page).to have_content(@context[:about])
    end

    scenario 'user can only edit their profile' do
      visit 'user_profiles/2'
      expect(page).to have_content(@user2[:username])
      expect(page).not_to have_content('Edit Profile')
    end
  end
end
