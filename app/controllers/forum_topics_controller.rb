class ForumTopicsController < ApplicationController
  load_and_authorize_resource
  before_action :set_forum_topic, only: [:show, :destroy]

  def index
    @forum_topics = ForumTopic.order(:position)
    @forum_threads = ForumThread.order('Created_at DESC').includes(:user)
  end

  def new
    @forum_topic = ForumTopic.new
  end

  def create
    @forum_topic = ForumTopic.new(create_params)
    if @forum_topic.save
      flash[:success] = "Created new forum subject"
      redirect_to forum_topics_url
    else
      flash[:error] = 'can not save'
      render 'new'
    end
  end

  def show
  end

  def sort
    params[:forum_topic].each_with_index do |id, index|
      ForumTopic.where(id: id).update_all(position: index + 1)
    end

    head :ok
  end

  def destroy
    if @forum_topic.destroy
      flash[:notice] = "Subject Deleted"
      redirect_to forum_topics_path
    end
  end

  private

  def set_forum_topic
    @forum_topic = ForumTopic.find(params[:id])
  end

  def create_params
    params.require(:forum_topic).permit(:title)
  end
end
