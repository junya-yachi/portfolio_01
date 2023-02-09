require 'rails_helper'
RSpec.describe 'Users', type: :system do
  let(:user) { create(:user) }

  describe 'ユーザー登録の場合' do

    before do
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # 必要事項の記入
      fill_in 'user[name]', with: 'テスト'
      fill_in 'user[email]', with: 'test@sample.com'
      fill_in 'user[password]', with: 'password'
      fill_in 'user[password_confirmation]', with: 'password'
    end
    context "ユーザーの新規登録が出来る場合のテスト" do
      it '入力画面が表示されること' do
        expect(page).to have_css '.user_container'
      end
      it '必要事項を入力し、登録情報確認画面へ移動すること' do
        # 入力確認ボタンを押す
        click_button '入力確認'
        # 確認画面へ移動する
        expect(page).to have_css '.sign_up_confirm'
      end
      it '必要事項を入力し、登録確認画面へ移動し、新規登録が完了すること' do
        # 入力確認ボタンを押す
        click_button '入力確認'
        # 新規アカウント作成ボタンを押す
        click_button '新規アカウント作成'
      end
      it '必要事項を入力し、登録確認画面へ移動し、修正のため入力画面に戻ってくること' do
        # 入力確認ボタンを押す
        click_button '入力確認'
        click_button '修正する'
        expect(page).to have_css '.user_container'
      end
    end
    context 'ユーザーの新規登録が出来ない場合のテスト' do
      context '必要事項を誤入力し登録確認画面に移動せずに戻ってくる場合のテスト' do
        it 'nameが空欄で失敗すること' do
          fill_in 'user[name]', with: ''
          click_button '入力確認'
          
          # binding.pry
          
          expect(user.errors.full_messages).to include("Name can't be blank")
          # expect(page).to assert_selector "h2", text: "I18n.t("errors.messages.not_saved")"
        end
      end
    end
  end
end
