require 'rails_helper'

RSpec.feature 'Admin creates a new forum category' do
  before do
    @title = 'First Category'
  end

  context 'When signed in as admin' do
    before do
      @admin = FactoryBot.create(:admin_user)
      sign_in_with(@admin)
      @admin.add_role(:admin)
      puts @admin.is_admin?
    end

    scenario 'can create a new category' do
      visit '/forums'
      click_link('New Category')
      fill_in 'Title', with: @title
      click_on 'Create Category'

      expect(page).to have_content('Successfully')
      expect(page).to have_content(@title)
    end
  end

  context 'When signed in as user' do
    before do
      @user = create(:user)
      @user.confirm
      sign_in_with(@user)
      visit '/forums'
    end

    scenario 'can not create a new category' do
      expect(page).not_to have_link('Create Category')

      visit '/forum_categories/new'
      expect(page).to have_content('You are not authorized')
    end
  end
end
