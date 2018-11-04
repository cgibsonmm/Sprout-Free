require 'rails_helper'

RSpec.feature 'Admin can view index of forum categories' do
  before do
    @user = create(:user)
    @admin = create(:admin_user, id: 2)
    @category1 = create(:forum_category, user_id: 2)
    @category2 = create(:forum_category, user_id: 2)
  end

  context 'when signed in as admin' do
    before do
      sign_in_with(@admin)
      visit '/forum_categories'
    end

    scenario 'can view index of categories' do
      expect(page).to have_css('a', text: @category1.title)
      expect(page).to have_css('a', text: @category2.title)
    end
  end

  context "when signed in as user" do
    before do
      sign_in_with(@user)
      visit '/forum_categories'
    end

    scenario 'can see the index' do
      expect(page).to have_css('a', text: @category1.title)
      expect(page).to have_css('a', text: @category2.title)
    end
  end
end
