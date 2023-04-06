require 'rails_helper'
RSpec.describe "Clients", type: :system do
  describe '取引先登録のテスト' do
    let(:user) { create(:user) }
    before do
      # ユーザーのログインする
      login(user)
      # 取引先新規登録ページに移動する
      visit new_client_path
    end

    context "取引先の新規登録が出来る場合" do
      before do
        fill_in 'user[name]', with: 'テスト'
        fill_in 'user[email]', with: 'test@sample.com'
      end
      it "入力画面が表示されること" do
        expect(page).to have_css '.client_container'
      end
      it "必要事項を入力し、登録確認画面へ移動し、新規登録が完了すること" do

      end
    end
  end
end
