require 'rails_helper'

RSpec.feature 'User can follow a thread and recive email updates' do
  before do
    @user = create(:user)
    @post = create(:forum_post_in_thread,user_id: @user.id)
    @user2 = create(:user)
  end

  context "when User signed in" do
    before do
      sign_in_with @user2
      visit forum_thread_path(@post.forum_thread)
    end

    scenario 'User is able to follow and unfollow a thread' do
      accept_alert do
        click_on('Follow Thread')
      end

      expect(page).to have_content('You will now recive email updates about this thread')
      expect(page).not_to have_content('Follow Thread')

      click_on('Unfollow Thread')
      expect(page).to have_content('Follow Thread')
      expect(page).not_to have_content('Unfollow Thread')
    end
  end
end
