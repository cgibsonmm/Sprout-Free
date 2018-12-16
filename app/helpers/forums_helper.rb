module ForumsHelper
  def first_post_in_thread?(thread, post)
    thread.forum_posts.first == post
  end
end
