class ForumsController < ApplicationController
  def index
    @pagy, @categories = pagy(ForumCategory.includes(:forum_topics).order(:position), items: 8)
    @threads = ForumThread.includes(:user).all
    @latest_threads = @threads.order('created_at DESC')
  end

  def latest
    @threads = ForumThread.order('created_at DESC')
  end

  def most_comments
    # @threads = ForumThread.includes(:forum_posts).all
    @threads = ForumThread.includes(:forum_posts).order(forum_posts.count)
  end

end
