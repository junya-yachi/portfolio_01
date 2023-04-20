require 'rails_helper'
RSpec.describe "Clients", type: :request do
  let(:user) { create(:user) }
  let!(:client) {create(:client, user_id: user.id)}
  let!(:another_user) { create(:user) }
  let!(:another_client) { create(:client, user_id: another_user.id) }

  before do
    sign_in user
  end

  describe "GET /index" do
    context "GET /clientsの場合" do
      it "成功すること" do
        get clients_path
        expect(response).to have_http_status(200)
      end
      it "取引先情報が表示されていること" do
        get clients_path
        expect(response.body).to include(client.cilent_name)
        expect(response.body).to include(client.phone_num)
        expect(response.body).to include(client.client_email)
      end
      it "another_userに紐づいたclientが表示されないこと" do
        get clients_path
        expect(response.body).not_to include(another_client.cilent_name)
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
  
  describe "GET /edit" do
    context "GET clients/edit(:id)の場合" do
      it "成功すること" do
        get edit_client_path(client.id)
        expect(response).to have_http_status(200)
      end
    end
  end
end
