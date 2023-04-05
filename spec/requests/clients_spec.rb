require 'rails_helper'
RSpec.describe "Clients", type: :request do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe "GET /index" do
    context "GET /clientsの場合" do
      it "成功すること" do
        get clients_path
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "GET /new" do
    context "GET /clients/newの場合" do
      it "成功すること" do
        get new_client_path
        expect(response).to have_http_status(200)
      end
    end
  end
end
