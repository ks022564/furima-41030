class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :destroy]
  before_action :redirect_if_sold_out, only: [:show, :edit]
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :price, :category_id, :shipping_fee_responsibility_id, :prefecture_id,
                                 :estimated_shipping_date_id, :item_text, :item_condition_id).merge(user_id: current_user.id)
  end

  def correct_user
    unless @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def redirect_if_sold_out
    if @item.sold_out? 
      redirect_to root_path
    end
  end
end
