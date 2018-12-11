module ForumThreadHelper
  include Pagy::Frontend

  def render_time_ago(time)
    puts time
    if !time
      'No Comments'
    elsif time.year < 2000
      'No Comments'
    else
      local_time_ago(time)
    end
  end
end
