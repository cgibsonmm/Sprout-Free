require 'rails_helper'

RSpec.feature 'Adding Post to a forum thread' do
  before do
    @user = create(:user)
    @category = create(:forum_category, user_id: @user.id)
    @forum_topic = create(:forum_topic, user_id: @user.id, forum_category_id: @category.id)
    @forum_thread1 = create(:forum_thread, user_id: @user.id)
    @forum_post1 = create(:forum_post)
  end

  context "when user is signed in" do
    before do
      sign_in_with(@user)
      visit '/forum_threads/1'
    end

    scenario 'they can add a new post to a thread' do
      fill_in_trix_editor('forum_post_body', 'You will discover treasures of Anatolia')
      click_button 'Submit Post'

      expect(page).to have_content('Post Saved')
    end
  end

  context "when no user is signed in" do
    scenario 'visiter can not post to thread' do
      visit '/forum_threads/1'
      expect(page).not_to have_content('Leave a new post here...')
    end
  end
end
