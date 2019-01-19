class HomeController < ApplicationController
  def index
    @latest_forum_thread = ForumThread.last
  end
end
