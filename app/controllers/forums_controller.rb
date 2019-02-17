class ForumsController < ApplicationController
  before_action :most_comments
  
  def index
    @pagy, @categories = pagy(ForumCategory.includes(:forum_topics).order(:position), items: 8)
    @threads = ForumThread.includes(:user).all
    @latest_threads = @threads.order('created_at DESC')
  end

  def latest
    @threads = ForumThread.order('created_at DESC')
  end

  private

  def most_comments
    @top_thread = ForumThread.all.max_by { |thread| thread.forum_posts.count }
  end
end
