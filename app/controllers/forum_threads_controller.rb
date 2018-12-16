class ForumThreadsController < ApplicationController
  load_and_authorize_resource
  helper_method :sort_column, :sort_direction
  add_breadcrumb 'Forums', :forums_path
  add_breadcrumb 'Categories', :forum_categories_path
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_forum_thread, except: [:index, :new, :create, :destroy]
  # before_action :set_forum_topic



  def index
    # @local = locals
    if params[:sort]
      @pagy, @forum_threads = pagy(ForumThread.order(params[:sort] + " desc" ).includes(:user), items: 20)
    else
      @pagy, @forum_threads = pagy(ForumThread.order("#{sort_column} #{sort_direction}").includes(:user), items: 20)
    end
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
    @forum_thread.forum_posts.first.user_id = current_user.id
    @forum_thread.last_forum_post_time = Time.now - 10000000000

    if @forum_thread.save
      redirect_to @forum_thread
      flash[:success] = "Successfully created a new thread"
    else
      render 'new'
      flash[:danger] = 'Error Creating a new thread, make sure title and body are present'
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @forum_thread = ForumThread.find(params[:id])
    if @forum_thread.destroy
      flash[:success] = 'Thread has been deleted'
      redirect_to forum_topic_path(@forum_thread.forum_topic)
    else
      flash[:error] = @forum_thread.errors.full_messages
      render 'edit'
    end
  end

  private

  def sortable_columns
    ["created_at", "last_forum_post_time"]
  end

  def sort_column
    sortable_columns.include?(params[:column]) ? params[:column] : "created_at"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end

  def set_forum_thread
    @forum_thread = ForumThread.includes(forum_posts: [:user, likes: [:user]]).find(params[:id])
  end

  def create_params
    params.require(:forum_thread).permit(:subject, :forum_topic_id, :last_forum_post_time, forum_posts_attributes: [:body])
  end
end
