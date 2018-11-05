module ApplicationHelper
  def forum_area?
    controllers = %w[forums forum_categories forum_threads forum_topics forum_posts]
    controllers.include?(controller_name)
  end

  def admin?
    current_user.admin == true
  end

  def user_admin?
    user_signed_in? && current_user.has_role?(:admin)
  end
end
