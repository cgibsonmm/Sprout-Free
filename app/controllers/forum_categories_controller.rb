class ForumCategoriesController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!, except: [:show]
  before_action :set_forum_category, except: [:new, :create, :index]

  def index
  end

  def new
    @forum_category = ForumCategory.new
  end

  def create
    @forum_category = current_user.forum_categories.build(create_params)
    @forum_category.save
    flash[:success] = 'Successfully created a new category'
    redirect_to @forum_category
  end

  def show
  end

  def edit
  end

  def update
    if @forum_category.update(update_params)
      flash[:success] = "Successfully updated category"
      redirect_to @forum_category
    end
  end

  private

  def set_forum_category
    @forum_category = ForumCategory.find(params[:id])
  end

  def create_params
    params.require(:forum_category).permit(:title, :user_id)
  end

  def update_params
    params.require(:forum_category).permit(:title)
  end
end
