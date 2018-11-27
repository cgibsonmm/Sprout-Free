module ForumThreadHelper
  include Pagy::Frontend

  def render_time_ago(time)
    if time
      local_time_ago(time)
    else
      'NA'
    end
  end
end
