require 'rails_helper'

RSpec.describe "Clients", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/clients/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/clients/new"
      expect(response).to have_http_status(:success)
    end
  end

end
