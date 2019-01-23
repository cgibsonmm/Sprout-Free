require 'rails_helper'

RSpec.feature 'Viewing index of news stories' do
  before do
    @admin = create(:admin_user)
    6.times do
      story = create(:published_news_story, user_id: @admin.id)
    end
  end

  scenario 'all Users can view all News storys in chronligical order' do
    visit '/news_stories'

    expect(page).to have_selector('.news_story', count: 6)
  end
end
