require 'rails_helper'

RSpec.feature 'Admin can delete a subject' do
  before do
    @user = create(:user, username: 'useruser', email: 'hello@emsil.com')
    @cat = create(:forum_category)
    @admin = create(:user, id: 2) # TODO: Admin
    @admin.add_role :admin
    @subject = create(:forum_topic)
  end

  context 'when signed in as admin' do
    before do
      sign_in_with @admin
      visit '/forum_topics/1'
    end

    scenario 'can delete a subject' do
      click_link 'X'
      expect(page).to have_content('Subject Deleted')
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
