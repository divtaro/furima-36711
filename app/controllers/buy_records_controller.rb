class BuyRecordsController < ApplicationController
  # //ログアウト状態の場合は、商品購入ページに遷移しようとすると、商品の販売状況に関わらずログインページに遷移する
  before_action :authenticate_user!, expect: [:index]
  before_action :set_item
  before_action :set_redirect

  def index
    @buy_form = BuyForm.new

    # //自分で出品した商品の購入ページへの遷移禁止（URL直入力含む）
    redirect_to root_path if current_user == @item.user
  end

  def create
    @buy_form = BuyForm.new(buy_record_params)
    if @buy_form.valid?
      pay_item
      @buy_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_record_params
    params.require(:buy_form).permit(:post_code, :prefecture_id, :municipalities, :house_num,
                                     :building, :tel).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  # //ログイン状態の場合でも、他人が出品した売却済み商品の商品購入ページへ遷移しようとするとトップページに遷移
  def set_redirect
    redirect_to root_path if @item.user_id != current_user.id && !@item.buy_record.nil?
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: buy_record_params[:token],
      currency: 'jpy'
    )
  end
end
