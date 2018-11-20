class ForumThreadsController < ApplicationController
  load_and_authorize_resource
  add_breadcrumb 'Forums', :forums_path
  add_breadcrumb 'Categories', :forum_categories_path
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_egear_load, only: [:show]
  before_action :set_forum_thread, except: [:index, :new, :create, :show]
  # before_action :set_forum_topic

  def index
    @forum_threads = ForumThread.order('created_at DESC')
  end

  def show
    add_breadcrumb @forum_thread.forum_topic.forum_category.title, forum_category_path(@forum_thread.forum_topic.forum_category)
    add_breadcrumb @forum_thread.forum_topic.title, forum_topic_path(@forum_thread.forum_topic)
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

  def edit
  end

  def update
  end

  def destroy
    if @forum_thread.destroy
      flash[:now] = 'Thread has been deleted'
      redirect_to forum_topic_path(@forum_thread.forum_topic)
    else
      render 'edit'
      flash[:error] = @forum_thread.errors.full_messages
    end
  end

  private

  # def set_forum_topic
  #   @forum_topic = ForumTopic.find(params[:forum_topic_id])
  # end

  def set_egear_load
    @forum_thread = ForumThread.find(params[:id])
    @forum_posts = @forum_thread.forum_posts.includes(:user, { likes: :user })
  end

  def set_forum_thread
    @forum_thread = ForumThread.find(params[:id])
    @forum_thread = ForumThread.forum_posts.includes(:likes, :users)
  end

  def create_params
    params.require(:forum_thread).permit(:subject, :forum_topic_id, forum_posts_attributes: [:body])
  end
end
