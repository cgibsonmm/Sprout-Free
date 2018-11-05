class ForumTopicsController < ApplicationController
  load_and_authorize_resource
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

  def set_forum_category
    @forum_category = ForumCategory.find(params[:forum_category_id])
  end

  def set_forum_topic
    @forum_topic = ForumTopic.find(params[:id])
  end

  def create_params
    params.require(:forum_topic).permit(:title, :user_id, :forum_categories_id)
  end

  def update_params
    params.require(:forum_topic).permit(:title)
  end
end
