module ForumPostHelper
  
  def user_city(user)
    unless user.city.nil?
      user.city.capitalize
    end
  end

  def user_province(user)
    unless user.province.nil?
      user.province
    end
  end
end
