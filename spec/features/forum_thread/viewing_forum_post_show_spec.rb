require 'rails_helper'

RSpec.feature 'Viewing forum posts(fourm_threads/show)' do
  before do
    @user = create(:user)
    # @cat = create(:forum_category)
    # @forum_topic = create(:forum_topic)
    @forum_post = create(:forum_post)
  end

  context 'when user signed in' do
    before do
      sign_in_with(@user)
      visit '/forum_topics/1/forum_threads'
    end

    scenario 'User can view a single forum post' do
      click_link @forum_post.forum_thread.subject

      expect(page).to have_content(@forum_post.forum_thread.subject)
      expect(page).to have_content(@forum_post.user.username)
      expect(page).to have_content(@forum_post.body)
    end
  end

  context "when user is not signed in" do
    scenario 'visiter can view single forum post' do
      visit '/forum_topics/1/forum_threads'
      click_link @forum_post.forum_thread.subject

      expect(page).to have_content(@forum_post.forum_thread.subject)
      expect(page).to have_content(@forum_post.user.username)
      expect(page).to have_content(@forum_post.body)
    end
  end
end
