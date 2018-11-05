require 'rails_helper'

RSpec.feature 'Visiting Home index' do
  before do
    visit '/'
  end

  context 'when no user signed in' do
    pending 'navbar shows user sigined out' do
      expect(page).to have_css('.navbar-brand', text: 'Sprout Free')
      expect(page).to have_content('Log In')

      expect(page).not_to have_content('Sign out')
      expect(page).not_to have_content('My Account')
    end
  end
end
