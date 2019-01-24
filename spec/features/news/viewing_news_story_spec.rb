require 'rails_helper'

RSpec.feature 'Viewing a news story spec' do
  before do
    @admin = create(:admin_user)
    @story = create(:published_news_story, user_id: @admin.id)
  end

  scenario 'User can view a single news story' do
    visit '/news_stories'

    within('#news_story_1') do
      click_on('Read More...')
    end

    expect(page).to have_content(@story.heading)
    expect(page).to have_content(@story.body)
  end
end
