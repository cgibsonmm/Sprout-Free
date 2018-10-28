require 'rails_helper'

RSpec.feature 'Admin can delete a subject' do
  before do
    @user = create(:user) # TODO: Admin
    @subject = create(:forum_subject)
  end

  context 'when signed in as admin' do
    before do
      sign_in_with @user
      visit '/forum_subjects'
    end

    scenario 'can delete a subject' do
      click_link 'X'
      expect(page).to have_content('Subject Deleted')
      expect(page).not_to have_content(@subject.subject_name)
    end
  end
end
