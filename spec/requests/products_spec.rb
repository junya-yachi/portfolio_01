require 'rails_helper'

RSpec.describe "Products", type: :request do
  describe "GET /product::index" do
    it "returns http success" do
      get "/products/product::index"
      expect(response).to have_http_status(:success)
    end
  end

end
