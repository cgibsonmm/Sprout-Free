class ConfirmRemindersController < ApplicationController
  before_action :authenticate_user!
  before_action :confirm_admin!

  def create
    # @unconfirmed_users = User.select { |user| user.confirmed_at.nil? }
    @unconfirmed_users = User.find(1)
    ReconfirmMailer.confrim_reminder_mailer(@unconfirmed_users).deliver_now
    # @unconfirmed_users.each do |user|
    #   ReconfirmMailer.confrim_reminder_mailer(user).deliver_now
    # end


    flash[:success] = "sent email to #{@unconfirmed_users.count} unconfirm users"
    redirect_to '/forums'
  end


  private

  def confirm_admin!
    unless current_user.has_role?(:admin)
      redirect_to root_path
    end
  end
end
