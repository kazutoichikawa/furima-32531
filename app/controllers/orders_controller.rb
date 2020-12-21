class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirevt_to root_path
    else
      render 'index'
    end
  end

  private
  def order_params
    params.require(:order).permit(:price)
  end

  def pay_item
    Payjp.api_key = "sk_test_096bd2d072851977f71c04f4"
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
