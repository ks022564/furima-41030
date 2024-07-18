require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品の出品ができる場合' do
      it '商品が出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品が出品できない場合' do
      it '商品画像を1枚つけることが必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が必須であること' do
        @item.item_name = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '商品の説明が必須であること' do
        @item.item_text = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("Item text can't be blank")
      end
      it 'カテゴリーの情報が必須であること' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態の情報が必須であること' do
        @item.item_condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition can't be blank")
      end
      it '配送料の負担の情報が必須であること' do
        @item.shipping_fee_responsibility_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee responsibility can't be blank")
      end
      it '発送元の地域の情報が必須であること' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数の情報が必須であること' do
        @item.estimated_shipping_date_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Estimated shipping date can't be blank")
      end
      it '価格の情報が必須であること' do
        @item.price = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end
      it '価格は、¥10,000,000以上は保存できないこと' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it '価格は、¥299以下は保存できないこと' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '価格は、半角英数字のみ保存可能であること' do
        @item.price = 'a123'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
