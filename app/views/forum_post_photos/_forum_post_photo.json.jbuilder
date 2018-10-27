json.extract! forum_post_photo, :id, :image_data, :user_id, :created_at, :updated_at
json.url forum_post_photo_url(forum_post_photo, format: :json)
json.image_url forum_post_photo.image_url
