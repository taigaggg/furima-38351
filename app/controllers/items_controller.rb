class ItemsController < ApplicationController
 
  def index
    @items = Item.all.order("created_at DESC")
    # 記事が新規投稿順に並ぶように設定した
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

  private

  def item_params
    params.require(:item).permit(:item_name, :explanation, :price, :image, :category_id, :condition_id, :postage_id, :prefecture_id, :send_date_id).merge(user_id: current_user.id)
  end

end
