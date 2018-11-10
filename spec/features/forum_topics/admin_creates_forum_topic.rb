require 'rails_helper'

RSpec.feature 'Admin creates forum topic' do
  before do
    @user = create(:user) # TODO: Admin
    @admin = create(:admin_user)
    @category = create(:forum_category)
    @content = {name: Faker::Lorem.sentence, description: Faker::Lorem.paragraph}
  end

  context 'when signed in as admin' do
    before do
      sign_in_with @admin
      visit '/forum_categories/1'
    end

    scenario 'can create a new forum topic' do
      click_link 'New Topic'
      fill_in 'Topic Title', with: @content[:name]
      fill_in 'Topic Description', with: @content[:description]
      click_button 'Create Forum topic'

      expect(page).to have_content('Created new forum Topic')
      expect(page).to have_content @content[:name]
      expect(page).to have_content @content[:description]
    end
  end

  context 'when not signed in as Admin' do
    scenario 'can not create a new forum topic' do
      visit 'forum_categories/1/forum_topics/new'

      expect(page).to have_content('You are not authorized to access this page')
    end
  end
end
