require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品できる場合' do
      it "item_nameとitem_explain、item_category_idとitem_condition_id、 delivery_charge_idとprefecture_id、delivery_area_id、
      priceが存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context '商品出品できない場合' do
      it "item_nameが空では登録できない" do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it "item_nameが41文字以上では登録できない" do
        @item.item_name = 'テストです' * 41
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name is too long (maximum is 40 characters)")
      end

      it "item_explainが空では登録できない" do
        @item.item_explain = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item explain can't be blank")
      end
      it "item_explainが1001文字以上では登録できない" do
        @item.item_explain = 'テストです' * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include("Item explain is too long (maximum is 1000 characters)")
      end

      it "item_category_idが空では登録できない" do
        @item.item_category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category can't be blank")
      end

      it "item_condition_idが空では登録できない" do
        @item.item_condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition can't be blank")
      end

      it "delivery_charge_idが空では登録できない" do
        @item.delivery_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end

      it "prefecture_idが空では登録できない" do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "delivery_day_idが空では登録できない" do
        @item.delivery_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day can't be blank")
      end

      it "priceが空では登録できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが299以下では登録できない" do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it "priceが10000000以上では登録できない" do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end

      it 'priceが全角では登録できない' do
        @item.price = 'あああああ１'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it 'priceが英字では登録できない' do
        @item.price = 'abcdef'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it 'priceが英字,数字混合では登録できない' do
        @item.price = 'abcde1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
    end
  end
end
