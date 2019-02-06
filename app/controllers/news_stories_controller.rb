class NewsStoriesController < ApplicationController
  before_action :check_admin, except: [:show, :index]
  def index
    @news_stories = NewsStory.select { |story| !story.published_on.nil? }.sort_by(&:published_on)
  end

  def new
    @story = NewsStory.new
  end

  def create
    @story = current_user.news_stories.build(create_params)
    if @story.save
      flash[:alert] = "Previewing - #{@story.heading}"
      redirect_to preview_news_story_path(@story)
    end
  end

  def edit
    @story = NewsStory.find(params[:id])
  end

  def update
    @story = NewsStory.find(params[:id])
    @story.update(update_params)
    flash[:succes] = "Successfully updated #{@story.heading}"
    redirect_to preview_news_story_path(@story)
  end

  def preview
    @story = NewsStory.find(params[:id])
  end

  def publish
    @story = NewsStory.find(params[:id])
    @story.update(publish_params)
    flash[:success] = "Successfully published #{@story.heading}"
    redirect_to news_story_path(@story)
  end

  def show
    @story = NewsStory.find(params[:id])
  end

  private

  def check_admin
    unless current_user.has_role?(:admin)
      redirect_to news_stories_path
    end
  end

  def create_params
    params.require(:news_story).permit(:body, :heading)
  end

  def update_params
    params.require(:news_story).permit(:body, :heading)
  end

  def publish_params
    hash = {
      published: true,
      published_on: DateTime.current
    }
    hash
  end
end
