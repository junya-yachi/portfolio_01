require 'rails_helper'

RSpec.describe 'User', type: :model do
  describe 'ユーザー登録のテスト' do
    let(:user) { create(:user)}
    let(:user2) { create(:user)}

    context "登録が完了出来る場合のテスト" do
      it '登録完了(正常)' do
        expect(user).to be_valid
      end
    end

    context "登録が完了出来ない場合のテスト" do
      it 'nameが未入力でエラー' do
        user.name = ''
        user.valid?
        # expect(user.errors.full_messages).to be_added(:name, :blank)
        expect(user.errors).to be_of_kind(:name, :blank)
      end
      it 'emailが未入力でエラー' do
        user.email = ''
        user.valid?
        expect(user.errors).to be_of_kind(:email, :blank)
      end
      it 'passwordが未入力でエラー' do
        user.password = ''
        user.valid?
        expect(user.errors).to be_of_kind(:password, :blank)
      end
      it '256文字以上(上限オーバー)のメールアドレスでエラー' do
        # user.email = 'a' * 246 + '@sample.jp'
        user.email = Faker::Lorem.characters(246) + '@sample.jp'
        user.valid?
        expect(user.errors).to be_added(:email, :too_long, count: 255)
      end
      # it '重複したメールアドレスが存在する場合は登録出来ない' do
      #   user.save
      #   user2.email = user.email
      #   expect(subject.error).to to be_of_kind(:email, :already_confirmed)
      # end
    end
  end
end
