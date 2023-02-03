require 'rails_helper'

RSpec.describe 'User', type: :model do
  describe 'ユーザー登録のテスト' do
    let(:user) { create(:user)}

    context "登録が完了出来る場合のテスト" do
      it '登録完了(正常)' do
        expect(user).to be_valid
      end
    end

    context "登録が完了出来ない場合のテスト" do
      it 'nameが未入力でエラー' do
        user.name = ''
        user.valid?
        expect(user.errors.full_messages).to include() 
      end
    
      it 'emailが未入力でエラー' do
        user.email = ''
        user.valid?
        expect(user.errors.full_messages).to include() 
      end

      it 'passwordが未入力でエラー' do
        user.password = ''
        user.valid?
        expect(user.errors.full_messages).to include() 
      end
    end
  end
end
