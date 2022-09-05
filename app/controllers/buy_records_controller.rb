class BuyRecordsController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @buy_form = BuyForm.new

    if current_user == @item.user
     redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @buy_form = BuyForm.new(buy_record_params)
    if @buy_form.valid? 
      @buy_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_record_params 
    params.require(:buy_form).permit(:post_code, :prefecture_id, :municipalities, :house_num,
                                     :building, :tel).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end