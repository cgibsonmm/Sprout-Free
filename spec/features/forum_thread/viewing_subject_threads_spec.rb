# require 'rails_helper'
#
# RSpec.feature 'viewing all threads under a subject' do
#   before do
#     @user = create(:user)
#     @topic = create(:forum_topic)
#     @thread = create(:forum_thread)
#   end
#
#   context 'when user signed in' do
#     before do
#       sign_in_with @user
#       visit '/'
#       click_link 'Forum'
#     end
#     scenario 'can view all threads under a single subject' do
#       click_link @subject.title
#
#       expect(page).to have_content(@thread.subject)
#     end
#   end
# end
