require 'rails_helper'

RSpec.feature 'Admin creates a new forum category' do
  before do
    @admin = create_admin_user
    @title = 'First Category'
  end

  context 'When signed in as admin' do
    before do
      sign_in_with(@admin)
      visit '/forums'
    end

    scenario 'can create a new category' do
      click_link('New Category')
      fill_in 'Title', with: @title
      click_on 'Create Category'

      expect(page).to have_content('Successfully')
      expect(page).to have_content(@title)
    end
  end


end
