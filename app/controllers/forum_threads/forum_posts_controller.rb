class ForumThreads::ForumPostsController < ApplicationController
  load_and_authorize_resource
  before_action :set_forum_thread, only: [:create]
  before_action :set_forum_post, only: [:edit, :update]
  # before_action :set_forum_post, only: [:destroy]

  def create
    @forum_post = @forum_thread.forum_posts.new(forum_post_params)
    @forum_post.user = current_user

    if @forum_post.save
      flash[:success] = "Post Saved"
      redirect_to forum_thread_path(@forum_thread)
    else
      flash[:error] = @forum_post.errors.full_messages
      redirect_to @forum_thread
    end
  end

  def edit
  end

  def update
    if @forum_post.update(update_params)
      flash[:success] = 'Updated Post'
      redirect_to forum_thread_path(@forum_post.forum_thread_id)
    else
      flash[:alert] = @forum_post.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    @forum_post = ForumPost.find(params[:id])
    @forum_thread = @forum_post.forum_thread
    unless @forum_thread.forum_posts.first == @forum_post
      if @forum_post.destroy
        flash[:warning] = 'Post Deleted'
        redirect_to @forum_thread
      end
    end
  end


  private

  def set_forum_post
    @forum_post = ForumPost.find(params[:id])
  end

  def set_forum_thread
    @forum_thread = ForumThread.find(params[:forum_thread_id])
  end

  def update_params
    params.require(:forum_post).permit(:body)
  end

  def forum_post_params
    params.require(:forum_post).permit(:body)
  end
end
