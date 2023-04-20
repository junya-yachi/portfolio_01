require 'rails_helper'
RSpec.describe 'Client', type: :model do
  describe '取引先登録のテスト' do
    let(:client) { create(:client, user_id: user.id) }
    let!(:user) { create(:user) }

    context "登録が完了出来る場合のテスト" do
      it "登録完了(正常)" do
        expect(client).to be_valid
      end
    end

    context "登録が完了出来ない場合のテスト" do
      it "cilent_nameが未入力の場合は登録出来ないこと" do
        client.cilent_name = ''
        client.valid?
        expect(client.errors).to be_of_kind(:cilent_name, :blank)
      end
      it "phone_numが未入力の場合は登録出来ないこと" do
        client.phone_num = ''
        client.valid?
        expect(client.errors).to be_of_kind(:phone_num, :blank)
      end
      it "client_emailが未入力の場合は登録出来ないこと" do
        client.client_email = ''
        client.valid?
        expect(client.errors).to be_of_kind(:client_email, :blank)
      end
      it "@記入のないメールアドレスは登録出来ないこと" do
        client.client_email = Faker::Lorem.characters(number: 16, min_alpha: 16)
        client.valid?
        expect(client.errors).to be_of_kind(:client_email, :invalid)
      end
    end
  end
end
