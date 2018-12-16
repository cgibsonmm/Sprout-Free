require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ForumsHelper. For example:
#
# describe ForumsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ForumsHelper, type: :helper do

  # first_post_in_thread?
  it 'is expected to return true if post is first in thread' do
    post1 = create(:forum_post)
    post2 = create(:forum_post, forum_thread_id: 1)
    thread = ForumThread.find(1)
    # True
    first_post = helper.first_post_in_thread?(thread, post1)
    expect(first_post).to be(true)

    # False
    second_post = helper.first_post_in_thread?(thread, post2)
    expect(second_post).to be(false)
  end
end
