require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_form = FactoryBot.build(:order_form, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '購入情報の保存' do
    context '内容に問題がない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_form).to be_valid
      end
      it '建物名は空でも保存できること' do
        @order_form.building_name = nil
        expect(@order_form).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it '郵便番号が必須であること。' do
        @order_form.postal_code = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code can't be blank")        
      end
      it '郵便番号は、「3桁ハイフン4桁」のみ保存可能なこと' do
        @order_form.postal_code = '1234567'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code is invalid. Input correctly.")
      end
      it '郵便番号は、半角文字列のみ保存可能なこと' do
        @order_form.postal_code = '１２３４５６７'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code is invalid. Input correctly.")
      end
      it '都道府県が必須であること。' do
        @order_form.prefecture_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が必須であること。' do
        @order_form.city = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end
      it '番地が必須であること。' do
        @order_form.address = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が必須であること。' do
        @order_form.phone_number = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと' do
        @order_form.phone_number = '0901234567890'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number phone number must be 10 to 11 digits long")
      end
    end
  end
end
