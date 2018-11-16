module HomeHelper

  def total_users
    User.all.count
  end
end
