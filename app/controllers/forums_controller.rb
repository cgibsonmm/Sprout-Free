class ForumsController < ApplicationController
  def index
    @categories = ForumCategory.includes(:forum_topics).order(:position)
    @threads = ForumThread.includes(:user).all
  end

  def latest
    @threads = ForumThread.order('created_at DESC')
  end

  def most_comments
    # @threads = ForumThread.includes(:forum_posts).all
    @threads = ForumThread.all
  end

end
