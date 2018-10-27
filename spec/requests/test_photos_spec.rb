require 'rails_helper'

RSpec.describe "TestPhotos", type: :request do
  describe "GET /test_photos" do
    it "works! (now write some real specs)" do
      get test_photos_path
      expect(response).to have_http_status(200)
    end
  end
end
