module FlashHelper
  def parse_flash(type)
    if %w[notice success].include?(type)
      'alert-success'
    elsif %w[warning error].include?(type)
      'alert-danger'
    else
      'alert-warning'
    end
  end
end
