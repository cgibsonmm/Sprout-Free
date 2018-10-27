json.extract! test_photo, :id, :image_data, :created_at, :updated_at
json.url test_photo_url(test_photo, format: :json)
