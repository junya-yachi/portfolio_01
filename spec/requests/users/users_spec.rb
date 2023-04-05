require 'rails_helper'
RSpec.describe 'Users', type: :request do
  describe "GET /homes" do
    context "GET /homes/topの場合" do
      it '成功すること' do
        get homes_top_path
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "GET /users" do
    let!(:user) { create(:user) }

    context "GET/users/sign_upの場合" do
      it "成功すること" do
        get new_user_registration_path
        expect(response).to have_http_status(200)
      end
    end
    # context "Get /users/sign_up/confirmの場合" do
    #   it "成功すること" do
    #     fill_in 'user[name]', with: "#{user.name}"
    #     fill_in 'user[email]', with: "#{user.email}"
    #     fill_in 'user[password]', with: "#{user.password}"
    #     fill_in 'user[password_confirmation]', with: "#{user.password}"
    #     get users_sign_up_confirm_path
    #     expect(response).to have_http_status(200)
    #   end
    # end
  end
end
