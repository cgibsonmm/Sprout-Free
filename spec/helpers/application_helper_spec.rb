require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  let(:admin_user) { create(:admin_user) }
  let(:user) { create(:user) }
  let(:user2) { create(:user)}
  # Admin?
  it ".admin? returns true if current_user is admin" do
    allow(helper).to receive(:current_user).and_return(admin_user)
    expect(helper.admin?).to be(true)
  end

  it '.admin? returns false if current_useris not admin' do
    allow(helper).to receive(:current_user).and_return(user)
    expect(helper.admin?).to be(false)
  end

  # root_controller?
  xit 'returns true if current controller is root' do
    # expect(helper.root_controller?).to be(true)
  end

  # admin_or_post_owner?
  it 'returns true when current_user owns post or admin' do
    allow(helper).to receive(:user_signed_in?).and_return(admin_user)
    allow(helper).to receive(:current_user).and_return(user)
    post = create(:forum_post, user_id: user.id)
    post_owner = helper.admin_or_post_owner?(post)

    expect(post_owner).to eq(true)
    allow(helper).to receive(:user_signed_in?).and_return(admin_user)
    allow(helper).to receive(:current_user).and_return(admin_user)
    post = create(:forum_post, user_id: user.id)
    post_owner = helper.admin_or_post_owner?(post)

    expect(post_owner).to eq(true)
    allow(helper).to receive(:user_signed_in?).and_return(admin_user)
    allow(helper).to receive(:current_user).and_return(user2)
    post = create(:forum_post, user_id: user.id)
    post_owner = helper.admin_or_post_owner?(post)

    expect(post_owner).to eq(false)
  end

  # user_admin?
  it 'returns true if user is admin' do
    allow(helper).to receive(:user_signed_in?).and_return(admin_user)
    allow(helper).to receive(:current_user).and_return(admin_user)
    expect(helper.user_admin?).to eq(true)

    allow(helper).to receive(:user_signed_in?).and_return(user)
    allow(helper).to receive(:current_user).and_return(user)
    expect(helper.user_admin?).to eq(false)

  end
end
