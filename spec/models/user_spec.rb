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
      it 'nameが未入力の場合は登録出来ないこと' do
        user.name = ''
        user.valid?
        expect(user.errors).to be_of_kind(:name, :blank)
      end
      it 'emailが未入力の場合は登録出来ないこと' do
        user.email = ''
        user.valid?
        expect(user.errors).to be_of_kind(:email, :blank)
      end
      it 'passwordが未入力の場合は登録出来ないこと' do
        user.password = ''
        user.valid?
        expect(user.errors).to be_of_kind(:password, :blank)
      end
      it '重複したメールアドレスが存在する場合は登録出来ないこと' do
        user.save
        user2.email = user.email
        user2.valid?
        expect(user2.errors).to be_of_kind(:email, :taken)
      end
      it '@記入のないメールアドレスは登録出来ないこと' do
        user.email = Faker::Lorem.characters(number: 16, min_alpha: 16)
        user.valid?
        expect(user.errors).to be_of_kind(:email, :invalid)
      end
      it 'パスワードが６文字未満の場合は登録出来ないこと' do
        user.password = Faker::Lorem.characters(number: 5, min_alpha: 1, min_numeric: 1)
        user.valid?
        expect(user.errors).to be_of_kind(:password, :too_short)
      end
      it ''
    end
  end
end
