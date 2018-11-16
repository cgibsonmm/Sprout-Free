require 'rails_helper'

RSpec.feature 'User reccives email when following thread' do
  before do
    @user = create(:user)
    @user2 = create(:user)
    @thread = create(:forum_thread, user_id: @user.id)
  end

  context 'when user signed in' do
    before do
      sign_in_with @user2
      visit forum_thread_path(@thread)
    end

    scenario 'user recives an email when there is new post on thread' do
      click_on 'Follow Thread'
      @post = create(:forum_post, forum_thread_id: @thread.id)
    end
  end

end
