require 'rails_helper'
RSpec.describe "Homes", type: :system do
  describe 'ホーム画面のテスト' do
    let(:user) { create(:user) }

    context "ユーザー未登録の場合" do
      before do
        visit homes_top_path
      end
      it "画面に新規登録が表示されていること" do
        expect(page).to have_css '.top_right'
      end
      it "新規登録画面へ移動すること" do
        click_link '新規登録'
        expect(page).to have_css '.user_form'
      end
    end

    context "ユーザー登録済みの場合" do
      before do
        login(user)
        visit homes_top_path
      end

      it "画面にログインユーザーの名前が表示されていること" do
        expect(page).to have_selector 'div', text: "#{user.name}"
      end
      it "在庫管理で商品一覧ページへ移動すること" do
        click_link '在庫管理'
        expect(page).to have_selector 'h1', text: "商品一覧"
      end
      it "取引先一覧で取引先一覧ページへ移動すること" do
        click_link '取引先一覧'
        expect(page).to have_selector 'h1', text: "取引先一覧"
      end
      it "ログアウトに成功してホーム画面に移動すること" do
        click_link 'ログアウト'
        expect(page).to have_selector 'div', text: "ログイン"
      end
    end
  end
end