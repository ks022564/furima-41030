class OrdersController < ApplicationController
  def index
    @order_form = OrderForm.new
    @items = Item.all
  end

  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      @order_form.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
    
    
      
  end

  private

  def order_params
    params.require(:order_form).permit( :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], order_id: params[:order_id])
  end

end