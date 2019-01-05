require 'rails_helper'

RSpec.feature 'user can edit their thread' do
  before do
    @user = create(:user)
    @thread = create(:forum_post_in_thread, user_id: @user.id)
    @new_content = {subject: Faker::Lorem.sentence, body: Faker::Lorem.paragraph}
    5.times do
      user = create(:user)
      post = create(:forum_post_in_thread,user: user, forum_thread_id: @thread.id)
    end
  end

  context 'when user signed in' do
    before do
      sign_in_with(@user)
      visit 'forum_threads/1'
    end

    scenario 'can edit their thread' do
      click_link('Edit')
      expect(page).to have_content("Edit #{@thread[:subject]}")

      find('trix-editor').click.set(@new_content[:body])
      click_button 'Update Forum post'

      expect(page).to have_content('Updated Post')
    end
  end
end
