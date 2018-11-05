require 'rails_helper'

RSpec.feature 'User likes a Thread' do
  before do
  end
  context "when User is logged in" do
    pending 'User is able to like a thread' do
      click_link 'Like'
      expect(page).to have_content('liked thread')
    end
  end
end
