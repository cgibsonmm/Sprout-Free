class HomeController < ApplicationController
  before_action :top_forum_thread

  def index
    @latest_forum_thread = ForumThread.last
  end

  private

  def top_forum_thread
    @top_thread = ForumThread.all.max_by { |thread| thread.forum_posts.count }
  end
end
