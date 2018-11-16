class ForumThreads::FollowsController < ApplicationController
  before_action :set_forum_thread

  def create
    @forum_thread.follows.where(user_id: current_user.id).first_or_create

    flash[:success] = 'You will now recive email updates about this thread'
    redirect_to @forum_thread
  end

  def destroy
    @forum_thread.follows.where(user_id: current_user.id).destroy_all

    redirect_to @forum_thread
  end

  private

  def set_forum_thread
    @forum_thread = ForumThread.find(params[:forum_thread_id])
  end
end
