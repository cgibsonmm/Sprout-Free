require 'rails_helper'

RSpec.feature 'user can edit their thread' do
  before do
    @user = create(:user)
    @category = create(:forum_category)
    @topic = create(:forum_topic, forum_category_id: 1)
    @thread = create(:forum_thread, forum_topic_id: 1, user_id: 1)
    @new_content = {subject: Faker::Lorem.sentence, body: Faker::Lorem.paragraph}
  end

  context 'when user signed in' do
    before do
      sign_in_with(@user)
      visit 'forum_threads/1'
    end

    pending 'can edit their thread' do
      puts page.body
      click_link('Edit')
      expect(page).to have_content('Edit Thread')

      fill_in :body, with: @new_content[:subject]
      click_link 'Update'

      expect(page).to have_content('Success')
    end
  end
end
