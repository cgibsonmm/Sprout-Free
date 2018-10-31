module ApplicationHelper
  def forums_controller?
    controllers = %w[forum_threads forum_subjects forum_posts]
    controllers.include?(controller_name)
  end

  def admin?
    current_user.admin == true
  end
end
