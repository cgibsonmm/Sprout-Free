require 'rails_helper'

RSpec.feature 'Viewing forum posts(fourm_threads/show)' do
  before do
    @user = create(:user)
    @forum_subject = create(:forum_subject)
    @forum_thread1 = create(:forum_thread)
    @forum_post = create(:forum_post)
  end

  context 'when user signed in' do
    before do
      sign_in_with(@user)
      visit '/forum_subjects/1/forum_threads'
    end

    scenario 'User can view a single forum post' do
      click_link @forum_thread1.subject

      expect(page).to have_content(@forum_thread1.subject)
      expect(page).to have_content(@forum_thread1.user.username)
      expect(page).to have_content(@forum_post.body)
    end
  end

  context "when user is not signed in" do
    scenario 'visiter can view single forum post' do
      visit '/forum_subjects/1/forum_threads'
      click_link @forum_thread1.subject

      expect(page).to have_content(@forum_thread1.subject)
      expect(page).to have_content(@forum_thread1.user.username)
      expect(page).to have_content(@forum_post.body)
    end
  end
end
