require "rails_helper"

RSpec.describe TestPhotosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/test_photos").to route_to("test_photos#index")
    end

    it "routes to #new" do
      expect(:get => "/test_photos/new").to route_to("test_photos#new")
    end

    it "routes to #show" do
      expect(:get => "/test_photos/1").to route_to("test_photos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/test_photos/1/edit").to route_to("test_photos#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/test_photos").to route_to("test_photos#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/test_photos/1").to route_to("test_photos#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/test_photos/1").to route_to("test_photos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/test_photos/1").to route_to("test_photos#destroy", :id => "1")
    end
  end
end
