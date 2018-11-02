require 'rails_helper'

RSpec.describe TicklersController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  # describe "GET #create" do
  #   it "returns http success" do
  #     post :create, attributes_for(:tickler)
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
