require 'rails_helper'

RSpec.feature 'Adding Post to a forum thread' do
  before do
    @user = create(:admin_user)
    @category = create(:forum_category, user_id: @user.id)
    @forum_topic = create(:forum_topic, user_id: @user.id, forum_category_id: @category.id)
    @forum_thread1 = create(:forum_thread, user_id: @user.id, forum_topic_id: @forum_topic.id)
    @forum_post1 = create(:forum_post, user_id: @user.id, forum_thread_id: @forum_thread1)
  end

  context "when user is signed in" do
    before do
      sign_in_with(@user)
      visit '/forum_threads/1'
    end

    scenario 'they can add a new post to a thread' do
      puts page.body
      find('trix-editor').click.set('New text')
      click_button 'Submit Post'

      expect(page).to have_content('Post Saved')
    end

    scenario 'Post body must be present' do
      find('trix-editor').click.set('')
      click_button 'Submit Post'

      expect(page).to have_content("Body can't be blank")
    end

    scenario 'Post body must be at least 10 chars' do
      find('trix-editor').click.set('hhh')
      click_button 'Submit Post'

      expect(page).to have_content('Body is too short')
    end
  end

  context "when no user is signed in" do
    scenario 'visiter can not post to thread' do
      visit '/forum_threads/1'
      expect(page).not_to have_content('Leave a new post here...')
    end
  end
end
