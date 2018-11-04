require 'rails_helper'

RSpec.feature 'User can create a new thread through forum topic' do
  before do
    @admin = create(:admin_user, username: 'anewu123', email: 'new@email.com')
    @user = create(:user, id: 3)
    @forum_topic1 = create(:forum_topic)
  end

  context "when user signed in" do
    before do
      sign_in_with @user
      visit '/'
    end

    scenario 'can create a new forum post under a forum topic' do
      click_link 'Forum'
      click_link @forum_topic1.title
      expect(page).to have_content(@forum_topic1.title)
      click_link 'New Thread'

      fill_in('Title', with: 'This is a new thread')
      fill_in_trix_editor('trix-body_trix_input_forum_post', 'This is a test body')
      click_button 'Post New Thread'

      expect(page).to have_content('Successfully created a new thread')
      expect(page).to have_content('This is a new thread')
      expect(page).to have_content('This is a test body')
    end
  end
end
