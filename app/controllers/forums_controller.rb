class ForumsController < ApplicationController
  def index
    @categories = ForumCategory.all
  end
end
