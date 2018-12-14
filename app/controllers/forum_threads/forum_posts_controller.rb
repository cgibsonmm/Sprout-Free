class ForumThreads::ForumPostsController < ApplicationController
  load_and_authorize_resource
  before_action :set_forum_thread, only: [:create]
  before_action :set_forum_post, only: [:edit, :update]
  # before_action :set_forum_post, only: [:destroy]

  def create
    @forum_post = @forum_thread.forum_posts.new(forum_post_params)
    @forum_post.user = current_user

    if @forum_post.save
      # Update last comment time
      @forum_thread.update(last_forum_post_time: Time.now)
      flash[:success] = "Post Saved"
      redirect_to forum_thread_path(@forum_thread)

      # Send post notifications
      (@forum_thread.users.uniq - [current_user]).each do |user|
        Notification.create(recipient: user, actor: current_user, action: 'posted', notifiable: @forum_post)
      end

      @forum_post.mentioned_users.each do |user|
        Notification.create(recipient: user, actor: current_user, action: 'mentioned', notifiable: @forum_post)
      end

      @forum_thread.follows.each do |follow|
        NotificationsMailer.notify_mailer(follow.user, current_user, 'posted', @forum_post).deliver_now
      end

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
    @forum_post.destroy
    flash[:alert] = 'Post deleted'
    redirect_to @forum_thread
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
