require 'rails_helper'

RSpec.feature 'Adding Post to a forum thread' do
  before do
    @user = create(:user)
    @forum_subject = create(:forum_subject)
    @forum_thread1 = create(:forum_thread)
    @forum_post1 = create(:forum_post)
  end

  context "when user is signed in" do
    before do
      sign_in_with(@user)
      visit '/forum_threads/1'
    end

    scenario 'they can add a new post to a thread' do
      fill_in('Leave a new post here...', with: 'This is a great thread')
      click_button 'Submit Post'

      expect(page).to have_content('Post Saved')
    end

    scenario 'Post body must be present' do
      fill_in('Leave a new post here...', with: '')
      click_button 'Submit Post'

      expect(page).to have_content("Body can't be blank")
    end

    scenario 'Post body must be at least 10 chars' do
      fill_in('Leave a new post here...', with: 'hhh')
      click_button 'Submit Post'

      expect(page).to have_content('Body is too short')
    end
  end

  context "when no user is signed in" do
    scenario 'visiter can not post to thread' do
      visit '/forum_threads/1'
      fill_in('Leave a new post here...', with: 'Hey this is really good!')
      click_button 'Submit Post'

      expect(page).to have_content('You need to sign in or sign up before continuing')
      visit '/forum_threads/1'
      expect(page).not_to have_content('Hey this is really good!')
    end
  end
end
