require 'rails_helper'

RSpec.feature 'Admin adds new story' do
  before do
    @admin = create(:admin_user)
    @story = { heading: Faker::Lorem.sentence, body: Faker::Lorem.paragraph }
  end

  context 'when signed in as admin' do
    before do
      sign_in_with @admin
    end

    scenario 'user can create a news story' do
      visit root_path
      click_link 'Cannabis News'
      click_link 'Add News Story'

      fill_in 'Heading', with: @story[:heading]
      fill_in_trix_editor('news_story_body', @story[:body])

      click_on 'Preview'
      expect(page).to have_content("Previewing - #{@story[:heading]}")

      click_on 'Publish Story'
      expect(page).to have_content("Successfully published #{@story[:heading]}")
      expect(page).to have_content('Published')
    end
  end
end
