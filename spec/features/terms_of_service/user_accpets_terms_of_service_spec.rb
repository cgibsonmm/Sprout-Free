require 'rails_helper'

RSpec.feature 'User terms of service', js: true do
  before do
    @user = create(:user, terms_of_service: false)
    sign_in_with @user
  end
  scenario 'they must accept the terms of service' do
    within('.modal-footer') do
      click_on('Accept Terms of Service')
    end

    expect(page).to have_content('Thank you!')
    expect(page).not_to have_content('#terms_modal')
  end
end
