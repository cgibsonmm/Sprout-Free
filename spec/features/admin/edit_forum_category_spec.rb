require 'rails_helper'

RSpec.feature "edit forum category" do
  before do
    @admin = create(:admin_user)
    @user = create(:user)
    @category = create(:forum_category, user_id: @admin.id)
    @old = @category.title
    @updates = 'new subject tile'
  end

  context "when admin user" do
    before do
      sign_in_with(@admin)
      visit '/forum_categories'
    end

    scenario  "can edit a forum category" do
      click_link @category.title
      click_link 'Edit'
      fill_in 'Title', with: @updates
      click_on'Update Forum category'
      expect(page).to have_content 'Successfully'
      expect(page).not_to have_content @old
    end
  end

  context 'when user' do
    before do
      sign_in_with(@user)
    end

    scenario 'can not edit or update the category' do
      visit '/forum_categories'
      click_link @category.title
      expect(page).not_to have_content('Edit')
      visit "/forum_categories/#{@category.id}/edit"
      expect(page).to have_content("You are not authorized")
    end
  end
end
