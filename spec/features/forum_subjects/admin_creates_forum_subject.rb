require 'rails_helper'

RSpec.feature 'Admin creates forum subject' do
  before do
    @user = create(:user) # TODO: Admin
  end

  context 'when signed in as admin' do
    before do
      sign_in_with @user
      visit '/forum_subjects/new'
    end

    scenario 'can create a new forum subject' do
      fill_in 'Subject name', with: 'First Subject'
      click_button 'Create Forum subject'

      expect(page).to have_content('Created new forum subject')
      expect(page).to have_content('First Subject')
    end

    scenario 'forum subject name must be present' do
      fill_in 'Subject name', with: ''
      click_button 'Create Forum subject'

      expect(page).not_to have_content('Created new forum subject')
      expect(page).not_to have_content('First Subject')
    end
  end

  context 'when not signed in as Admin' do
    scenario 'can not create a new forum subject' do
      visit '/forum_subjects/new'

      expect(page).to have_content('You need to sign in')
    end
  end
end
