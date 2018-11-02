class TicklersController < ApplicationController
  def new
    @tickler = Tickler.new
  end

  def create
    @tickler = Tickler.new(tickle_params)
    if @tickler.save
      flash[:success] = 'You are signed up for email updates!'
      @tickler.send_notifications
      redirect_to '/'
    end
  end

  private

  def tickle_params
    params.require(:tickler).permit(:email)
  end
end
