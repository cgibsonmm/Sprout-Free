require 'rails_helper'

RSpec.feature 'Admin can send a recofirm mailer' do
  before do
    @admin = create(:admin_user)
    5.times do
      create(:non_confirmed_user)
    end
    @unconfirmed_user = create(:non_confirmed_user)
    7.times do
      create(:user)
    end
  end

  context 'When signed in as admin' do
    before do
      sign_in_with @admin
      visit '/forums'
    end

    scenario 'can send email reminder to confirm users' do
      click_link('Send Confirm Reminder')

      confirmation_email = ReconfirmMailer.deliveries.last
      expect(@unconfirmed_user.email).to eq confirmation_email.to[0]
      expect(page).to have_content("sent email to 6 unconfirm users")
    end
  end

  context 'when user' do
    before do
      @user = create(:user)
      sign_in_with(@user)
      visit '/forums'
    end

      scenario 'user can not see link to send' do
        expect(page).not_to have_link("Send Confirm Reminder")
      end
  end
end
