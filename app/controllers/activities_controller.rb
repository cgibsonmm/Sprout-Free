class ActivitiesController < ApplicationController
  def index
    @activities = PublicActivity::Activity.includes(:owner, :trackable).all
  end
end
