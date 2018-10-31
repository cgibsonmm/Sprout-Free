require 'rails_helper'

RSpec.feature 'user can edit their thread' do
  before do
    @user = create(:user)
    @subject = create(:forum_subject)
    @thread = create(:forum_thread)
  end

  context 'when user signed in' do
    before do
      sign_in_with(@user)
      visit '/forum_subject/1/forum_thread'
    end

    scenario 'can edit their thread' do
      click_link('Edit')
      expect(page).to have_content('Edit')

      fill_in '', with: ''
      click_link 'Update'
      expect(page).to have_content('Success')
    end
  end
end
