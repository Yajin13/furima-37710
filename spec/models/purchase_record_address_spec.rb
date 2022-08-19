require 'rails_helper'

RSpec.describe PurchaseRecordAddress, type: :model do
  describe '商品購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_record_address = FactoryBot.build(:purchase_record_address, item_id: item.id, user_id: user.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_record_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @purchase_record_address.building_name = ''
        expect(@purchase_record_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it "tokenが空では登録できないこと" do
        @purchase_record_address.token = nil
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'post_codeが空だと保存できないこと' do
        @purchase_record_address.post_code = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_record_address.post_code = '1234567'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end

      it 'prefectureを選択していないと保存できないこと' do
        @purchase_record_address.prefecture_id = 0
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空だと保存できないこと' do
        @purchase_record_address.city = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空だと保存できないこと' do
        @purchase_record_address.house_number = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("House number can't be blank")
      end
      
      it 'phone_numberが空だと保存できないこと' do
        @purchase_record_address.phone_number = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが9文字以下では登録できない' do
        @purchase_record_address.phone_number = '123456789'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Phone number is out of setting range")
      end
      it 'phone_numberが12文字以上では登録できない' do
        @purchase_record_address.phone_number = '123456789123'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Phone number is out of setting range")
      end

      it 'phone_numberが全角文字では登録できない' do
        @purchase_record_address.phone_number = 'あああああ１'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Phone number is out of setting range")
      end
      it 'phone_numberが英字のみでは登録できない' do
        @purchase_record_address.phone_number = 'abcdef'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Phone number is out of setting range")
      end
      it "phone_numberが半角文字では登録できない" do
        @purchase_record_address.phone_number = 'ﾀﾛｳ'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Phone number is out of setting range")
      end


      it 'itemが紐付いていないと保存できないこと' do
        @purchase_record_address.item_id = nil
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'userが紐付いていないと保存できないこと' do
        @purchase_record_address.user_id = nil
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
