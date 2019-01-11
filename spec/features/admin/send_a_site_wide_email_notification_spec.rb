require 'rails_helper'

RSpec.feature 'Admin can send email to all users' do
  before do
    @email = {subject: Faker::Lorem.sentence, title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph}
    @all_users = []
    50.times do
      user = create(:user)
      @all_users << user.email
    end
    @admin = create(:admin_user)
  end

  context "when Signed in as admin" do
    before do
      sign_in_with @admin
      visit '/forums'
    end
    scenario "can send an email to all users " do
      click_on('New Site Notification')
      find('#site_notification_email_me_true').set(true)
      find('#site_notification_to_notify_true').set(false)

      fill_in('Email subject', with: @email[:subject])
      fill_in('Title', with: @email[:title])
      fill_in_trix_editor('site_notification_body', @email[:body])
      click_on 'Create Site notification'

      expect(page).to have_content('Site notification posted')
      puts NotificationsMailer.site_notification_mailer.deliveries
    end

  end
end
