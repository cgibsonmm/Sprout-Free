require 'rails_helper'
require 'local_time'

RSpec.describe 'forum thread helper', type: :helper do

  # render_time_ago
  it 'displays formated time for the last post' do
    # when nil
    post = create(:forum_post)
    post_time = post.created_at
    time = nil
    formated_response = helper.render_time_ago(time)

    expect(formated_response).to eq('No Comments')

    formated_response = helper.render_time_ago(post_time)
    expect(formated_response).to eq(helper.local_time_ago(Time.now))
  end
end
