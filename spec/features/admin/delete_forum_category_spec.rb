require 'rails_helper'

RSpec.feature 'Deleting a forum category' do
  before do
    @admin = create(:admin_user)
    @user  = create(:user)
    @category = create(:forum_category, user_id: @admin.id)
  end

  context 'when admin' do
    before do
      sign_in_with(@admin)
      visit "/forum_categories/#{@category.id}/edit"
    end

    scenario 'can delete a category' do
      accept_alert do
        click_link 'Delete category'
      end

      expect(page).to have_content('deleted')
      expect(page).not_to have_content(@category.title)
    end
  end
end
