class ForumThreadsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_forum_thread, except: [:index, :new, :create]
  # before_action :set_forum_topic

  def index
    # @q = ForumThread.search(params[:q])
    # @forum_threads = @q.result(distinct: true).includes(:user)
  end

  def show
    @forum_post = ForumPost.new
  end

  def new
    @forum_topic = ForumTopic.find(params[:forum_topic_id])
    @forum_thread = @forum_topic.forum_threads.build
    @forum_thread.forum_posts.new
  end

  def create
    @forum_topic = ForumTopic.find(params[:forum_topic_id])
    @forum_thread = @forum_topic.forum_threads.build(create_params)
    @forum_thread.user = current_user
    # @forum_thread = current_user.forum_threads.new(forum_thread_params)
    @forum_thread.forum_posts.first.user_id = current_user.id

    if @forum_thread.save
      redirect_to @forum_thread
      flash[:success] = "Successfully created a new thread"
    else
      flash.now[:error] = @forum_thread.errors.full_messages
      render 'new'
    end
  end

  private

  # def set_forum_topic
  #   @forum_topic = ForumTopic.find(params[:forum_topic_id])
  # end

  def set_forum_thread
    @forum_thread = ForumThread.find(params[:id])
  end

  def create_params
    params.require(:forum_thread).permit(:subject, :forum_topic_id, forum_posts_attributes: [:body])
  end
end
