class ForumCategoriesController < ApplicationController
  before_action :set_forum_category, except: [:new, :create]

  def new
    @forum_category = ForumCategory.new
  end

  def create
    @forum_category = ForumCategory.new(category_params)
    @forum_category.save
    flash[:success] = 'Successfully created a new category'
    redirect_to @forum_category
  end

  def show
  end

  private

  def set_forum_category
    @forum_category = ForumCategory.find(params[:id])
  end

  def category_params
    params.require(:forum_category).permit(:title)
  end
end
