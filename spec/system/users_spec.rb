require 'rails_helper'
RSpec.describe 'Users', type: :system do
  let(:user) { create(:user) }

  # before do
  #   click('確認')
  #   fill_in
  # end
  describe 'ユーザー登録の場合' do
    context "ユーザーの新規登録が出来る時" do
      it '必要事項を入力し、登録情報確認画面へ移動する' do
        # 新規登録ページへ移動する
        visit new_user_registration_path

        # 必要事項の記入
        fill_in "user[name]",	with: @user.name
        fill_in "user[email]",	with: @user.email
        fill_in "user[password]",	with: @user.password

        # 確認画面へ移動する
        expect().to  
      end
    end
    
  end
end
