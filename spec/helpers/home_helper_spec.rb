require 'rails_helper'

RSpec.describe HomeHelper, type: :helper do
  it 'displays a total count for all users' do
    user1 = create(:user)
    user2 = create(:user)

    user_count = helper.total_users

    expect(user_count).to eq(2)
  end
end
