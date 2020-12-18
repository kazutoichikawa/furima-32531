require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  
  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it '商品画像、商品名、商品の説明、カテゴリ、商品の状態、配送料の負担、発送元の地域、発送までの日数、販売金額（上限9999999 ~ 下限300)全てが入力されていると出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it '商品画像の添付がないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end

      it '商品名が40文字を超えると出品できない' do
        
        @item.title = "a" * 41
        @item.valid?
        expect(@item.errors.full_messages).to include "Title is too long (maximum is 40 characters)"
      end

      it '商品名が空だと出品できない' do
        @item.title = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Title can't be blank"
      end

      it '商品の説明が1000文字を超えると出品できない' do
        @item.explain = "a" * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include "Explain is too long (maximum is 1000 characters)"
      end

      it '商品の説明が空と出品できない' do
        @item.explain = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Explain can't be blank"
      end

      it 'カテゴリーの--を選択すると出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category must be other than 1"
      end

      it '商品の状態の--を選択すると出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition must be other than 1"
      end

      it '配送料の負担の--を選択すると出品できない' do
        @item.s_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "S fee must be other than 1"
      end

      it '発送元の地域の--を選択すると出品できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Area must be other than 1"
      end

      it '発送までの日数の--を選択すると出品できない' do
        @item.d_f_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "D f ship must be other than 1"
      end

      it '販売価格が空だと出品できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end

      it '販売価格がだと半角英語だと出品できない' do
        @item.price = "aaa"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end

      it '販売価格がだと全角英語だと出品できない' do
        @item.price = "ＡＡＡ"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end

      it '販売価格がだと漢字だと出品できない' do
        @item.price = "漢字漢字"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end

      it '販売価格がだとひらがなだと出品できない' do
        @item.price = "ああああ"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end

      it '販売価格がだと全角カタカナだと出品できない' do
        @item.price = "カタカナ"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      
      it '販売価格がだと半角カタカナだと出品できない' do
        @item.price = "ｱｱｱｱ"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end

      it '販売価格が300円未満だと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end

      it '販売価格が9999999円を超えると出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end
    end
  end
end