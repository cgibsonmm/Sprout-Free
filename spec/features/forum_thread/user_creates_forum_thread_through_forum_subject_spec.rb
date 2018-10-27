require 'rails_helper'

RSpec.feature 'User can create a new thread through forum subject' do
  before do
    @user = create(:user)
    @forum_subject1 = create(:forum_subject)
  end

  context "when user signed in" do
    before do
      sign_in_with @user
      visit '/'
    end

    scenario 'can create a new forum post under a forum subject' do
      click_link 'Forum'
      click_link @forum_subject1.subject_name
      expect(page).to have_content(@forum_subject1.subject_name)
      click_link 'New Thread'

      fill_in('Title', with: 'This is a new thread')
      fill_in_trix_editor('forum_post_body', 'This is a test body')
      click_button 'Post New Thread'

      expect(page).to have_content('Successfully created a new thread')
      expect(page).to have_content('This is a new thread')
      expect(page).to have_content('This is a test body')
    end
  end
end
