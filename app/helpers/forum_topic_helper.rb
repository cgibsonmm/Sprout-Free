module ForumTopicHelper
  def form_errors?(subject, thread)
    if subject.errors.any?
      form_error_helper(subject.errors)
    end
    if thread.errors.any?
      form_error_helper(thread.errors)
    end
  end

  def form_error_helper(error)
    haml_tag 'div.error_explanation' do
      haml_tag 'ul' do
        error.errors.full_messages.each do |message|
          haml_concat message
        end
      end
    end
  end
end
