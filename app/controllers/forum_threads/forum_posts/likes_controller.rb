class ForumThreads::ForumPosts::LikesController < ApplicationController
  respond_to :html, :js
  before_action :authenticate_user!
  before_action :set_forum_post
  before_action :set_forum_thread

  def create
    @forum_post.likes.where(user_id: current_user.id).first_or_create

    respond_to do |format|
      format.js { render 'forum_posts/likes/create.js.erb' }
      format.html { redirect_to @forum_thread}
    end
  end

  def destroy
    @forum_post.likes.where(user_id: current_user.id).destroy_all

    respond_to do |format|
      format.js { render 'forum_posts/likes/destroy.js.erb' }
      format.html { redirect_to @forum_thread}
    end
  end

  private

  def set_forum_thread
    @forum_thread = ForumThread.find(@forum_post.forum_thread_id)
  end

  def set_forum_post
    @forum_post = ForumPost.find(params[:forum_post_id])
  end
end
