require 'rails_helper'
RSpec.describe "Clients", type: :system do
  describe '取引先登録のテスト' do
    let(:user) { create(:user) }
    let(:client) { create(:client, user_id: user.id) }
    before do
      # ユーザーのログインする
      login(user)
      # 取引先新規登録ページに移動する
      visit new_client_path
    end

    context "取引先の新規登録が出来る場合" do
      before do
        fillin(client)
      end
      it "入力画面が表示されること" do
        expect(page).to have_css '.client_container'
      end
      it "必要事項を入力し、登録確認画面へ移動すること" do
        click_button '確認画面へ'
        expect(page).to have_css '.submit_btn'
      end
      it "必要事項を入力し、登録確認画面へ移動し、新規登録画面が完了すること" do
        click_button '確認画面へ'
        click_button '登録する'
        expect(page).to have_selector 'h2', text: '登録が完了しました。'
      end
      it "必要事項を入力し、登録確認画面へ移動し、修正のため入力画面に戻ってくること" do
        click_button '確認画面へ'
        click_button '修正する'
        expect(page).to have_css '.client_container'
      end
    end

    context "取引先の新規登録が出来ない場合" do
      context "必要事項を誤入力し登録確認画面に移動せずに戻ってくる場合" do
        before do
          fillin(client)
        end
        it "cilent_nameが空欄で登録に失敗すること" do
          fill_in 'client[cilent_name]', with: ''
          click_button '確認画面へ'
          expect(page). have_selector 'li', text: '企業名を入力してください'
        end
      end
    end
  end
end
