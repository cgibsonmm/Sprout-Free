require 'rails_helper'

RSpec.feature 'Editing News Story' do
  before do
    @user = create(:user)
    @admin = create(:admin_user)
    @story = create(:published_news_story, user_id: @admin.id)
    @new_story_body = Faker::Lorem.paragraph
    @current_body = @story[:body]
  end

  context 'When signed in as admin' do
    before do
      sign_in_with @admin
      visit '/news_stories'
    end

    scenario 'can edit news story' do
      within('#news_story_1') do
        click_on 'Read More...'
      end

      expect(page).to have_content(@current_body)
      click_link 'Edit'

      fill_in_trix_editor('news_story_body', @new_story_body)
      click_on 'Preview'
      expect(page).to have_content(@new_story_body)
      expect(page).not_to have_content(@current_body)
      click_on 'Publish Story'
      expect(page).to have_content(@new_story_body)
    end
  end

  context "when signed in with user" do
    before do
      sign_in_with @user
      visit '/news_stories/1'
    end

    scenario 'User can not edit story' do
      expect(page).not_to have_css('a', text: 'Edit')

      visit 'news_stories/1/edit'
      expect(page).not_to have_css('a', text: 'Preview')
    end

  end
end
