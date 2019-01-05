require 'rails_helper'

RSpec.feature 'deleting a post from forum thread' do
  before do
    @user = create(:user)
    thread = create(:forum_post_in_thread,user_id: 1)
    post = create(:forum_post_in_thread,forum_thread_id: 1, user_id: @user.id)
  end

  context "when user is signed in" do
    before do
      sign_in_with(@user)
      visit '/forum_threads/1'
    end

    scenario 'a user can delete their own post from thread' do
      accept_alert do
        click_link 'Delete'
      end
      expect(page).to have_content('Post deleted')
      expect(page).not_to have_content('Hey this is user2')
    end
  end
end
