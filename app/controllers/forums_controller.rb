class ForumsController < ApplicationController
  def index
    @categories = ForumCategory.order(:position)
    @threads = ForumThread.all
  end
end
