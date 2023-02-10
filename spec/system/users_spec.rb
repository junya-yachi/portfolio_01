require 'rails_helper'
RSpec.describe 'Users', type: :system do

  describe 'ユーザー登録のテスト' do

    before do
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # 必要事項の記入
      fill_in 'user[name]', with: 'テスト'
      fill_in 'user[email]', with: 'test@sample.com'
      fill_in 'user[password]', with: 'password'
      fill_in 'user[password_confirmation]', with: 'password'
    end
    context "ユーザーの新規登録が出来る場合" do
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
        expect(page).to have_selector 'h2', text: '登録が完了しました。'
      end
      it '必要事項を入力し、登録確認画面へ移動し、修正のため入力画面に戻ってくること' do
        # 入力確認ボタンを押す
        click_button '入力確認'
        click_button '修正する'
        expect(page).to have_css '.user_container'
      end
    end
    context 'ユーザーの新規登録が出来ない場合' do
      context '必要事項を誤入力し登録確認画面に移動せずに戻ってくる場合' do
        it 'nameが空欄で登録に失敗すること' do
          fill_in 'user[name]', with: ''
          click_button '入力確認'
          expect(page).to have_selector 'li', text: '店舗名を入力してください'
        end
        it 'emailが空欄で登録に失敗すること' do
          fill_in 'user[email]', with: ''
          click_button '入力確認'
          expect(page).to have_selector 'li', text: 'メールアドレスを入力してください'
        end
        it 'passwordが空欄で登録に失敗すること' do
          fill_in 'user[password]', with: ''
          click_button '入力確認'
          expect(page).to have_selector 'li', text: 'パスワードを入力してください'
        end
        it 'passwordとpassword_confirmationが不一致で登録に失敗すること' do
          fill_in 'user[password_confirmation]', with: ''
          click_button '入力確認'
          expect(page).to have_selector 'li', text: 'パスワード（確認用）とパスワードの入力が一致しません'
        end
      end
    end
  end
end
