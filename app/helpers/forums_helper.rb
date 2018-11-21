module ForumsHelper

  def first_post_in_thread?(post, thread)
    thread.forum_posts.first == post
  end
end
