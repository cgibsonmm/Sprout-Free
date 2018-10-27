require "shrine/storage/s3"

s3_options = {
  bucket:            Rails.application.credentials.aws[:bucket_name], # required
  access_key_id:     Rails.application.credentials.aws[:access_key_id],
  secret_access_key: Rails.application.credentials.aws[:secret_access_key],
  region:            Rails.application.credentials.aws[:bucket_region],
}

Shrine.storages = {
  cache: Shrine::Storage::S3.new(prefix: "cache",upload_options: { acl: "public-read" } , **s3_options),
  store: Shrine::Storage::S3.new(prefix: "store",upload_options: { acl: "public-read" } ,**s3_options),
}

# Shrine.plugin :activerecord
Shrine.plugin :presign_endpoint, presign_options: -> (request) {
  filename = request.params["filename"]
  type     = request.params["type"]

  {
    content_disposition:    "inline; filename=\"#{filename}\"", # set download filename
    content_type:           type,                               # set content type (required if using DigitalOcean Spaces)
    content_length_range:   0..(10*1024*1024),                  # limit upload size to 10 MB
  }
}
Shrine.plugin :restore_cached_data
