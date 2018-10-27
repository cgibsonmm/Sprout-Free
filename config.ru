# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

run Rails.application

# config.ru (Rack)
map "/presign" do
  run Shrine.presign_endpoint(:cache)
end
