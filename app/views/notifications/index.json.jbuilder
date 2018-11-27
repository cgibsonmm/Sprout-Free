json.array! @notifications do |notification|
  json.cache! ['v1', notification], expires_in: 10.minutes do
    json.extract! notification, :notifiable, :recipient_id
  end

  json.id notification.id
  json.unread !notification.read_at?
  json.template render partial: "notifications/#{notification.notifiable_type.underscore.pluralize}/#{notification.action}", locals: { notification: notification }, formats: [:html]
end
