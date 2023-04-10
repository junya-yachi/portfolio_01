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
        expect(page).to have_selector 'h2', text: '新規取引先企業を登録しました'
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
          expect(page).to have_selector 'li', text: '企業名を入力してください'
        end
        it "phone_numが空欄で登録に失敗すること" do
          fill_in 'client[phone_num]', with: ''
          click_button '確認画面へ'
          expect(page).to have_selector 'li', text: '電話番号を入力してください'
        end
        it "phone_numが数字以外の入力で登録に失敗すること" do
          fill_in 'client[phone_num]', with: Faker::Alphanumeric.alpha(number: 10)
          click_button '確認画面へ'
          expect(page).to have_selector 'li', text: '電話番号は数値で入力してください'
        end
        it "client_emailが空欄で登録に失敗すること" do
          fill_in 'client[client_email]', with: ''
          click_button '確認画面へ'
          expect(page).to have_selector 'li', text: 'メールアドレスを入力してください'
        end
        it "client_emailが「@」が未入力で登録に失敗すること" do
          fill_in 'client[client_email]', with: ''
          click_button '確認画面へ'
          expect(page).to have_selector 'li', text: 'メールアドレスを入力してください'
        end
      end
    end
  end
  describe '取引先情報更新のテスト' do
    let(:user) { create(:user) }
    let(:client) { create(:client, user_id: user.id) }
    before do
      # ユーザーのログインする
      login(user)
      # 取引先新規登録ページに移動する
      visit edit_client_path(client)
    end

    context "取引先の更新が出来る場合" do
      it "入力画面が表示されること" do
        expect(page).to have_css '.client_container'
      end
      it "入力フォームにcilent_nameが入力されていること" do
        expect(page).to have_field '企業名', with: client.cilent_name
      end
      it "入力フォームにcilent_nameが入力されていること" do
        expect(page).to have_field '電話番号', with: client.phone_num
      end
      it "入力フォームにcilent_nameが入力されていること" do
        expect(page).to have_field 'メールアドレス', with: client.client_email
      end
      # it "記入事項を修正し、修正が完了すること" do
      #   fill_in 'client[cilent_name]', with: "株式会社テスト"
      #   fill_in 'client[phone_num]', with: "111111111"
      #   fill_in 'client[client_email]', with: "test@email.com"
      #   click_button '修正する'
      #   expect(page).to have_css 'h2', text: '取引先企業'
      # end
    end
  end
end
