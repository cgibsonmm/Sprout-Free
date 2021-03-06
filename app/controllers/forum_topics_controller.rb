class ForumTopicsController < ApplicationController
  load_and_authorize_resource
  helper_method :sort_column, :sort_direction
  add_breadcrumb 'Forums', :forums_path
  add_breadcrumb 'Categories', :forum_categories_path
  before_action :set_forum_category, only: [:new, :create]
  before_action :set_forum_topic, only: [:show, :destroy, :edit, :update]

  def index
    @forum_topics = ForumTopic.order(:position)
    @forum_threads = ForumThread.order('Created_at DESC').includes(:user)
  end

  def new
    @forum_topic = @forum_category.forum_topics.new
  end

  def create
    @forum_topic = @forum_category.forum_topics.build(create_params)
    @forum_topic.user_id = current_user.id
    if @forum_topic.save
      flash[:success] = "Created new forum Topic"
      redirect_to @forum_topic
    else
      flash[:error] = @forum_topic.errors.full_messages
      render 'new'
    end
  end

  def show
    add_breadcrumb @forum_topic.forum_category.title , forum_category_path(@forum_topic.forum_category)
    @topic_threads = @forum_topic.forum_threads.order("#{sort_column} #{sort_direction}").includes(:user)
  end

  def edit
  end

  def update
    if @forum_topic.update(update_params)
      flash[:success] = 'Updated Topic Title'
      redirect_to @forum_topic
    else
      flash[:error] = @forum_topic.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    if @forum_topic.destroy
      flash[:success] = "Topic Deleted"
      redirect_to '/forums'
    end
  end

  def sort
    params[:forum_topic].each_with_index do |id, index|
      ForumTopic.where(id: id).update_all(position: index + 1)
    end

    head :ok
  end

  private

  def sortable_columns
    ["created_at"]
  end

  def sort_column
    sortable_columns.include?(params[:column]) ? params[:column] : "created_at"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end

  def set_forum_category
    @forum_category = ForumCategory.friendly.find(params[:forum_category_id])
  end

  def set_forum_topic
    @forum_topic = ForumTopic.friendly.find(params[:id])
  end

  def create_params
    params.require(:forum_topic).permit(:title, :description, :user_id, :forum_categories_id)
  end

  def update_params
    params.require(:forum_topic).permit(:title, :description)
  end
end
