class ForumSubjectsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_forum_subject, only: [:show]

  def index
    @forum_subjects = ForumSubject.all
    @forum_threads = ForumThread.all.includes(:user)
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

  private

  def set_forum_subject
    @forum_subject = ForumSubject.find(params[:id])
  end

  def forum_subject_params
    params.require(:forum_subject).permit(:subject_name)
  end
end
