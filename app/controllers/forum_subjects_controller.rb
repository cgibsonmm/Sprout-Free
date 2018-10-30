class ForumSubjectsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_forum_subject, only: [:show, :destroy]

  def index
    @forum_subjects = ForumSubject.order(:position)
    @forum_threads = ForumThread.order('Created_at DESC').includes(:user)
  end

  def new
    @forum_subject = ForumSubject.new
  end

  def create
    @forum_subject = ForumSubject.new(forum_subject_params)
    if @forum_subject.save
      flash[:success] = "Created new forum subject"
      redirect_to forum_subjects_url
    else
      flash[:error] = 'can not save'
      render 'new'
    end
  end

  def show
  end

  def sort
    params[:forum_subject].each_with_index do |id, index|
      ForumSubject.where(id: id).update_all(position: index + 1)
    end

    head :ok
  end

  def destroy
    if @forum_subject.destroy
      flash[:notice] = "Subject Deleted"
      redirect_to forum_subjects_path
    end
  end

  private

  def set_forum_subject
    @forum_subject = ForumSubject.find(params[:id])
  end

  def forum_subject_params
    params.require(:forum_subject).permit(:subject_name)
  end
end
