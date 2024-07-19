class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      @item = Item.new
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :price, :category_id, :shipping_fee_responsibility_id, :prefecture_id,
                                 :estimated_shipping_date_id, :item_text, :item_condition_id).merge(user_id: current_user.id)
  end
end
