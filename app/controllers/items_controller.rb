class ItemsController < ApplicationController
  before_action :authenticate_user! , only:[:new,:edit]
  # ログイン画面へ誘導
 
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

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    unless current_user.id == @item.user_id
      redirect_to action: :index
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :explanation, :price, :image, :category_id, :condition_id, :postage_id, :prefecture_id, :send_date_id).merge(user_id: current_user.id)
  end

end
