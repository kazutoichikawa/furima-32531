require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  it "priceとtokenがあれば保存できる" do
    expect(@order).to be_valid
  end

  it "priceが空では保存ができない" do
    @order.price = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Price can't be blank")
  end

  it "tokenが空では登録できない" do
    @order.token = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Token can't be blank")
  end

end
