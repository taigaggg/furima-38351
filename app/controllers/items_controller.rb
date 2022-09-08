class ItemsController < ApplicationController
  before_action :authenticate_user! , only:[:new,:edit, :destroy]
  # ログイン画面へ誘導
  before_action :set_item, only: [:edit, :show, :update, :destroy]

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

  end

  def edit
    if (current_user.id == @item.user_id) && (@item.purchase.present?)
      redirect_to action: :index
    elsif current_user.id == @item.user_id
      render :edit
    else
      redirect_to action: :index
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user_id
      @item.destroy
    end
    redirect_to action: :index
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :explanation, :price, :image, :category_id, :condition_id, :postage_id, :prefecture_id, :send_date_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
