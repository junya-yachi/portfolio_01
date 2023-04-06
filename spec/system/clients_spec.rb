require 'rails_helper'
RSpec.describe "Clients", type: :system do
  describe '取引先登録のテスト' do
    let ()
    before do
      # ユーザーログインする
      visit 
      # 新規登録ページに移動する
      visit new_client_path
    end
  end
end
