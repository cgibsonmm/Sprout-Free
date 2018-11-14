require 'rails_helper'

RSpec.feature 'Admin can delete a subject' do
  before do
    @user = create(:user)
    @cat = create(:forum_category)
    @admin = create(:admin_user) # TODO: Admin
    @subject = create(:forum_topic)
  end

  context 'when signed in as admin' do
    before do
      sign_in_with @admin
      visit '/forum_topics/1'
    end

    scenario 'can delete a subject' do
      click_link 'Delete'
      expect(page).to have_content('Topic Deleted')
      expect(page).not_to have_content(@subject.title)
    end
  end

  context 'when signed in as user' do
    before do
      sign_in_with @admin
      visit '/'
    end

    scenario 'can not delete a subject' do
      expect(page).not_to have_css('a', text: 'X')
    end
  end
end
