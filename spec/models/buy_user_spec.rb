require 'rails_helper'

RSpec.describe BuyUser, type: :model do
  before do
    @order = FactoryBot.build(:buy_user)
  end

  describe '購入' do
    context '購入がうまくいくとき' do
      it "トークン、郵便番号、都道府県、市町村、番地、建物、電話番号があれば保存できる" do
        expect(@order).to be_valid
      end
    end

    context '購入が失敗するとき' do
      it 'トークンが生成されていなければ登録できない' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号が空では登録できない' do
        @order.p_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("P code can't be blank")
      end

      it '都道府県が空では登録できない' do
        @order.prefecture_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市町村が空では登録できない' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空では登録できない' do
        @order.address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が空だと登録できない'do
        @order.p_num = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("P num can't be blank")
      end

    end
  end
end
