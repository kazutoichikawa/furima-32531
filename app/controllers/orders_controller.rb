class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index] 
  before_action :set_item, only: [:index, :create]
  def index
    unless current_user.id == @item.user_id
      @order = BuyUser.new
        if  @item.purchase_m.present?
          redirect_to root_path
        end
    else
      redirect_to root_path
    end
  end

  def create
    @order = BuyUser.new(buy_user_params)
    if @order.valid?
      pay_item
      @order.save
      @item = Item.find(params[:item_id])
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
  def set_item
    @item = Item.find(params[:item_id])
  end
end
