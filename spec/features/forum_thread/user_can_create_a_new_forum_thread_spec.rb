require 'rails_helper'

RSpec.feature 'User creates new forum thread' do
  before do
    @post = {title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph}
    @user = create(:user)
    @topic = create(:forum_topic)
  end

  context 'Signed in user' do
    before do
      sign_in_with(@user)
      click_link 'Community Forum'
      expect(page).to have_content 'Forum'
      click_link @topic.title
    end

    scenario 'can create a new forum thread' do
      click_link 'New Thread'

      fill_in("Title", with: @post[:title])
      find('trix-editor').click.set(@post[:body])
      click_button 'Post New Thread'

      expect(page).to have_content('Successfully created a new thread')
      expect(page).to have_content(@post[:title])
      expect(page).to have_content(@post[:body])
    end
    # Rest of validation housed in Creating ForumPost Spec
  end

  context 'No user signed in' do
    before do
      visit '/'
      expect(page).to have_content('Log In')
      click_link 'Forum'
      click_link @topic.title
    end
    scenario 'User must be signed in to create a forum thread' do
      click_link 'New Thread'

      expect(page).to have_content('You need to Log In or sign up before continuing')

      visit '/forum_topics/1/forum_threads/new'
      expect(page).to have_content('You need to Log In or sign up before continuing')
    end
  end
end
