class NewsStoriesController < ApplicationController
  def index
    @news_stories = NewsStory.all
    #@news_stories = NewsStory.select { |story| !story.published_on.nil? }.sort_by(&:published_on)
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

  def create_params
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
