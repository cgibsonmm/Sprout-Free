require 'rails_helper'

RSpec.feature 'Admin can create a site wide notification', :js do
  before do
    @user = create(:user)
    @admin = create(:admin_user)
    @data = {title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph}
  end

  context "when admin" do

    before do
      sign_in_with @admin
      visit '/forums'
    end

    scenario 'can create and deliver a site wide notification' do
      click_on 'New Site Notification'

      fill_in 'Title', with: @data[:title]
      find('trix-editor').click.set(@data[:body])
      click_on 'Create Site notification'

      expect(page).to have_content('Site notification posted')
    end
  end


end
