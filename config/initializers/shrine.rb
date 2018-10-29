 require "shrine"
require "shrine/storage/s3"

s3_options = {
  bucket:            Rails.application.credentials.dig(:aws, :bucket_name), # required
  access_key_id:     Rails.application.credentials.dig(:aws, :access_key_id),
  secret_access_key: Rails.application.credentials.dig(:aws, :secret_access_key),
  region:            Rails.application.credentials.dig(:aws, :bucket_region),
}

Shrine.storages = {
  cache: Shrine::Storage::S3.new(prefix: "cache", upload_options: { acl: "public-read" }, **s3_options),
  store: Shrine::Storage::S3.new(prefix: 'store', upload_options: { acl: "public-read" }, **s3_options),
}

Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data
