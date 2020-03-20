class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @images = Image.all
    @items = Item.all.order("id DESC").page(params[:page]).per(3)
  end

  def show
    @item = Item.find(params[:id])
    @favorite = Favorite.new
  end

  def new
    @item = Item.new
    @item.images.new
      #セレクトボックスの初期値設定
      @category_parent_array = Category.where(ancestry: nil).pluck(:name)
      @category_parent_array.unshift("---")
  end

  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
  #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def create
    @item = Item.new(item_params)
    @item.region = @item.prefecture.name

    if @item.save!
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @category_parent_array = Category.where(ancestry: nil).pluck(:name)
    @category_parent_array.unshift("---")

  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else 
      render :edit
    end
  end

  def destroy
    if user_signed_in? && current_user.id == @item.saler_id && @item.destroy
      redirect_to root_path
    else
      render :edit
    end
  end
  
  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :price, :size, :brand, :detail, :prefecture_id, :category_id,
                                 :status, :fee, :shipping_date, images_attributes: [:picture, :_destroy, :id]).merge(saler_id: current_user.id)
  end
end
