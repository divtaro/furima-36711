class ItemsController < ApplicationController
  def index
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :status_id, :delivery_charge_id, :prefecture_id, :days_ship_id, :price, :image).merge(user_id: current_user.id)
  end
end