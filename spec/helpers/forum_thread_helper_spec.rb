require 'rails_helper'
require 'local_time'

RSpec.describe 'forum thread helper', type: :helper do

  # render_time_ago
  it 'displays formated time for the last post' do
    # when nil
    time = nil
    formated_response = helper.render_time_ago(time)

    expect(formated_response).to eq(formated_response)

    time = Time.now
    formated_response = helper.render_time_ago(time)
    expect(formated_response).to have_content(Time.now.strftime("%B %d, %Y"))
  end
end
