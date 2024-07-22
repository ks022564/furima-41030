class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :redirect_if_not_allowed_to_purchase, only: :index

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_form = OrderForm.new
    
  end

  def create
    @order_form = OrderForm.new(order_params)
    
    if @order_form.valid?
      pay_item
      @order_form.save
      redirect_to root_path
    else
      @items = Item.all
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_form).permit( :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], order_id: params[:order_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy' 
      )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def redirect_if_not_allowed_to_purchase
    if @item.order.present? ||current_user.id == @item.user_id
      redirect_to root_path
    end
  end
end