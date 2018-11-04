require 'rails_helper'

RSpec.feature 'deleting a post from forum thread' do
  before do
    @user1 = create(:user)
    @forum_topic = create(:forum_topic)
    @forum_thread1 = create(:forum_thread)
    @forum_post1 = create(:forum_post)
    @user2 = create(:user, username: 'test_user_2', email: 'testemail2@email.com', id: '2')
    @forum_thread1 = create(:forum_thread)
    @forum_post2 = create(:forum_post, user_id: 2, body: 'Hey this is user2')
  end

  context "when user is signed in" do
    before do
      sign_in_with(@user2)
      visit '/forum_threads/1'
    end

    scenario 'a user can delete their own post from thread' do
      click_link 'X'
      expect(page).to have_content('Post Deleted')
      expect(page).not_to have_content('Hey this is user2')
    end
  end
end
