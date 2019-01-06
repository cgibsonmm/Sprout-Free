require 'rails_helper'

RSpec.feature 'User terms of service' do
  before do
    @user = create(:user)
  end

  context 'when user signs into site' do
    before do
      sign_in_with @user
    end
    pending 'they must accept the terms of service' do
      within('#terms_modal') do
        page.should have_content('Our Terms of Service have changed') # async
      end
      expect(page).to have_css('#terms_modal')

      click_link 'Appcept Terms of service'
      expect(page).to have_content('Thank you!')
    end
  end
end
