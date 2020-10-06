class ItemsController < ApplicationController

  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:edit, :update]
  before_action :find_item, only: [:show, :destroy]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :edit
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def find_item
    @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:image,:product_name,:product_text,:category_id, :product_condition_id, :shipping_charge_id,:shipping_area_id,:days_to_ship_id,:price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
