class ForumThreads::ForumPostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_forum_thread, only: [:create]
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

  # def set_forum_post
  # end

  def set_forum_thread
    @forum_thread = ForumThread.find(params[:forum_thread_id])
  end

  def forum_post_params
    params.require(:forum_post).permit(:body)
  end
end
