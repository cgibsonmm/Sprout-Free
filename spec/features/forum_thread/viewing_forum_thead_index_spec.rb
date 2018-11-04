# require 'rails_helper'
#
# RSpec.feature 'Viewing forum threads index spec' do
#   before do
#     @user1 = create(:user)
#     @user2 = create(:user, email:'testemail2@email.com', username: 'testuser2', id: 2)
#     @forum_topic = create(:forum_topic)
#     @forum_thread1 = create(:forum_thread)
#     @forum_thread2 = create(:forum_thread, subject: 'Second Forum Thread', user_id: 2)
#   end
#
#   context 'Signed in user' do
#     before do
#       sign_in_with(@user1)
#       visit '/forum_threads'
#     end
#
#     scenario 'can view index of all forum threads' do
#       expect(page).to have_content(@forum_thread1.subject)
#       expect(page).to have_content(@forum_thread2.subject)
#     end
#   end
#
#   context 'Signed out user' do
#     before do
#       visit '/forum_threads'
#     end
#     scenario 'can view index of all forum threads' do
#       expect(page).to have_content(@forum_thread1.subject)
#       expect(page).to have_content(@forum_thread2.subject)
#     end
#   end
# end
