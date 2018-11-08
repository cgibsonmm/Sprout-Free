class ForumsController < ApplicationController
  def index
    @categories = ForumCategory.order(:position)
  end
end
