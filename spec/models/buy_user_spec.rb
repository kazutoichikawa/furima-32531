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

      it "建物がなくても保存できる" do
        @order.building = ''
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
      it '郵便番号にハイフンが含まれていないと登録できない' do
        @order.p_code = 1234567
        @order.valid?
        expect(@order.errors.full_messages).to include("P code is invalid")
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
      it '電話番号に文字列が含まれていると登録できない'do
        @order.p_num = "あああああああああああ"
        @order.valid?
        expect(@order.errors.full_messages).to include("P num is invalid")
      end
      it '電話番号にハイフンが含まれていると登録できない'do
        @order.p_num = '080-1234-5678'
        @order.valid?
        expect(@order.errors.full_messages).to include("P num is too long (maximum is 11 characters)")
      end

      it '電話番号が12桁以上だと登録できない'do
        @order.p_num = '080-1234-567891'
        @order.valid?
        expect(@order.errors.full_messages).to include("P num is too long (maximum is 11 characters)")
      end

      it 'user_idがないと登録できない'do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idがないと登録できない' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end

    end
  end
end
