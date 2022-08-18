require 'rails_helper'

RSpec.describe PurchaseRecordAddress, type: :model do
  describe '寄付情報の保存' do
    before do
      user = FactoryBot.create(:user)
      @donation_address = FactoryBot.build(:donation_address, user_id: user.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_record_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @donation_address.building_name = ''
        expect(@donation_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @purchase_record_address.postal_code = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_record_address.postal_code = '1234567'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'prefectureを選択していないと保存できないこと' do
        @purchase_record__address.prefecture = 0
        @purchase_record__address.valid?
        expect(@purchase_record__address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @purchase_record_address.phone_number = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @purchase_record_address.item_id = nil
        @purchase_record__address.valid?
        expect(@purchase_record__address.errors.full_messages).to include("Item can't be blank")
      end
      it 'userが紐付いていないと保存できないこと' do
        @purchase_record__address.user_id = nil
        @purchase_record__address.valid?
        expect(@purchase_record__address.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
