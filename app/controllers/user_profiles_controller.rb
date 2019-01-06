class UserProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, except: [:show]
  before_action :profile_owner?, except: [:show]


  def show
    @profile = User.find(params[:id])
  end

  def edit
    @user_profile = User.find(params[:id])
  end

  def accept_terms
    @current_user.terms_of_service = true
    if @current_user.update(update_terms_params)
      flash[:success] = 'Thank you!'
      redirect_to forums_path
    end
  end

  def update
    if @user_profile.update(update_params)
      flash[:success] = 'Profile Updated'
      redirect_to user_profile_path(current_user)
    else
      flash[:error] = 'Error updating profile'
      render 'edit'
    end
  end

  private

  def update_params
    params.require(:user).permit(:about_me, :avatar, :province, :city, :terms_of_service)
  end

  def update_terms_params
    params.permit(:terms_of_service)
  end

  def set_profile
    @user_profile = @user_profile = User.find(params[:id])
  end

  def profile_owner?

    unless @user_profile.id == current_user.id
      redirect_to root_path
    end
  end
end
