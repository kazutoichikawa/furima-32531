class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order = BuyUser.new
  end

  def create
    @order = BuyUser.new(buy_user_params)
    
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private
  def buy_user_params
    params.require(:buy_user).permit(:p_code, :prefecture_id, :city, :address, :building, :p_num).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = "sk_test_096bd2d072851977f71c04f4"
    Payjp::Charge.create(
      amount: @item.price,
      card: buy_user_params[:token],
      currency: 'jpy'
    )
  end
end
