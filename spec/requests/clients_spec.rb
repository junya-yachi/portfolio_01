require 'rails_helper'
RSpec.describe "Clients", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get clients_path
      expect(response).to have_http_status(200)
    end
  end
  describe "GET /new" do
    it "returns http success" do
      get new_client_path
      expect(response).to have_http_status(200)
    end
  end

end
