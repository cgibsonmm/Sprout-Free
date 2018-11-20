class ForumCategoriesController < ApplicationController
  load_and_authorize_resource
  add_breadcrumb "Forum", :forums_path
  add_breadcrumb "Categories", :forum_categories_path

  before_action :authenticate_user!, except: [:show]
  before_action :check_admin, except: [:show]
  before_action :set_forum_category, except: [:new, :create, :index, :sort]

  def index
    @forum_categories = ForumCategory.order(:position).includes(:user)
  end

  def sort
    params[:forum_category].each_with_index do |id, index|
      ForumCategory.where(id: id).update_all(position: index + 1)
    end

    head :ok
  end

  def new
    @forum_category = ForumCategory.new
  end

  def create
    @forum_category = current_user.forum_categories.build(create_params)
    if @forum_category.save
      flash[:success] = 'Successfully created a new category'
      redirect_to @forum_category
    else
      flash[:error] = @forum_category.errors.full_messages
      render 'new'
    end
  end

  def show
    add_breadcrumb @forum_category.title
  end

  def edit
  end

  def update
    if @forum_category.update(update_params)
      flash[:success] = "Successfully updated category"
      redirect_to @forum_category
    else
      flash[:error] = @forum_category.error.full_messages
      render 'edit'
    end
  end

  def destroy
    if @forum_category.destroy
      flash[:success] = "Successfully deleted category"
      redirect_to forum_categories_path
    else
      flash[:error] = 'Error please view logs'
      render 'edit'
    end
  end

  private

  def check_admin
    unless current_user.has_role?(:admin)
      redirect_to forums_path
    end
  end

  def set_forum_category
    @forum_category = ForumCategory.friendly.find(params[:id])
  end

  def create_params
    params.require(:forum_category).permit(:title, :user_id)
  end

  def update_params
    params.require(:forum_category).permit(:title)
  end
end
