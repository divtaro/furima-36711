class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_redirect, only: [:edit, :destroy]

  def index
    @items = Item.order('id DESC')
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

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :status_id, :delivery_charge_id, :prefecture_id,
                                 :days_ship_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_redirect
    # redirect_to action: :index unless @item.user_id == current_user.id
    # ↓if文で書き換え
    
    # ログイン状態の場合でも、自身が出品していない商品の商品情報編集ページへ遷移しようとすると、商品の販売状況に関わらずトップページに遷移する
    # または
    # ログイン状態の場合でも、自身が出品した売却済み商品の商品情報編集ページへ遷移しようとすると、トップページに遷移する
    if @item.user_id != current_user.id || @item.buy_record != nil
      redirect_to action: :index 
    end
  end
end
